
#> stardust:custom_blocks/sextuple_compressed_cobblestone/place_main
#
# @within	stardust:custom_blocks/place
#

tag @s add stardust.placer
setblock ~ ~ ~ air
setblock ~ ~ ~ minecraft:obsidian
execute align xyz positioned ~.5 ~.5 ~.5 summon item_display at @s run function stardust:custom_blocks/sextuple_compressed_cobblestone/place_secondary
tag @s remove stardust.placer

# Increment count scores
scoreboard players add #total_custom_blocks stardust.data 1
scoreboard players add #total_vanilla_obsidian stardust.data 1
scoreboard players add #total_sextuple_compressed_cobblestone stardust.data 1

