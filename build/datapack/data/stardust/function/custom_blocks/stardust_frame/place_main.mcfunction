
#> stardust:custom_blocks/stardust_frame/place_main
#
# @within	???
#

tag @s add stardust.placer
setblock ~ ~ ~ air
setblock ~ ~ ~ minecraft:lapis_block
execute align xyz positioned ~.5 ~.5 ~.5 summon item_display at @s run function stardust:custom_blocks/stardust_frame/place_secondary
tag @s remove stardust.placer

# Increment count scores
scoreboard players add #total_custom_blocks stardust.data 1
scoreboard players add #total_vanilla_lapis_block stardust.data 1
scoreboard players add #total_stardust_frame stardust.data 1

