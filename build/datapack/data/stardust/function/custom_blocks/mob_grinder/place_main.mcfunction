
#> stardust:custom_blocks/mob_grinder/place_main
#
# @within	stardust:custom_blocks/place
#

tag @s add stardust.placer
function stardust:custom_blocks/get_rotation
setblock ~ ~ ~ air
execute if score #rotation stardust.data matches 1 run setblock ~ ~ ~ minecraft:barrel[facing=north]{"CustomName": {"translate": "stardust.mob_grinder","italic": false,"color": "white"}}
execute if score #rotation stardust.data matches 2 run setblock ~ ~ ~ minecraft:barrel[facing=east]{"CustomName": {"translate": "stardust.mob_grinder","italic": false,"color": "white"}}
execute if score #rotation stardust.data matches 3 run setblock ~ ~ ~ minecraft:barrel[facing=south]{"CustomName": {"translate": "stardust.mob_grinder","italic": false,"color": "white"}}
execute if score #rotation stardust.data matches 4 run setblock ~ ~ ~ minecraft:barrel[facing=west]{"CustomName": {"translate": "stardust.mob_grinder","italic": false,"color": "white"}}
execute align xyz positioned ~.5 ~.5 ~.5 summon item_display at @s run function stardust:custom_blocks/mob_grinder/place_secondary
tag @s remove stardust.placer

# Increment count scores
scoreboard players add #total_custom_blocks stardust.data 1
scoreboard players add #total_vanilla_barrel stardust.data 1
scoreboard players add #total_mob_grinder stardust.data 1

