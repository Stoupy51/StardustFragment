
#> stardust:custom_blocks/life_crystal_block/place_main
#
# @within	stardust:custom_blocks/place
#

tag @s add stardust.placer
function stardust:custom_blocks/get_rotation
setblock ~ ~ ~ air
execute if score #rotation stardust.data matches 1 run setblock ~ ~ ~ minecraft:glass[facing=north]
execute if score #rotation stardust.data matches 2 run setblock ~ ~ ~ minecraft:glass[facing=east]
execute if score #rotation stardust.data matches 3 run setblock ~ ~ ~ minecraft:glass[facing=south]
execute if score #rotation stardust.data matches 4 run setblock ~ ~ ~ minecraft:glass[facing=west]
execute align xyz positioned ~.5 ~.5 ~.5 summon item_display at @s run function stardust:custom_blocks/life_crystal_block/place_secondary
tag @s remove stardust.placer

# Increment count scores
scoreboard players add #total_custom_blocks stardust.data 1
scoreboard players add #total_vanilla_glass stardust.data 1
scoreboard players add #total_life_crystal_block stardust.data 1

