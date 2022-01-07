#Solar Photovoltaic Cell
	execute as @s[tag=!StardustFragment_FoundCraft] if block ~ ~ ~ barrel{Items:[{Slot:2b,tag:{StardustFragment_AwakenedPhotovoltaicCell:1b}},{Slot:3b,tag:{StardustFragment_AwakenedPhotovoltaicCell:1b}},{Slot:4b,tag:{StardustFragment_AwakenedPhotovoltaicCell:1b}},{Slot:12b,tag:{StardustFragment_SolarFragment:1b}}]} run function stardust:craft/items/solar_photovoltaic_cell
	execute as @s[tag=!StardustFragment_FoundCraft] if block ~ ~ ~ barrel{Items:[{Slot:11b,tag:{StardustFragment_AwakenedPhotovoltaicCell:1b}},{Slot:12b,tag:{StardustFragment_AwakenedPhotovoltaicCell:1b}},{Slot:13b,tag:{StardustFragment_AwakenedPhotovoltaicCell:1b}},{Slot:21b,tag:{StardustFragment_SolarFragment:1b}}]} run function stardust:craft/items/solar_photovoltaic_cell
#Solar Photovoltaic Panel
	execute as @s[tag=!StardustFragment_FoundCraft] if block ~ ~ ~ barrel{Items:[{Slot:2b,tag:{StardustFragment_SolarPhotovoltaicCell:1b}},{Slot:3b,tag:{StardustFragment_SolarPhotovoltaicCell:1b}},{Slot:4b,tag:{StardustFragment_SolarPhotovoltaicCell:1b}},{Slot:11b,tag:{StardustFragment_SolarFragment:1b}},{Slot:12b,tag:{StardustFragment_AwakenedPhotovoltaicPanel:1b}},{Slot:13b,tag:{StardustFragment_SolarFragment:1b}},{Slot:22b,id:"minecraft:iron_block"},{Slot:21b,id:"minecraft:iron_block"},{Slot:22b,id:"minecraft:iron_block"}]} run function stardust:craft/items/solar_photovoltaic_panel

#No Craft Found
	execute as @s[tag=!StardustFragment_FoundCraft] unless data storage stardust:items all.Crafting[{Slot:16b,tag:{StardustFragment_SolarFragment:1b}}] run function stardust:craft/no_craft_found
