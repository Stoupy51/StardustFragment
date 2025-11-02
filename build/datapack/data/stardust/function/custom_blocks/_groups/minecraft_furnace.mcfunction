
#> stardust:custom_blocks/_groups/minecraft_furnace
#
# @executed	as @e[type=item_display,tag=...,predicate=!stardust:check_vanilla_blocks] & at @s
#
# @within	stardust:custom_blocks/destroy
#

execute if score #total_nether_star_generator stardust.data matches 1.. if entity @s[tag=stardust.nether_star_generator] run function stardust:custom_blocks/nether_star_generator/destroy
execute if score #total_advanced_furnace_generator stardust.data matches 1.. if entity @s[tag=stardust.advanced_furnace_generator] run function stardust:custom_blocks/advanced_furnace_generator/destroy
execute if score #total_stardust_furnace_generator stardust.data matches 1.. if entity @s[tag=stardust.stardust_furnace_generator] run function stardust:custom_blocks/stardust_furnace_generator/destroy
execute if score #total_awakened_stardust_furnace_generator stardust.data matches 1.. if entity @s[tag=stardust.awakened_stardust_furnace_generator] run function stardust:custom_blocks/awakened_stardust_furnace_generator/destroy

