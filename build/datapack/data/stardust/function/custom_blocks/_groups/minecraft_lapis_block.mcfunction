
#> stardust:custom_blocks/_groups/minecraft_lapis_block
#
# @executed	as @e[type=item_display,tag=...,predicate=!stardust:check_vanilla_blocks] & at @s
#
# @within	stardust:custom_blocks/destroy
#

execute if score #total_stardust_block stardust.data matches 1.. if entity @s[tag=stardust.stardust_block] run function stardust:custom_blocks/stardust_block/destroy
execute if score #total_stardust_frame stardust.data matches 1.. if entity @s[tag=stardust.stardust_frame] run function stardust:custom_blocks/stardust_frame/destroy

