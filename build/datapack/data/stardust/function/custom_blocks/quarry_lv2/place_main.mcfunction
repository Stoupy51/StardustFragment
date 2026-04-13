
#> stardust:custom_blocks/quarry_lv2/place_main
#
# @within	stardust:custom_blocks/place
#

tag @s add stardust.placer
setblock ~ ~ ~ air strict
setblock ~ ~ ~ minecraft:barrel{"CustomName": [{"translate":"stardust.quarry_lv","italic": false}, ".2"]}
execute align xyz positioned ~0.5 ~0.5 ~0.5 summon item_display at @s run function stardust:custom_blocks/quarry_lv2/place_secondary
tag @s remove stardust.placer

# Increment count scores
scoreboard players add #total_custom_blocks stardust.data 1
scoreboard players add #total_vanilla_barrel stardust.data 1
scoreboard players add #total_quarry_lv2 stardust.data 1

