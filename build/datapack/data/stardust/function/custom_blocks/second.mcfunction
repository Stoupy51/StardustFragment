
#> stardust:custom_blocks/second
#
# @executed	as @e[tag=stardust.second] & at @s
#
# @within	stardust:v3.5.0/second [ as @e[tag=stardust.second] & at @s ]
#

execute if entity @s[tag=stardust.stardust_solar_panel] run function stardust:custom_blocks/stardust_solar_panel/second
execute if entity @s[tag=stardust.awakened_stardust_solar_panel] run function stardust:custom_blocks/awakened_stardust_solar_panel/second
execute if entity @s[tag=stardust.legendarium_solar_panel] run function stardust:custom_blocks/legendarium_solar_panel/second
execute if entity @s[tag=stardust.solarium_solar_panel] run function stardust:custom_blocks/solarium_solar_panel/second
execute if entity @s[tag=stardust.darkium_solar_panel] run function stardust:custom_blocks/darkium_solar_panel/second
execute if entity @s[tag=stardust.ultimate_solar_panel] run function stardust:custom_blocks/ultimate_solar_panel/second
execute if entity @s[tag=stardust.nether_star_generator] run function stardust:custom_blocks/nether_star_generator/second
execute if entity @s[tag=stardust.advanced_furnace_generator] run function stardust:custom_blocks/advanced_furnace_generator/second
execute if entity @s[tag=stardust.stardust_furnace_generator] run function stardust:custom_blocks/stardust_furnace_generator/second
execute if entity @s[tag=stardust.awakened_stardust_furnace_generator] run function stardust:custom_blocks/awakened_stardust_furnace_generator/second
execute if entity @s[tag=stardust.mob_grinder] run function stardust:custom_blocks/mob_grinder/second

