
#> stardust:custom_blocks/_groups/minecraft_crimson_hyphae
#
# @executed	as @e[type=item_display,tag=stardust.custom_block,predicate=!stardust:advanced_check_vanilla_blocks] & at @s
#
# @within	stardust:custom_blocks/destroy
#

execute if score #total_awakened_stardust_battery stardust.data matches 1.. if entity @s[tag=stardust.awakened_stardust_battery] run function stardust:custom_blocks/awakened_stardust_battery/destroy

