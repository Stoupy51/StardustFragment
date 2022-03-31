
execute if entity @s[tag=stardust.portal] run function stardust:work/portals

#Machines Visuals & Work
	execute if entity @s[tag=stardust.mob_grinder] run function stardust:work/mob_grinder
	execute if entity @s[tag=stardust.nether_star_generator] run function stardust:visual/nether_star_generator
	execute if entity @s[tag=stardust.redstone_generator] run function stardust:visual/redstone_generator
	execute if entity @s[tag=stardust.heat_generator] run function stardust:visual/heat_generator
	execute if entity @s[tag=stardust.advanced_furnace_generator] run function stardust:visual/furnace_generator/advanced
	execute if entity @s[tag=stardust.stardust_furnace_generator] run function stardust:visual/furnace_generator/stardust
	execute if entity @s[tag=stardust.awakened_furnace_generator] run function stardust:visual/furnace_generator/awakened
	execute if entity @s[tag=stardust.stardust_photovoltaic_panel] unless score @s energy.storage matches 800.. run function stardust:work/photovoltaic_panel/stardust
	execute if entity @s[tag=stardust.awakened_photovoltaic_panel] unless score @s energy.storage matches 1600.. run function stardust:work/photovoltaic_panel/awakened
	execute if entity @s[tag=stardust.legendary_photovoltaic_panel] unless score @s energy.storage matches 3200.. run function stardust:work/photovoltaic_panel/legendary
	execute if entity @s[tag=stardust.solar_photovoltaic_panel] unless score @s energy.storage matches 3200.. run function stardust:work/photovoltaic_panel/solar
	execute if entity @s[tag=stardust.dark_photovoltaic_panel] unless score @s energy.storage matches 3200.. run function stardust:work/photovoltaic_panel/dark
	execute if entity @s[tag=stardust.wind_turbine] unless score @s energy.storage matches 800.. run function stardust:work/wind_turbine

#Balancing
	execute if entity @s[tag=stardust.balancing,tag=!stardust.balance,tag=!stardust.balanced] run function stardust:balance/all
