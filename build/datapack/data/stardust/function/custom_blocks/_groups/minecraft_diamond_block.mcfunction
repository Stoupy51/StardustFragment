
#> stardust:custom_blocks/_groups/minecraft_diamond_block
#
# @executed	as @e[type=item_display,tag=...,predicate=!stardust:check_vanilla_blocks] & at @s
#
# @within	stardust:custom_blocks/destroy
#

execute if score #total_stardust_core stardust.data matches 1.. if entity @s[tag=stardust.stardust_core] run function stardust:custom_blocks/stardust_core/destroy
execute if score #total_growth_accelerator stardust.data matches 1.. if entity @s[tag=stardust.growth_accelerator] run function stardust:custom_blocks/growth_accelerator/destroy

