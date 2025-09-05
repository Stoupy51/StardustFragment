
#> stardust:custom_blocks/stardust_cable/place_main
#
# @executed	positioned ~ ~ ~-8
#
# @within	stardust:custom_blocks/_player_head/search_stardust_cable_z [ positioned ~ ~ ~-8 ]
#			stardust:custom_blocks/_player_head/search_stardust_cable_z [ positioned ~ ~ ~-7 ]
#			stardust:custom_blocks/_player_head/search_stardust_cable_z [ positioned ~ ~ ~-6 ]
#			stardust:custom_blocks/_player_head/search_stardust_cable_z [ positioned ~ ~ ~-5 ]
#			stardust:custom_blocks/_player_head/search_stardust_cable_z [ positioned ~ ~ ~-4 ]
#			stardust:custom_blocks/_player_head/search_stardust_cable_z [ positioned ~ ~ ~-3 ]
#			stardust:custom_blocks/_player_head/search_stardust_cable_z [ positioned ~ ~ ~-2 ]
#			stardust:custom_blocks/_player_head/search_stardust_cable_z [ positioned ~ ~ ~-1 ]
#			stardust:custom_blocks/_player_head/search_stardust_cable_z [ positioned ~ ~ ~0 ]
#			stardust:custom_blocks/_player_head/search_stardust_cable_z [ positioned ~ ~ ~1 ]
#			stardust:custom_blocks/_player_head/search_stardust_cable_z [ positioned ~ ~ ~2 ]
#			stardust:custom_blocks/_player_head/search_stardust_cable_z [ positioned ~ ~ ~3 ]
#			stardust:custom_blocks/_player_head/search_stardust_cable_z [ positioned ~ ~ ~4 ]
#			stardust:custom_blocks/_player_head/search_stardust_cable_z [ positioned ~ ~ ~5 ]
#			stardust:custom_blocks/_player_head/search_stardust_cable_z [ positioned ~ ~ ~6 ]
#			stardust:custom_blocks/_player_head/search_stardust_cable_z [ positioned ~ ~ ~7 ]
#			stardust:custom_blocks/_player_head/search_stardust_cable_z [ positioned ~ ~ ~8 ]
#

tag @s add stardust.placer
setblock ~ ~ ~ air
setblock ~ ~ ~ minecraft:player_head{profile:{'id': [-709098200, 1001541428, -2043264882, -430220135], 'properties': [{'name': 'textures', 'value': 'eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvM2Y4NDVlMzBlNmVjOGI0N2RmZWUxMzI5NmQzYjQ3NzY5YzVjMGE5Nzc3YzNkNTk2ZWJiNDA3ZmY3OTcwNDE1ZCJ9fX0='}]}}
execute align xyz positioned ~.5 ~.5 ~.5 summon item_display at @s run function stardust:custom_blocks/stardust_cable/place_secondary
tag @s remove stardust.placer

# Increment count scores
scoreboard players add #total_custom_blocks stardust.data 1
scoreboard players add #total_vanilla_player_head stardust.data 1
scoreboard players add #total_stardust_cable stardust.data 1

