
# ruff: noqa: E501
# Imports
import os

from stewbeet.core import JsonDict, LootTable, Mem, set_json_encoder, write_function, write_load_file
from stouputils.io import get_root_path, relative_path, super_json_load


# Setup portals
def setup_portals() -> None:
	ns: str = Mem.ctx.project_id

	# Constants
	# TODO
	portals: dict[str, JsonDict] = {
		"cavern":    {"item": "cavern_portal",           "particle": r"soul ~ ~2 ~ 0.25 1 0.25 0.05 1"},
		"celestial": {"item": "celestial_portal",        "particle": r"firework ~ ~2 ~ 0.25 1 0.25 0.05 1"},
		"stardust":  {"item": "stardust_portal",         "particle": r"dust{color:[0,0,1],scale:1} ~ ~2 ~ 0.25 1 0.25 0.05 5"},
		"dungeon":   {"item": "stardust_dungeon_portal", "particle": r"dripping_dripstone_lava ~ ~2 ~ 0.25 1 0.25 0.05 5"},
		"ultimate":  {"item": "ultimate_portal",         "particle": r"dripping_obsidian_tear ~ ~2 ~ 0.25 1 0.25 0.05 5"},
	}

	# Write a bunch of objectives
	write_load_file(f"""
# Track teleportation through portals
scoreboard objectives add {ns}.teleportation dummy
scoreboard objectives add {ns}.teleported dummy
""", prepend=True)

	# Common functions
	write_function(f"{ns}:dimensions/portals/handle_player", f"""
# If player's teleportation is < global_second, set it to global_second + 5
execute unless score @s {ns}.teleportation >= #global_second {ns}.data run function {ns}:dimensions/portals/init_teleportation

# If not teleported but teleporting, add nausea effect
execute unless score @s {ns}.teleported matches 1 if score @s {ns}.teleportation > #global_second {ns}.data run effect give @s minecraft:nausea 5 255 true

# If not teleported, and teleportation = global_second, teleport and set teleported
$execute unless score @s {ns}.teleported matches 1 if score @s {ns}.teleportation = #global_second {ns}.data run function {ns}:custom_blocks/$(portal)/teleport_player

# If teleported and teleportation >= global_second, continue to increment teleportation (to avoid re-teleporting)
execute if score @s {ns}.teleported matches 1 if score @s {ns}.teleportation >= #global_second {ns}.data run scoreboard players add @s {ns}.teleportation 1
""")
	write_function(f"{ns}:dimensions/portals/init_teleportation", f"""
# Reset teleported boolean and set teleportation to global_second + 5
scoreboard players reset @s {ns}.teleported
scoreboard players set @s {ns}.teleportation 5
scoreboard players operation @s {ns}.teleportation += #global_second {ns}.data

# Portal sound
playsound minecraft:block.portal.trigger ambient @s ~ ~ ~ 0.5
say Initialized teleportation for @s
""")

	# For each portal,
	for portal, data in portals.items():
		item: str = data["item"]
		particle: str = data["particle"]

		# Write second function
		write_function(f"{ns}:custom_blocks/{item}/second", f"""
# Energy checks
execute if score @s[tag=!{ns}.infinite_energy] energy.storage < @s {ns}.energy_rate run return 0
scoreboard players operation @s[tag=!{ns}.infinite_energy] energy.storage -= @s {ns}.energy_rate

# Particles
particle {particle}

# If there is a player standing on the portal, handle it
execute positioned ~ ~1 ~ as @a[distance=..1] at @s run function {ns}:dimensions/portals/handle_player {{"portal":"{item}"}}
""")
		# Write teleport player function
		write_function(f"{ns}:custom_blocks/{item}/teleport_player", f"""
# Particles before teleport (x100)
particle {particle}00

# Teleport the player
scoreboard players set @s {ns}.teleported 1
# TODO
say teleporting @s via {item} portal!

# Teleported sound and particles (x100)
execute at @s run playsound minecraft:block.portal.travel ambient @s ~ ~ ~ 0.3
#execute at @s run particle {particle}00
""")

