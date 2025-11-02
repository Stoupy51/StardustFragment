
#> stardust:custom_blocks/_groups/minecraft_emerald_block
#
# @executed	as @e[type=#stardust:custom_blocks,tag=...,predicate=!stardust:advanced_check_vanilla_blocks] & at @s
#
# @within	stardust:custom_blocks/destroy
#

execute if score #total_legendarium_block stardust.data matches 1.. if entity @s[tag=stardust.legendarium_block] run function stardust:custom_blocks/legendarium_block/destroy

