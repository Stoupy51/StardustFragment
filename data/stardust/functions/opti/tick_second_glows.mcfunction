
execute if entity @s[tag=StardustFragment_CraftingTable,predicate=!simplenergy:is_barrel_open] if entity @p[distance=..7] run function stardust:craft/all
execute if entity @s[tag=StardustFragment_Portal] run function stardust:work/portals

#Machines Visuals & Work
	execute if entity @s[tag=StardustFragment_MobGrinder] run function stardust:work/mob_grinder
	execute if entity @s[tag=StardustFragment_NetherStarGenerator] run function stardust:visual/nether_star_generator
	execute if entity @s[tag=StardustFragment_RedstoneGenerator] run function stardust:visual/redstone_generator
	execute if entity @s[tag=StardustFragment_HeatGenerator] run function stardust:visual/heat_generator
	execute if entity @s[tag=StardustFragment_AdvancedFurnaceGenerator] run function stardust:visual/furnace_generator/advanced
	execute if entity @s[tag=StardustFragment_StardustFurnaceGenerator] run function stardust:visual/furnace_generator/stardust
	execute if entity @s[tag=StardustFragment_AwakenedFurnaceGenerator] run function stardust:visual/furnace_generator/awakened
	execute if entity @s[tag=StardustFragment_StardustPhotovoltaicPanel] unless score @s energy.storage matches 800.. run function stardust:work/photovoltaic_panel/stardust
	execute if entity @s[tag=StardustFragment_AwakenedPhotovoltaicPanel] unless score @s energy.storage matches 1600.. run function stardust:work/photovoltaic_panel/awakened
	execute if entity @s[tag=StardustFragment_LegendaryPhotovoltaicPanel] unless score @s energy.storage matches 3200.. run function stardust:work/photovoltaic_panel/legendary
	execute if entity @s[tag=StardustFragment_SolarPhotovoltaicPanel] unless score @s energy.storage matches 3200.. run function stardust:work/photovoltaic_panel/solar
	execute if entity @s[tag=StardustFragment_DarkPhotovoltaicPanel] unless score @s energy.storage matches 3200.. run function stardust:work/photovoltaic_panel/dark
	execute if entity @s[tag=StardustFragment_WindTurbine] unless score @s energy.storage matches 800.. run function stardust:work/wind_turbine

tag @s remove StardustFragment_Balanced
