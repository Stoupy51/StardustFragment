#Dark Photovoltaic Cell
	execute as @s[tag=!SF_FoundCraft] if block ~ ~ ~ barrel{Items:[{Slot:2b,tag:{SF_AwakenedPhotovoltaicCell:1b}},{Slot:3b,tag:{SF_AwakenedPhotovoltaicCell:1b}},{Slot:4b,tag:{SF_AwakenedPhotovoltaicCell:1b}},{Slot:12b,tag:{SF_DarkFragment:1b}}]} run function stardust:craft/items/dark_photovoltaic_cell
	execute as @s[tag=!SF_FoundCraft] if block ~ ~ ~ barrel{Items:[{Slot:11b,tag:{SF_AwakenedPhotovoltaicCell:1b}},{Slot:12b,tag:{SF_AwakenedPhotovoltaicCell:1b}},{Slot:13b,tag:{SF_AwakenedPhotovoltaicCell:1b}},{Slot:21b,tag:{SF_DarkFragment:1b}}]} run function stardust:craft/items/dark_photovoltaic_cell
#Dark Photovoltaic Panel
	execute as @s[tag=!SF_FoundCraft] if block ~ ~ ~ barrel{Items:[{Slot:2b,tag:{SF_DarkPhotovoltaicCell:1b}},{Slot:3b,tag:{SF_DarkPhotovoltaicCell:1b}},{Slot:4b,tag:{SF_DarkPhotovoltaicCell:1b}},{Slot:11b,tag:{SF_DarkFragment:1b}},{Slot:12b,tag:{SF_AwakenedPhotovoltaicPanel:1b}},{Slot:13b,tag:{SF_DarkFragment:1b}},{Slot:22b,tag:{SE_SimpluniumBlock:1b}},{Slot:21b,tag:{SE_SimpluniumBlock:1b}},{Slot:22b,tag:{SE_SimpluniumBlock:1b}}]} run function stardust:craft/items/dark_photovoltaic_panel

#No Craft Found
	execute as @s[tag=!SF_FoundCraft] unless data storage stardust:items Crafting[{Slot:16b,tag:{SF_DarkFragment:1b}}] run function stardust:craft/no_craft_found
