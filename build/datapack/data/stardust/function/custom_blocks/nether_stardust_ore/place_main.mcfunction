
#> stardust:custom_blocks/nether_stardust_ore/place_main
#
# @within	stardust:custom_blocks/place
#

tag @s add stardust.placer
setblock ~ ~ ~ air
setblock ~ ~ ~ minecraft:polished_deepslate
execute align xyz positioned ~.5 ~.5 ~.5 summon item_display at @s run function stardust:custom_blocks/nether_stardust_ore/place_secondary
tag @s remove stardust.placer

# Increment count scores
scoreboard players add #total_custom_blocks stardust.data 1
scoreboard players add #total_vanilla_polished_deepslate stardust.data 1
scoreboard players add #total_nether_stardust_ore stardust.data 1

