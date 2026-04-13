
#> stardust:custom_blocks/_groups/minecraft_netherite_block
#
# @executed	as @e[type=item_display,tag=stardust.custom_block,predicate=!stardust:advanced_check_vanilla_blocks] & at @s
#
# @within	stardust:custom_blocks/destroy
#

execute if score #total_darkium_block stardust.data matches 1.. if entity @s[tag=stardust.darkium_block] run function stardust:custom_blocks/darkium_block/destroy

