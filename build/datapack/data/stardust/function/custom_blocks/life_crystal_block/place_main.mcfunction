
#> stardust:custom_blocks/life_crystal_block/place_main
#
# @within	stardust:custom_blocks/place
#			stardust:calls/smart_ore_generation/veins/life_crystal_block [ at @s & positioned ~ ~1 ~ ]
#

tag @s add stardust.placer
function stardust:custom_blocks/get_rotation
setblock ~ ~ ~ air strict
setblock ~ ~ ~ minecraft:glass
execute align xyz positioned ~.5 ~.5 ~.5 summon item_display at @s run function stardust:custom_blocks/life_crystal_block/place_secondary
tag @s remove stardust.placer

# Increment count scores
scoreboard players add #total_custom_blocks stardust.data 1
scoreboard players add #total_vanilla_glass stardust.data 1
scoreboard players add #total_life_crystal_block stardust.data 1

