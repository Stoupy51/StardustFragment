
#> stardust:custom_blocks/advanced_furnace_generator/place_main
#
# @within	stardust:custom_blocks/place
#

tag @s add stardust.placer
setblock ~ ~ ~ air
setblock ~ ~ ~ minecraft:barrel{"CustomName": {"translate": "stardust.advanced_furnace_generator","italic": false,"color": "white"}}
execute align xyz positioned ~.5 ~.5 ~.5 summon item_display at @s run function stardust:custom_blocks/advanced_furnace_generator/place_secondary
tag @s remove stardust.placer

# Increment count scores
scoreboard players add #total_custom_blocks stardust.data 1
scoreboard players add #total_vanilla_barrel stardust.data 1
scoreboard players add #total_advanced_furnace_generator stardust.data 1

