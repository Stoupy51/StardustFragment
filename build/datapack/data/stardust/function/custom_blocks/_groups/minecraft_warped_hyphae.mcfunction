
#> stardust:custom_blocks/_groups/minecraft_warped_hyphae
#
# @executed	as @e[type=item_display,tag=...,predicate=!stardust:check_vanilla_blocks] & at @s
#
# @within	stardust:custom_blocks/destroy
#

execute if score #total_stardust_battery stardust.data matches 1.. if entity @s[tag=stardust.stardust_battery] run function stardust:custom_blocks/stardust_battery/destroy

