
# ruff: noqa: E501
# Imports
import os

from stewbeet.core import Mem, write_function, write_load_file
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

