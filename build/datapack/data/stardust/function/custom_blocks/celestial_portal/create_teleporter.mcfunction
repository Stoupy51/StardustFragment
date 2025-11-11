
#> stardust:custom_blocks/celestial_portal/create_teleporter
#
# @within	???
#

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
scoreboard players set #infinite_energy stardust.data 1
execute positioned ~ ~-1 ~ run function stardust:custom_blocks/celestial_portal/place_main

