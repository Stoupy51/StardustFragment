
#> stardust:dimensions/portals/handle_player
#
# @executed	as @a[distance=..1] & at @s
#
# @within	stardust:custom_blocks/cavern_portal/second {"portal":"cavern_portal"} [ as @a[distance=..1] & at @s ]
#			stardust:custom_blocks/celestial_portal/second {"portal":"celestial_portal"} [ as @a[distance=..1] & at @s ]
#			stardust:custom_blocks/stardust_portal/second {"portal":"stardust_portal"} [ as @a[distance=..1] & at @s ]
#			stardust:custom_blocks/stardust_dungeon_portal/second {"portal":"stardust_dungeon_portal"} [ as @a[distance=..1] & at @s ]
#			stardust:custom_blocks/ultimate_portal/second {"portal":"ultimate_portal"} [ as @a[distance=..1] & at @s ]
#
# @args		portal (string)
#

# If player's teleportation is < global_second, set it to global_second + 5
execute unless score @s stardust.teleportation >= #global_second stardust.data run function stardust:dimensions/portals/init_teleportation

# If not teleported but teleporting, add nausea effect
execute unless score @s stardust.teleported matches 1 if score @s stardust.teleportation > #global_second stardust.data run effect give @s minecraft:nausea 5 255 true

# If not teleported, and teleportation = global_second, teleport and set teleported
$execute unless score @s stardust.teleported matches 1 if score @s stardust.teleportation = #global_second stardust.data run function stardust:custom_blocks/$(portal)/teleport_player

# If teleported and teleportation >= global_second, continue to increment teleportation (to avoid re-teleporting)
execute if score @s stardust.teleported matches 1 if score @s stardust.teleportation >= #global_second stardust.data run scoreboard players add @s stardust.teleportation 1

