
#> stardust:dimensions/portals/init_teleportation
#
# @executed	as @a[distance=..1] & at @s
#
# @within	stardust:dimensions/portals/handle_player
#

# Reset teleported boolean and set teleportation to global_second + 5
scoreboard players reset @s stardust.teleported
scoreboard players set @s stardust.teleportation 5
scoreboard players operation @s stardust.teleportation += #global_second stardust.data
scoreboard players set #teleporting stardust.data 1

# Portal sound
playsound minecraft:block.portal.trigger ambient @s ~ ~ ~ 0.5

