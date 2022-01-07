#Dark Photovoltaic Cell
	execute as @s[tag=!StardustFragment_FoundCraft] if block ~ ~ ~ barrel{Items:[{Slot:2b,tag:{StardustFragment_AwakenedPhotovoltaicCell:1b}},{Slot:3b,tag:{StardustFragment_AwakenedPhotovoltaicCell:1b}},{Slot:4b,tag:{StardustFragment_AwakenedPhotovoltaicCell:1b}},{Slot:12b,tag:{StardustFragment_DarkFragment:1b}}]} run function stardust:craft/items/dark_photovoltaic_cell
	execute as @s[tag=!StardustFragment_FoundCraft] if block ~ ~ ~ barrel{Items:[{Slot:11b,tag:{StardustFragment_AwakenedPhotovoltaicCell:1b}},{Slot:12b,tag:{StardustFragment_AwakenedPhotovoltaicCell:1b}},{Slot:13b,tag:{StardustFragment_AwakenedPhotovoltaicCell:1b}},{Slot:21b,tag:{StardustFragment_DarkFragment:1b}}]} run function stardust:craft/items/dark_photovoltaic_cell
#Dark Photovoltaic Panel
	execute as @s[tag=!StardustFragment_FoundCraft] if block ~ ~ ~ barrel{Items:[{Slot:2b,tag:{StardustFragment_DarkPhotovoltaicCell:1b}},{Slot:3b,tag:{StardustFragment_DarkPhotovoltaicCell:1b}},{Slot:4b,tag:{StardustFragment_DarkPhotovoltaicCell:1b}},{Slot:11b,tag:{StardustFragment_DarkFragment:1b}},{Slot:12b,tag:{StardustFragment_AwakenedPhotovoltaicPanel:1b}},{Slot:13b,tag:{StardustFragment_DarkFragment:1b}},{Slot:22b,tag:{SimplEnergy_SimpluniumBlock:1b}},{Slot:21b,tag:{SimplEnergy_SimpluniumBlock:1b}},{Slot:22b,tag:{SimplEnergy_SimpluniumBlock:1b}}]} run function stardust:craft/items/dark_photovoltaic_panel

#No Craft Found
	execute as @s[tag=!StardustFragment_FoundCraft] unless data storage stardust:items all.Crafting[{Slot:16b,tag:{StardustFragment_DarkFragment:1b}}] run function stardust:craft/no_craft_found
