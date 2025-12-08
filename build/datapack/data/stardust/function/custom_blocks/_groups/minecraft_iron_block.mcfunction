
#> stardust:custom_blocks/_groups/minecraft_iron_block
#
# @executed	as @e[type=item_display,tag=stardust.custom_block,predicate=!stardust:advanced_check_vanilla_blocks] & at @s
#
# @within	stardust:custom_blocks/destroy
#

execute if score #total_celestial_portal stardust.data matches 1.. if entity @s[tag=stardust.celestial_portal] run function stardust:custom_blocks/celestial_portal/destroy

