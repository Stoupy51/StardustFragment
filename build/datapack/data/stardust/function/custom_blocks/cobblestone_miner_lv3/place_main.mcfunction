
#> stardust:custom_blocks/cobblestone_miner_lv3/place_main
#
# @within	stardust:custom_blocks/place
#

tag @s add stardust.placer
setblock ~ ~ ~ air strict
setblock ~ ~ ~ minecraft:deepslate
execute align xyz positioned ~.5 ~.5 ~.5 summon item_display at @s run function stardust:custom_blocks/cobblestone_miner_lv3/place_secondary
tag @s remove stardust.placer

# Increment count scores
scoreboard players add #total_custom_blocks stardust.data 1
scoreboard players add #total_vanilla_deepslate stardust.data 1
scoreboard players add #total_cobblestone_miner_lv3 stardust.data 1

