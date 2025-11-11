
#> stardust:custom_blocks/cavern_portal/create_teleporter
#
# @within	???
#

# Teleport the player
tp @s ~ ~1 ~

# Place surrounding blocks
fill ~-3 ~-3 ~-3 ~3 ~4 ~3 minecraft:cobblestone strict
fill ~-2 ~-2 ~-2 ~2 ~3 ~2 minecraft:air
fill ~-1 ~-2 ~-1 ~1 ~-2 ~1 minecraft:cobblestone strict
fill ~-2 ~-2 ~-2 ~2 ~-2 ~2 minecraft:torch replace minecraft:air strict
fill ~-1 ~-1 ~-1 ~1 ~-1 ~1 minecraft:torch replace minecraft:air strict

# Place the cavern portal
scoreboard players set #infinite_energy stardust.data 1
execute positioned ~ ~-1 ~ run function stardust:custom_blocks/cavern_portal/place_main

