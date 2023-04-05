
#> stardust:utils/tick_second_entities
#
# @within			stardust:tick_second
# @executed			as & at current entity (custom block)
#
# @description		Function executed every second for every entity that are no ores
#

# Portals Work
execute if entity @s[tag=stardust.portal] run function stardust:work/portals

# Machines Visuals & Work (if possible)
execute if entity @s[tag=stardust.mob_grinder] run function stardust:work/mob_grinder
execute if entity @s[tag=stardust.nether_star_generator] run function stardust:visual/nether_star_generator
execute if entity @s[tag=stardust.redstone_generator] run function stardust:visual/redstone_generator
execute if entity @s[tag=stardust.heat_generator] run function stardust:visual/heat_generator
execute if entity @s[tag=stardust.advanced_furnace_generator] run function stardust:visual/furnace_generator/advanced
execute if entity @s[tag=stardust.stardust_furnace_generator] run function stardust:visual/furnace_generator/stardust
execute if entity @s[tag=stardust.awakened_furnace_generator] run function stardust:visual/furnace_generator/awakened
execute if entity @s[tag=stardust.growth_accelerator] run function stardust:visual/growth_accelerator
execute if entity @s[tag=stardust.stardust_solar_panel] unless score @s energy.storage matches 800.. run function stardust:work/solar_panel/stardust
execute if entity @s[tag=stardust.awakened_solar_panel] unless score @s energy.storage matches 1600.. run function stardust:work/solar_panel/awakened
execute if entity @s[tag=stardust.legendarium_solar_panel] unless score @s energy.storage matches 3200.. run function stardust:work/solar_panel/legendarium
execute if entity @s[tag=stardust.solarium_solar_panel] unless score @s energy.storage matches 3200.. run function stardust:work/solar_panel/solarium
execute if entity @s[tag=stardust.darkium_solar_panel] unless score @s energy.storage matches 3200.. run function stardust:work/solar_panel/darkium
execute if entity @s[tag=stardust.wind_turbine] unless score @s energy.storage matches 800.. run function stardust:work/wind_turbine

