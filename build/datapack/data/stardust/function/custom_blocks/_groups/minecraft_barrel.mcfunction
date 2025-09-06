
#> stardust:custom_blocks/_groups/minecraft_barrel
#
# @executed	as @e[type=item_display,tag=...,predicate=!stardust:check_vanilla_blocks] & at @s
#
# @within	stardust:custom_blocks/destroy
#

execute if score #total_quarry_lv1 stardust.data matches 1.. if entity @s[tag=stardust.quarry_lv1] run function stardust:custom_blocks/quarry_lv1/destroy
execute if score #total_quarry_lv2 stardust.data matches 1.. if entity @s[tag=stardust.quarry_lv2] run function stardust:custom_blocks/quarry_lv2/destroy
execute if score #total_quarry_lv3 stardust.data matches 1.. if entity @s[tag=stardust.quarry_lv3] run function stardust:custom_blocks/quarry_lv3/destroy
execute if score #total_quarry_lv4 stardust.data matches 1.. if entity @s[tag=stardust.quarry_lv4] run function stardust:custom_blocks/quarry_lv4/destroy
execute if score #total_quarry_lv5 stardust.data matches 1.. if entity @s[tag=stardust.quarry_lv5] run function stardust:custom_blocks/quarry_lv5/destroy
execute if score #total_quarry_creative stardust.data matches 1.. if entity @s[tag=stardust.quarry_creative] run function stardust:custom_blocks/quarry_creative/destroy
execute if score #total_cavern_portal stardust.data matches 1.. if entity @s[tag=stardust.cavern_portal] run function stardust:custom_blocks/cavern_portal/destroy
execute if score #total_celestial_portal stardust.data matches 1.. if entity @s[tag=stardust.celestial_portal] run function stardust:custom_blocks/celestial_portal/destroy
execute if score #total_stardust_portal stardust.data matches 1.. if entity @s[tag=stardust.stardust_portal] run function stardust:custom_blocks/stardust_portal/destroy
execute if score #total_stardust_dungeon_portal stardust.data matches 1.. if entity @s[tag=stardust.stardust_dungeon_portal] run function stardust:custom_blocks/stardust_dungeon_portal/destroy
execute if score #total_ultimate_portal stardust.data matches 1.. if entity @s[tag=stardust.ultimate_portal] run function stardust:custom_blocks/ultimate_portal/destroy
execute if score #total_mob_grinder stardust.data matches 1.. if entity @s[tag=stardust.mob_grinder] run function stardust:custom_blocks/mob_grinder/destroy
execute if score #total_nether_star_generator stardust.data matches 1.. if entity @s[tag=stardust.nether_star_generator] run function stardust:custom_blocks/nether_star_generator/destroy
execute if score #total_advanced_furnace_generator stardust.data matches 1.. if entity @s[tag=stardust.advanced_furnace_generator] run function stardust:custom_blocks/advanced_furnace_generator/destroy
execute if score #total_stardust_furnace_generator stardust.data matches 1.. if entity @s[tag=stardust.stardust_furnace_generator] run function stardust:custom_blocks/stardust_furnace_generator/destroy
execute if score #total_awakened_furnace_generator stardust.data matches 1.. if entity @s[tag=stardust.awakened_furnace_generator] run function stardust:custom_blocks/awakened_furnace_generator/destroy

