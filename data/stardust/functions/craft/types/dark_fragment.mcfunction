#Dark Photovoltaic Cell
	execute as @s[tag=!SF_WaitingCraft] if block ~ ~ ~ barrel{Items:[{Slot:2b,tag:{SF_AwakenedPhotovoltaicCell:1s}},{Slot:3b,tag:{SF_AwakenedPhotovoltaicCell:1s}},{Slot:4b,tag:{SF_AwakenedPhotovoltaicCell:1s}},{Slot:12b,tag:{SF_DarkFragment:1s}}]} run function stardust:craft/items/dark_photovoltaic_cell
	execute as @s[tag=!SF_WaitingCraft] if block ~ ~ ~ barrel{Items:[{Slot:11b,tag:{SF_AwakenedPhotovoltaicCell:1s}},{Slot:12b,tag:{SF_AwakenedPhotovoltaicCell:1s}},{Slot:13b,tag:{SF_AwakenedPhotovoltaicCell:1s}},{Slot:21b,tag:{SF_DarkFragment:1s}}]} run function stardust:craft/items/dark_photovoltaic_cell
#Dark Photovoltaic Panel
	execute as @s[tag=!SF_WaitingCraft] if block ~ ~ ~ barrel{Items:[{Slot:2b,tag:{SF_DarkPhotovoltaicCell:1s}},{Slot:3b,tag:{SF_DarkPhotovoltaicCell:1s}},{Slot:4b,tag:{SF_DarkPhotovoltaicCell:1s}},{Slot:11b,tag:{SF_DarkFragment:1s}},{Slot:12b,tag:{SF_AwakenedPhotovoltaicPanel:1s}},{Slot:13b,tag:{SF_DarkFragment:1s}},{Slot:22b,tag:{SE_SimpluniumBlock:1s}},{Slot:21b,tag:{SE_SimpluniumBlock:1s}},{Slot:22b,tag:{SE_SimpluniumBlock:1s}}]} run function stardust:craft/items/dark_photovoltaic_panel

#No Craft Found
	execute as @s[tag=!SF_WaitingCraft] unless data storage stardust:items Crafting[{Slot:16b,tag:{SF_DarkFragment:1s}}] run function stardust:craft/no_craft_found
