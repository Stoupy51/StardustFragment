
# ruff: noqa: E501
# Imports
from stewbeet import write_versioned_function
from stewbeet.core import JsonDict, Mem, write_function, write_load_file


# Setup portals
def setup_portals() -> None:
	ns: str = Mem.ctx.project_id

	# Constants
	PORTALS: dict[str, JsonDict] = {
		"cavern":    {"item": "cavern_portal",           "particle": r"soul ~ ~2 ~ 0.25 1 0.25 0.05 5"},
		"celestial": {"item": "celestial_portal",        "particle": r"firework ~ ~2 ~ 0.25 1 0.25 0.05 5"},
		"stardust":  {"item": "stardust_portal",         "particle": r"dust{color:[0,0,1],scale:1} ~ ~2 ~ 0.25 1 0.25 0.05 15"},
		"dungeon":   {"item": "stardust_dungeon_portal", "particle": r"dripping_dripstone_lava ~ ~2 ~ 0.25 1 0.25 0.05 15"},
		"ultimate":  {"item": "ultimate_portal",         "particle": r"dripping_obsidian_tear ~ ~2 ~ 0.25 1 0.25 0.05 15"},
	}
	PORTALS_STRUCTURE: dict[str, str] = {
		"cavern": f"""
# If area isn't loaded, stop here
execute unless loaded ~ ~ ~ run return run scoreboard players set @s {ns}.teleported 0

# Teleport the player
tp @s ~ ~1 ~

# Place surrounding blocks
fill ~-3 ~-3 ~-3 ~3 ~4 ~3 minecraft:cobblestone strict
fill ~-2 ~-2 ~-2 ~2 ~3 ~2 minecraft:air
fill ~-1 ~-2 ~-1 ~1 ~-2 ~1 minecraft:cobblestone strict
fill ~-2 ~-2 ~-2 ~2 ~-2 ~2 minecraft:torch replace minecraft:air strict
fill ~-1 ~-1 ~-1 ~1 ~-1 ~1 minecraft:torch replace minecraft:air strict

# Place the cavern portal
scoreboard players set #infinite_energy {ns}.data 1
execute positioned ~ ~-1 ~ run function {ns}:custom_blocks/cavern_portal/place_main
""",
		"celestial": f"""
# Teleport the player
tp @s ~ ~1 ~

# Place surrounding blocks
fill ~-3 ~-3 ~-3 ~3 ~3 ~3 minecraft:air
fill ~-3 ~-1 ~-3 ~3 ~-1 ~3 minecraft:white_concrete strict
fill ~-2 ~-2 ~-2 ~2 ~-2 ~2 minecraft:white_concrete strict
fill ~-1 ~-3 ~-1 ~1 ~-3 ~1 minecraft:white_concrete strict
setblock ~-3 ~-1 ~-3 minecraft:air
setblock ~3 ~-1 ~-3 minecraft:air
setblock ~-3 ~-1 ~3 minecraft:air
setblock ~3 ~-1 ~3 minecraft:air
setblock ~ ~-4 ~ minecraft:glowstone strict
setblock ~ ~-1 ~ minecraft:bedrock strict

# Place the celestial portal
scoreboard players set #infinite_energy {ns}.data 1
execute positioned ~ ~-1 ~ run function {ns}:custom_blocks/celestial_portal/place_main
""",
		"stardust": f"""
# Teleport the player
tp @s ~ ~1 ~

# Place surrounding blocks
fill ~-3 ~-3 ~-3 ~3 ~3 ~3 minecraft:air
fill ~-3 ~-1 ~-3 ~3 ~-1 ~3 minecraft:blue_concrete strict
fill ~-2 ~-2 ~-2 ~2 ~-2 ~2 minecraft:blue_concrete strict
fill ~-1 ~-3 ~-1 ~1 ~-3 ~1 minecraft:blue_concrete strict
setblock ~-3 ~-1 ~-3 minecraft:air
setblock ~3 ~-1 ~-3 minecraft:air
setblock ~-3 ~-1 ~3 minecraft:air
setblock ~3 ~-1 ~3 minecraft:air
setblock ~ ~-4 ~ minecraft:glowstone strict
setblock ~ ~ ~ minecraft:light_weighted_pressure_plate strict

# Place the stardust portal
scoreboard players set #infinite_energy {ns}.data 1
execute positioned ~ ~-1 ~ run function {ns}:custom_blocks/stardust_portal/place_main
""",
		"dungeon": f"""
# No portal to place, just teleport player
execute in {ns}:dungeon run tp @s -9 67.5 3 225 0
""",
		"ultimate": f"""
# No portal to place, just teleport player
execute in {ns}:ultimate run tp @s -24 68.5 25 -140 10
""",
	}

	# Write a bunch of objectives
	write_load_file(f"""
# Track teleportation through portals
scoreboard objectives add {ns}.teleportation dummy
scoreboard objectives add {ns}.teleported dummy

# Get world spawn position and dimension
execute summon marker run function {ns}:utils/get_world_spawn_from_marker
""", prepend=True)
	write_versioned_function("minute", f"""
# Get world spawn position and dimension every minute
execute summon marker run function {ns}:utils/get_world_spawn_from_marker
""")

	# Get world spawn position and dimension
	write_function(f"{ns}:utils/get_world_spawn_from_marker", f"""
# Store world spawn position
data modify storage {ns}:main world_spawn set value {{x:0,y:0,z:0,yaw:0.0f,pitch:0.0f,dimension:"minecraft:overworld"}}
execute store result storage {ns}:main world_spawn.x int 1 run data get entity @s Pos[0]
execute store result storage {ns}:main world_spawn.y int 1 run data get entity @s Pos[1]
execute store result storage {ns}:main world_spawn.z int 1 run data get entity @s Pos[2]
execute store result storage {ns}:main world_spawn.yaw float 1 run data get entity @s Rotation[0]
execute store result storage {ns}:main world_spawn.pitch float 1 run data get entity @s Rotation[1]

# Store world spawn dimension
execute positioned -30000000 51 1610 summon piglin_brute run function {ns}:utils/get_dimension_from_piglin

# Kill marker
kill @s
""")
	write_function(f"{ns}:utils/get_dimension_from_piglin", f"""
data modify storage {ns}:main world_spawn.dimension set from entity @s Brain.memories."minecraft:home".value.dimension
tp @s ~ -10000 ~
kill @s
""")

	# Common functions
	write_function(f"{ns}:dimensions/teleport_home", f"""
# Slow falling effect to avoid fall damage
effect give @s minecraft:slow_falling 3 255 true

# If no respawn nbt, teleport to world spawn
execute unless data entity @s respawn run return run function {ns}:dimensions/teleport_to with storage {ns}:main world_spawn

# Else, teleport to respawn location
data modify storage {ns}:temp macro set value {{x:0,y:0,z:0,yaw:0.0f,pitch:0.0f,dimension:"minecraft:overworld"}}
data modify storage {ns}:temp macro.x set from entity @s respawn.pos[0]
data modify storage {ns}:temp macro.y set from entity @s respawn.pos[1]
data modify storage {ns}:temp macro.z set from entity @s respawn.pos[2]
data modify storage {ns}:temp macro.yaw set from entity @s respawn.yaw
data modify storage {ns}:temp macro.pitch set from entity @s respawn.pitch
data modify storage {ns}:temp macro.dimension set from entity @s respawn.dimension
function {ns}:dimensions/teleport_to with storage {ns}:temp macro

# If respawn point is invalid (e.g. in the void), teleport to world spawn instead
execute at @s if loaded ~ ~ ~ unless block ~ ~ ~ #minecraft:beds unless block ~ ~-1 ~ minecraft:respawn_anchor run function {ns}:dimensions/teleport_to with storage {ns}:main world_spawn
""")
	write_function(f"{ns}:dimensions/teleport_to", "$execute in $(dimension) run tp @s $(x) $(y).6 $(z) $(yaw) $(pitch)")
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
scoreboard players set #teleporting {ns}.data 1

# Portal sound
playsound minecraft:block.portal.trigger ambient @s ~ ~ ~ 0.5
""")

	# For each portal,
	for dimension, data in PORTALS.items():
		portal: str = data["item"]
		particle: str = data["particle"]

		# Add infinite_energy tag if score is set
		write_function(f"{ns}:custom_blocks/{portal}/place_secondary", f"""
# Make the block have infinite energy if applicable
execute if score #infinite_energy {ns}.data matches 1 run tag @s add {ns}.infinite_energy
scoreboard players reset #infinite_energy {ns}.data
""")

		# Write second function
		write_function(f"{ns}:custom_blocks/{portal}/second", f"""
# Energy checks
execute if score @s[tag=!{ns}.infinite_energy] energy.storage < @s {ns}.energy_rate run return 0
scoreboard players operation @s[tag=!{ns}.infinite_energy] energy.storage -= @s {ns}.energy_rate

# Particles
particle {particle}

# If there is a player standing on the portal, handle it
scoreboard players set #teleporting {ns}.data 0
execute positioned ~ ~1 ~ as @a[distance=..1] at @s run function {ns}:dimensions/portals/handle_player {{"portal":"{portal}"}}
execute if score #teleporting {ns}.data matches 1 if dimension minecraft:overworld in {ns}:{dimension} run forceload add ~-50 ~-50 ~50 ~50
execute if score #teleporting {ns}.data matches 1 if dimension {ns}:{dimension} in minecraft:overworld run forceload add ~-50 ~-50 ~50 ~50
""")
		# Write teleport player function
		write_function(f"{ns}:custom_blocks/{portal}/teleport_player", f"""
# Particles before teleport (x100)
scoreboard players set @s {ns}.teleported 1
particle {particle}00

# Try to teleport player to the nearest teleporter.
# If unable, create a new one in the destination dimension (excluding overworld)
execute unless function {ns}:custom_blocks/{portal}/find_teleporter if dimension minecraft:overworld in {ns}:{dimension} run function {ns}:custom_blocks/{portal}/create_teleporter

# Stop function if not able to teleport (adding 1 to teleportation to try again a second later)
execute unless score @s {ns}.teleported matches 1 run return run scoreboard players add @s {ns}.teleportation 1

# Unforceload (still old location context here)
execute if dimension minecraft:overworld in {ns}:{dimension} run forceload remove ~-50 ~-50 ~50 ~50
execute if dimension {ns}:{dimension} in minecraft:overworld run forceload remove ~-50 ~-50 ~50 ~50

# Teleported sound and particles (x100)
execute at @s run playsound minecraft:block.portal.travel ambient @a[distance=..25] ~ ~ ~ 0.3
execute at @s run particle {particle}00
""")
		# Write find teleporter function
		write_function(f"{ns}:custom_blocks/{portal}/find_teleporter", f"""
execute if dimension minecraft:overworld in {ns}:{dimension} at @n[tag={ns}.{portal},distance=..100] run return run tp @s ~ ~1 ~
execute if dimension {ns}:{dimension} in minecraft:overworld at @n[tag={ns}.{portal},distance=..100] run return run tp @s ~ ~1 ~
execute if dimension {ns}:{dimension} run return run function {ns}:dimensions/teleport_home
return fail
""")
		# Write create teleporter function
		write_function(f"{ns}:custom_blocks/{portal}/create_teleporter", PORTALS_STRUCTURE.get(dimension, ""))

