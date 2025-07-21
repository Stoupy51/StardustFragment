
#> stardust:custom_blocks/_groups/minecraft_diamond_block
#
# @within	stardust:custom_blocks/destroy
#

execute if score #total_legendarium_block stardust.data matches 1.. if entity @s[tag=stardust.legendarium_block] run function stardust:custom_blocks/legendarium_block/destroy
execute if score #total_solarium_block stardust.data matches 1.. if entity @s[tag=stardust.solarium_block] run function stardust:custom_blocks/solarium_block/destroy
execute if score #total_darkium_block stardust.data matches 1.. if entity @s[tag=stardust.darkium_block] run function stardust:custom_blocks/darkium_block/destroy
execute if score #total_stardust_core stardust.data matches 1.. if entity @s[tag=stardust.stardust_core] run function stardust:custom_blocks/stardust_core/destroy
execute if score #total_stardust_battery stardust.data matches 1.. if entity @s[tag=stardust.stardust_battery] run function stardust:custom_blocks/stardust_battery/destroy
execute if score #total_awakened_stardust_battery stardust.data matches 1.. if entity @s[tag=stardust.awakened_stardust_battery] run function stardust:custom_blocks/awakened_stardust_battery/destroy
execute if score #total_stardust_solar_panel stardust.data matches 1.. if entity @s[tag=stardust.stardust_solar_panel] run function stardust:custom_blocks/stardust_solar_panel/destroy
execute if score #total_awakened_solar_panel stardust.data matches 1.. if entity @s[tag=stardust.awakened_solar_panel] run function stardust:custom_blocks/awakened_solar_panel/destroy
execute if score #total_growth_accelerator stardust.data matches 1.. if entity @s[tag=stardust.growth_accelerator] run function stardust:custom_blocks/growth_accelerator/destroy

