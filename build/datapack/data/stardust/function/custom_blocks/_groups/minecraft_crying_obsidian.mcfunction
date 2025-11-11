
#> stardust:custom_blocks/_groups/minecraft_crying_obsidian
#
# @executed	as @e[type=#stardust:custom_blocks,tag=...,predicate=!stardust:advanced_check_vanilla_blocks] & at @s
#
# @within	stardust:custom_blocks/destroy
#

execute if score #total_ultimate_frame stardust.data matches 1.. if entity @s[tag=stardust.ultimate_frame] run function stardust:custom_blocks/ultimate_frame/destroy
execute if score #total_ultimate_battery stardust.data matches 1.. if entity @s[tag=stardust.ultimate_battery] run function stardust:custom_blocks/ultimate_battery/destroy
execute if score #total_ultimate_portal stardust.data matches 1.. if entity @s[tag=stardust.ultimate_portal] run function stardust:custom_blocks/ultimate_portal/destroy

