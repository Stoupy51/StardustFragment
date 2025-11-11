
# ruff: noqa: E501
# Imports
import os

from beet import Predicate
from stewbeet.core import Conventions, JsonDict, Mem, set_json_encoder, write_function, write_load_file, write_versioned_function
from stouputils.io import relative_path


# Setup dimensions
def setup_dimensions() -> None:
	ns: str = Mem.ctx.project_id

	## Load dimension structures
	# Retrieve structure files
	structure_folder: str = f"{Mem.ctx.directory}/src/data/{ns}/structure"
	all_files: list[str] = [relative_path(f"{root}/{file}") for root, _, files in os.walk(structure_folder) for file in files]
	dungeon_parts: list[str] = [file.split("/")[-1].replace(".nbt", "") for file in all_files if "dungeon_part_" in file]
	ultimate_parts: list[str] = [file.split("/")[-1].replace(".nbt", "") for file in all_files if "ultimate_part_" in file]
	place_dungeon_parts: list[tuple[str, str]] = [(part, part.split("part_")[-1].replace("_", " ")) for part in dungeon_parts]
	place_ultimate_parts: list[tuple[str, str]] = [(part, part.split("part_")[-1].replace("_", " ")) for part in ultimate_parts]

	# Extract min/max coordinates from structure file names (+48 to max to cover full structure area)
	def get_bounds(parts: list[str], x_index: int = -3, z_index: int = -1) -> tuple[int, int, int, int]:
		x_coords = [int(x.split("_")[x_index].split(".")[0]) for x in parts]
		z_coords = [int(x.split("_")[z_index].split(".")[0]) for x in parts]
		return min(x_coords), min(z_coords), max(x_coords)+48, max(z_coords)+48
	dungeon_min_x, dungeon_min_z, dungeon_max_x, dungeon_max_z = get_bounds(dungeon_parts)
	ultimate_min_x, ultimate_min_z, ultimate_max_x, ultimate_max_z = get_bounds(ultimate_parts)

	# Call when loading
	write_load_file(f"""
# Make sure dimensions are built
execute unless score #dungeon_built {ns}.data matches 1 in {ns}:dungeon run forceload add {dungeon_min_x} {dungeon_min_z} {dungeon_max_x} {dungeon_max_z}
execute unless score #ultimate_built {ns}.data matches 1 in {ns}:ultimate run forceload add {ultimate_min_x} {ultimate_min_z} {ultimate_max_x} {ultimate_max_z}
schedule function {ns}:dimensions/load 2s
""", prepend=True)
	write_function(f"{ns}:dimensions/load", f"""
execute unless score #dungeon_built {ns}.data matches 1 in {ns}:dungeon run function {ns}:dimensions/structure/dungeon
execute unless score #ultimate_built {ns}.data matches 1 in {ns}:ultimate run function {ns}:dimensions/structure/ultimate
""")
	## Load dimension structures
	for dimension, name, min_x, min_z, max_x, max_z, place_parts in [
		("dungeon", "Stardust Dungeon", dungeon_min_x, dungeon_min_z, dungeon_max_x, dungeon_max_z, place_dungeon_parts),
		("ultimate", "Ultimate Dimension", ultimate_min_x, ultimate_min_z, ultimate_max_x, ultimate_max_z, place_ultimate_parts),
	]:
		if dimension == "dungeon":
			place_dungeon_portal: str = f"""
# Place the stardust dungeon portal
scoreboard players set #infinite_energy {ns}.data 1
execute positioned -9 66 3 run function {ns}:custom_blocks/stardust_dungeon_portal/place_main
"""
		else:
			place_dungeon_portal: str = ""

		# Place structure function
		write_function(f"{ns}:dimensions/structure/{dimension}", f"""
# Kill entities in the {name} before loading
kill @e[type=!player,x={min_x},y=-60,z={min_z},dx={max_x - min_x},dy=300,dz={max_z - min_z}]
kill @e[type=!player,x={min_x},y=-60,z={min_z},dx={max_x - min_x},dy=300,dz={max_z - min_z}]

# Load structure parts (stop on failure)
scoreboard players set #success {ns}.data 1
{"\n".join(f'execute if score #success {ns}.data matches 1 store success score #success {ns}.data run place template {ns}:{part} {pos}' for part, pos in place_parts)}
{place_dungeon_portal}
# Mark dimension as built if successful
forceload remove {min_x} {min_z} {max_x} {max_z}
execute if score #success {ns}.data matches 1 run scoreboard players set #{dimension}_built {ns}.data 1
execute if score #success {ns}.data matches 0 run tellraw @a {{"text":"Stardust Fragment Error: The {name} couldn't be load. Something blocked the '/forceload' command in {ns}:{dimension}","color":"red"}}
""")

	# TODO: Adventure mode in Stardust Dungeon.

	## Connect dimensions between them
	# Functions to check if some datapacks are installed
	for pack, objective in [("expansion", "exp.const"), ("bracken", "bp.var")]:
		write_function(f"{ns}:dimensions/is_{pack}_installed", f"""
# Check if the {pack} is installed
execute unless score #stoupy51 {objective} matches 1 run return 1
return fail
""")

	# Predicate to check if entity is outside dimensions and needs teleportation
	has_brain: JsonDict = {"condition":"minecraft:entity_properties","entity":"this","predicate":{"nbt":"{Brain:{}}"}}
	outside_range: JsonDict = {"condition":"minecraft:inverted","term":{"condition":"minecraft:location_check","predicate":{"position":{"y":{"min":-32,"max":500}}}}}
	in_my_dimensions: JsonDict = {"condition":"minecraft:any_of","terms":[
		{"condition":"minecraft:location_check","predicate":{"dimension":"minecraft:overworld","position":{"y":{"min":500}}}},
		*[{"condition":"minecraft:location_check","predicate":{"dimension":f"stardust:{dim}"}} for dim in ["celestial", "stardust", "dungeon", "ultimate"]],
	]}
	predicate: JsonDict = {"condition":"minecraft:all_of","terms":[has_brain, outside_range, in_my_dimensions]}
	Mem.ctx.data[ns].predicates["transitions/outside"] = set_json_encoder(Predicate(predicate), max_level=4)

	# Predicates for transition up and down
	Mem.ctx.data[ns].predicates["transitions/up"] = set_json_encoder(Predicate({"condition":"minecraft:location_check","predicate":{"position":{"y":{"min":500}}}}))
	Mem.ctx.data[ns].predicates["transitions/down"] = set_json_encoder(Predicate({"condition":"minecraft:location_check","predicate":{"position":{"y":{"max":-32}}}}))

	# Every second, check for entities outside dimensions
	write_versioned_function("second", f"""
# Dimension transitions for entities
execute as @e[{Conventions.AVOID_ENTITY_TAGS_NO_KILL},predicate=stardust:transitions/outside] at @s run function {ns}:dimensions/transitions/check
""")
	write_function(f"{ns}:dimensions/transitions/check", f"""
# If player and transition is up, run upward transition
execute if entity @s[type=player] if predicate stardust:transitions/up run return run function {ns}:dimensions/transitions/upward

# Else, if transition is down, run downward transition
execute if predicate stardust:transitions/down run function {ns}:dimensions/transitions/downward
""")

	# Upward transition function
	write_function(f"{ns}:dimensions/transitions/upward", f"""
# If dimension is overworld, and expansion or bracken pack is installed, stop here (to avoid conflicts)
execute if dimension minecraft:overworld if function stardust:dimensions/is_expansion_installed run return fail
execute if dimension minecraft:overworld if function stardust:dimensions/is_bracken_installed run return fail

# If player is in overworld, teleport to celestial dimension
execute if dimension minecraft:overworld in {ns}:celestial run return run tp @s ~ 16 ~

# If player is in celestial, teleport to stardust dimension
execute if dimension {ns}:celestial in {ns}:stardust run return run tp @s ~ 16 ~
""")

	# Downward transition function
	write_function(f"{ns}:dimensions/transitions/downward", f"""
# Bracken pack compatibility: If dimension is celestial, teleport to pax
execute if function {ns}:dimensions/is_bracken_installed if dimension {ns}:celestial in bracken:pax run tp @s ~ 575 ~

# If dimension is ultimate, teleport to stardust dimension
execute if dimension {ns}:ultimate in {ns}:stardust run return run tp @s ~ 480 ~

# If dimension is stardust, teleport to celestial dimension
execute if dimension {ns}:stardust in {ns}:celestial run return run tp @s ~ 480 ~

# If dimension is celestial, teleport to overworld
execute if dimension {ns}:celestial in minecraft:overworld run return run tp @s ~ 480 ~

# If dimension is dungeon, teleport back to home
execute if dimension {ns}:dungeon run return run function {ns}:dimensions/teleport_home
""")

