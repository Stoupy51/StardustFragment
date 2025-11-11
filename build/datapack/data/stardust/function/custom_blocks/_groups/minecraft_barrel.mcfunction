
#> stardust:custom_blocks/_groups/minecraft_barrel
#
# @executed	as @e[type=#stardust:custom_blocks,tag=...,predicate=!stardust:advanced_check_vanilla_blocks] & at @s
#
# @within	stardust:custom_blocks/destroy
#

execute if score #total_quarry_lv1 stardust.data matches 1.. if entity @s[tag=stardust.quarry_lv1] run function stardust:custom_blocks/quarry_lv1/destroy
execute if score #total_quarry_lv2 stardust.data matches 1.. if entity @s[tag=stardust.quarry_lv2] run function stardust:custom_blocks/quarry_lv2/destroy
execute if score #total_quarry_lv3 stardust.data matches 1.. if entity @s[tag=stardust.quarry_lv3] run function stardust:custom_blocks/quarry_lv3/destroy
execute if score #total_quarry_lv4 stardust.data matches 1.. if entity @s[tag=stardust.quarry_lv4] run function stardust:custom_blocks/quarry_lv4/destroy
execute if score #total_quarry_lv5 stardust.data matches 1.. if entity @s[tag=stardust.quarry_lv5] run function stardust:custom_blocks/quarry_lv5/destroy
execute if score #total_quarry_creative stardust.data matches 1.. if entity @s[tag=stardust.quarry_creative] run function stardust:custom_blocks/quarry_creative/destroy

