
#> stardust:custom_blocks/_groups/minecraft_daylight_detector
#
# @executed	as @e[type=item_display,tag=stardust.custom_block,predicate=!stardust:advanced_check_vanilla_blocks] & at @s
#
# @within	stardust:custom_blocks/destroy
#

execute if score #total_stardust_solar_panel stardust.data matches 1.. if entity @s[tag=stardust.stardust_solar_panel] run function stardust:custom_blocks/stardust_solar_panel/destroy
execute if score #total_awakened_stardust_solar_panel stardust.data matches 1.. if entity @s[tag=stardust.awakened_stardust_solar_panel] run function stardust:custom_blocks/awakened_stardust_solar_panel/destroy
execute if score #total_legendarium_solar_panel stardust.data matches 1.. if entity @s[tag=stardust.legendarium_solar_panel] run function stardust:custom_blocks/legendarium_solar_panel/destroy
execute if score #total_solarium_solar_panel stardust.data matches 1.. if entity @s[tag=stardust.solarium_solar_panel] run function stardust:custom_blocks/solarium_solar_panel/destroy
execute if score #total_darkium_solar_panel stardust.data matches 1.. if entity @s[tag=stardust.darkium_solar_panel] run function stardust:custom_blocks/darkium_solar_panel/destroy
execute if score #total_ultimate_solar_panel stardust.data matches 1.. if entity @s[tag=stardust.ultimate_solar_panel] run function stardust:custom_blocks/ultimate_solar_panel/destroy

