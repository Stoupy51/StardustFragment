#Legendary Photovoltaic Cell
	execute as @s[tag=!SF_FoundCraft] if block ~ ~ ~ barrel{Items:[{Slot:2b,tag:{SF_AwakenedPhotovoltaicCell:1s}},{Slot:3b,tag:{SF_AwakenedPhotovoltaicCell:1s}},{Slot:4b,tag:{SF_AwakenedPhotovoltaicCell:1s}},{Slot:12b,tag:{SF_LegendaryFragment:1s}}]} run function stardust:craft/items/legendary_photovoltaic_cell
	execute as @s[tag=!SF_FoundCraft] if block ~ ~ ~ barrel{Items:[{Slot:11b,tag:{SF_AwakenedPhotovoltaicCell:1s}},{Slot:12b,tag:{SF_AwakenedPhotovoltaicCell:1s}},{Slot:13b,tag:{SF_AwakenedPhotovoltaicCell:1s}},{Slot:21b,tag:{SF_LegendaryFragment:1s}}]} run function stardust:craft/items/legendary_photovoltaic_cell
#Legendary Photovoltaic Panel
	execute as @s[tag=!SF_FoundCraft] if block ~ ~ ~ barrel{Items:[{Slot:2b,tag:{SF_LegendaryPhotovoltaicCell:1s}},{Slot:3b,tag:{SF_LegendaryPhotovoltaicCell:1s}},{Slot:4b,tag:{SF_LegendaryPhotovoltaicCell:1s}},{Slot:11b,tag:{SF_LegendaryFragment:1s}},{Slot:12b,tag:{SF_AwakenedPhotovoltaicPanel:1s}},{Slot:13b,tag:{SF_LegendaryFragment:1s}},{Slot:22b,id:"minecraft:iron_block"},{Slot:21b,id:"minecraft:iron_block"},{Slot:22b,id:"minecraft:iron_block"}]} run function stardust:craft/items/legendary_photovoltaic_panel

#No Craft Found
	execute as @s[tag=!SF_FoundCraft] unless data storage stardust:items Crafting[{Slot:16b,tag:{SF_LegendaryFragment:1s}}] run function stardust:craft/no_craft_found
