#Solar Photovoltaic Cell
    execute if entity @s[tag=!SF_WaitingCraft] if block ~ ~ ~ barrel{Items:[{Slot:2b,tag:{SF_AwakenedPhotovoltaicCell:1s}},{Slot:3b,tag:{SF_AwakenedPhotovoltaicCell:1s}},{Slot:4b,tag:{SF_AwakenedPhotovoltaicCell:1s}},{Slot:12b,tag:{SF_SolarFragment:1s}}]} run function stardust:craft/items/solar_photovoltaic_cell
    execute if entity @s[tag=!SF_WaitingCraft] if block ~ ~ ~ barrel{Items:[{Slot:11b,tag:{SF_AwakenedPhotovoltaicCell:1s}},{Slot:12b,tag:{SF_AwakenedPhotovoltaicCell:1s}},{Slot:13b,tag:{SF_AwakenedPhotovoltaicCell:1s}},{Slot:21b,tag:{SF_SolarFragment:1s}}]} run function stardust:craft/items/solar_photovoltaic_cell
#Solar Photovoltaic Panel
    execute if entity @s[tag=!SF_WaitingCraft] if block ~ ~ ~ barrel{Items:[{Slot:2b,tag:{SF_SolarPhotovoltaicCell:1s}},{Slot:3b,tag:{SF_SolarPhotovoltaicCell:1s}},{Slot:4b,tag:{SF_SolarPhotovoltaicCell:1s}},{Slot:11b,tag:{SF_SolarFragment:1s}},{Slot:12b,tag:{SF_AwakenedPhotovoltaicPanel:1s}},{Slot:13b,tag:{SF_SolarFragment:1s}},{Slot:22b,id:"minecraft:iron_block"},{Slot:21b,id:"minecraft:iron_block"},{Slot:22b,id:"minecraft:iron_block"}]} run function stardust:craft/items/solar_photovoltaic_panel