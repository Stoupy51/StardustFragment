
#> stardust:custom_blocks/stardust_battery/place_main
#
# @within	stardust:custom_blocks/place
#

tag @s add stardust.placer
setblock ~ ~ ~ air
setblock ~ ~ ~ minecraft:diamond_block
execute align xyz positioned ~.5 ~.5 ~.5 summon item_display at @s run function stardust:custom_blocks/stardust_battery/place_secondary
tag @s remove stardust.placer

# Increment count scores
scoreboard players add #total_custom_blocks stardust.data 1
scoreboard players add #total_vanilla_diamond_block stardust.data 1
scoreboard players add #total_stardust_battery stardust.data 1

