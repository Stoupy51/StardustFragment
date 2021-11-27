#Legendary Photovoltaic Cell
	execute as @s[tag=!SF_FoundCraft] if block ~ ~ ~ barrel{Items:[{Slot:2b,tag:{SF_AwakenedPhotovoltaicCell:1b}},{Slot:3b,tag:{SF_AwakenedPhotovoltaicCell:1b}},{Slot:4b,tag:{SF_AwakenedPhotovoltaicCell:1b}},{Slot:12b,tag:{SF_LegendaryFragment:1b}}]} run function stardust:craft/items/legendary_photovoltaic_cell
	execute as @s[tag=!SF_FoundCraft] if block ~ ~ ~ barrel{Items:[{Slot:11b,tag:{SF_AwakenedPhotovoltaicCell:1b}},{Slot:12b,tag:{SF_AwakenedPhotovoltaicCell:1b}},{Slot:13b,tag:{SF_AwakenedPhotovoltaicCell:1b}},{Slot:21b,tag:{SF_LegendaryFragment:1b}}]} run function stardust:craft/items/legendary_photovoltaic_cell
#Legendary Photovoltaic Panel
	execute as @s[tag=!SF_FoundCraft] if block ~ ~ ~ barrel{Items:[{Slot:2b,tag:{SF_LegendaryPhotovoltaicCell:1b}},{Slot:3b,tag:{SF_LegendaryPhotovoltaicCell:1b}},{Slot:4b,tag:{SF_LegendaryPhotovoltaicCell:1b}},{Slot:11b,tag:{SF_LegendaryFragment:1b}},{Slot:12b,tag:{SF_AwakenedPhotovoltaicPanel:1b}},{Slot:13b,tag:{SF_LegendaryFragment:1b}},{Slot:22b,id:"minecraft:iron_block"},{Slot:21b,id:"minecraft:iron_block"},{Slot:22b,id:"minecraft:iron_block"}]} run function stardust:craft/items/legendary_photovoltaic_panel

#No Craft Found
	execute as @s[tag=!SF_FoundCraft] unless data storage stardust:items Crafting[{Slot:16b,tag:{SF_LegendaryFragment:1b}}] run function stardust:craft/no_craft_found
