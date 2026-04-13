
#> stardust:custom_blocks/quadruple_compressed_cobblestone/place_main
#
# @within	stardust:custom_blocks/place
#

tag @s add stardust.placer
setblock ~ ~ ~ air strict
setblock ~ ~ ~ minecraft:cobbled_deepslate
execute align xyz positioned ~0.5 ~0.5 ~0.5 summon item_display at @s run function stardust:custom_blocks/quadruple_compressed_cobblestone/place_secondary
tag @s remove stardust.placer

# Increment count scores
scoreboard players add #total_custom_blocks stardust.data 1
scoreboard players add #total_vanilla_cobbled_deepslate stardust.data 1
scoreboard players add #total_quadruple_compressed_cobblestone stardust.data 1

