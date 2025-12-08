
#> stardust:custom_blocks/_groups/minecraft_moss_carpet
#
# @executed	as @e[type=item_display,tag=stardust.custom_block,predicate=!stardust:advanced_check_vanilla_blocks] & at @s
#
# @within	stardust:custom_blocks/destroy
#

execute if score #total_diamond_seed stardust.data matches 1.. if entity @s[tag=stardust.diamond_seed] run function stardust:custom_blocks/diamond_seed/destroy
execute if score #total_advanced_diamond_seed stardust.data matches 1.. if entity @s[tag=stardust.advanced_diamond_seed] run function stardust:custom_blocks/advanced_diamond_seed/destroy
execute if score #total_stardust_seed stardust.data matches 1.. if entity @s[tag=stardust.stardust_seed] run function stardust:custom_blocks/stardust_seed/destroy
execute if score #total_advanced_stardust_seed stardust.data matches 1.. if entity @s[tag=stardust.advanced_stardust_seed] run function stardust:custom_blocks/advanced_stardust_seed/destroy
execute if score #total_elite_stardust_seed stardust.data matches 1.. if entity @s[tag=stardust.elite_stardust_seed] run function stardust:custom_blocks/elite_stardust_seed/destroy
execute if score #total_legendarium_seed stardust.data matches 1.. if entity @s[tag=stardust.legendarium_seed] run function stardust:custom_blocks/legendarium_seed/destroy
execute if score #total_solarium_seed stardust.data matches 1.. if entity @s[tag=stardust.solarium_seed] run function stardust:custom_blocks/solarium_seed/destroy
execute if score #total_darkium_seed stardust.data matches 1.. if entity @s[tag=stardust.darkium_seed] run function stardust:custom_blocks/darkium_seed/destroy

