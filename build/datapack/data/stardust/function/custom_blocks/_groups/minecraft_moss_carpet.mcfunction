
#> stardust:custom_blocks/_groups/minecraft_moss_carpet
#
# @executed	as @e[type=item_display,tag=...,predicate=!stardust:check_vanilla_blocks] & at @s
#
# @within	stardust:custom_blocks/destroy
#

execute if score #total_diamond_seed stardust.data matches 1.. if entity @s[tag=stardust.diamond_seed] run function stardust:custom_blocks/diamond_seed/destroy

