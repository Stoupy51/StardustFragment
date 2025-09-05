
#> stardust:custom_blocks/_groups/minecraft_player_head
#
# @executed	as @e[type=item_display,tag=...,predicate=!stardust:check_vanilla_blocks] & at @s
#
# @within	stardust:custom_blocks/destroy
#

execute if score #total_stardust_cable stardust.data matches 1.. if entity @s[tag=stardust.stardust_cable] run function stardust:custom_blocks/stardust_cable/destroy
execute if score #total_awakened_stardust_cable stardust.data matches 1.. if entity @s[tag=stardust.awakened_stardust_cable] run function stardust:custom_blocks/awakened_stardust_cable/destroy
execute if score #total_ultimate_cable stardust.data matches 1.. if entity @s[tag=stardust.ultimate_cable] run function stardust:custom_blocks/ultimate_cable/destroy

