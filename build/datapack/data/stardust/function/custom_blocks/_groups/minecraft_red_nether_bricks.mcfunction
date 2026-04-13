
#> stardust:custom_blocks/_groups/minecraft_red_nether_bricks
#
# @executed	as @e[type=item_display,tag=stardust.custom_block,predicate=!stardust:advanced_check_vanilla_blocks] & at @s
#
# @within	stardust:custom_blocks/destroy
#

execute if score #total_stardust_dungeon_portal stardust.data matches 1.. if entity @s[tag=stardust.stardust_dungeon_portal] run function stardust:custom_blocks/stardust_dungeon_portal/destroy

