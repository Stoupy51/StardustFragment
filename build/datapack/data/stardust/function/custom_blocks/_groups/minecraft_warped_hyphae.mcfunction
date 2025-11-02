
#> stardust:custom_blocks/_groups/minecraft_warped_hyphae
#
# @executed	as @e[type=#stardust:custom_blocks,tag=...,predicate=!stardust:advanced_check_vanilla_blocks] & at @s
#
# @within	stardust:custom_blocks/destroy
#

execute if score #total_stardust_battery stardust.data matches 1.. if entity @s[tag=stardust.stardust_battery] run function stardust:custom_blocks/stardust_battery/destroy

