
#> stardust:custom_blocks/stardust_dungeon_portal/place_main
#
# @within	stardust:custom_blocks/place
#			stardust:dimensions/structure/dungeon/final [ in stardust:dungeon & positioned -9 66 3 ]
#

tag @s add stardust.placer
setblock ~ ~ ~ air strict
setblock ~ ~ ~ minecraft:red_nether_bricks
execute align xyz positioned ~.5 ~.5 ~.5 summon item_display at @s run function stardust:custom_blocks/stardust_dungeon_portal/place_secondary
tag @s remove stardust.placer

# Increment count scores
scoreboard players add #total_custom_blocks stardust.data 1
scoreboard players add #total_vanilla_red_nether_bricks stardust.data 1
scoreboard players add #total_stardust_dungeon_portal stardust.data 1

