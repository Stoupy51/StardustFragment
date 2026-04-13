
#> stardust:custom_blocks/_groups/minecraft_waxed_copper_block
#
# @executed	as @e[type=item_display,tag=stardust.custom_block,predicate=!stardust:advanced_check_vanilla_blocks] & at @s
#
# @within	stardust:custom_blocks/destroy
#

execute if score #total_solarium_block stardust.data matches 1.. if entity @s[tag=stardust.solarium_block] run function stardust:custom_blocks/solarium_block/destroy

