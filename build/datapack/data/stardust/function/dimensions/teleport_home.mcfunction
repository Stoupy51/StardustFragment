
#> stardust:dimensions/teleport_home
#
# @executed	in stardust:cavern
#
# @within	stardust:custom_blocks/cavern_portal/find_teleporter
#			stardust:custom_blocks/celestial_portal/find_teleporter
#			stardust:custom_blocks/stardust_portal/find_teleporter
#			stardust:custom_blocks/stardust_dungeon_portal/find_teleporter
#			stardust:custom_blocks/ultimate_portal/find_teleporter
#

# If no respawn nbt, teleport to world spawn
execute unless data entity @s respawn run return run function stardust:dimensions/teleport_to with storage stardust:main world_spawn

# Else, teleport to respawn location
data modify storage stardust:temp macro set value {x:0,y:0,z:0,yaw:0.0f,pitch:0.0f,dimension:"minecraft:overworld"}
data modify storage stardust:temp macro.x set from entity @s respawn.pos[0]
data modify storage stardust:temp macro.y set from entity @s respawn.pos[1]
data modify storage stardust:temp macro.z set from entity @s respawn.pos[2]
data modify storage stardust:temp macro.yaw set from entity @s respawn.yaw
data modify storage stardust:temp macro.pitch set from entity @s respawn.pitch
data modify storage stardust:temp macro.dimension set from entity @s respawn.dimension
function stardust:dimensions/teleport_to with storage stardust:temp macro

# If respawn point is invalid (e.g. in the void), teleport to world spawn instead
execute at @s if loaded ~ ~ ~ unless block ~ ~ ~ #minecraft:beds unless block ~ ~-1 ~ minecraft:respawn_anchor run function stardust:dimensions/teleport_to with storage stardust:main world_spawn

