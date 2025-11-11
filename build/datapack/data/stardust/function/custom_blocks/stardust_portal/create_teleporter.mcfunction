
#> stardust:custom_blocks/stardust_portal/create_teleporter
#
# @within	???
#

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
scoreboard players set #infinite_energy stardust.data 1
execute positioned ~ ~-1 ~ run function stardust:custom_blocks/stardust_portal/place_main

