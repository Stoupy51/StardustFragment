#Dark Photovoltaic Cell
    execute if entity @s[tag=!SF_WaitingCraft] if block ~ ~ ~ barrel{Items:[{Slot:2b,tag:{SF_AwakenedPhotovoltaicCell:1s}},{Slot:3b,tag:{SF_AwakenedPhotovoltaicCell:1s}},{Slot:4b,tag:{SF_AwakenedPhotovoltaicCell:1s}},{Slot:12b,tag:{SF_DarkFragment:1s}}]} run function stardust:craft/items/dark_photovoltaic_cell
    execute if entity @s[tag=!SF_WaitingCraft] if block ~ ~ ~ barrel{Items:[{Slot:11b,tag:{SF_AwakenedPhotovoltaicCell:1s}},{Slot:12b,tag:{SF_AwakenedPhotovoltaicCell:1s}},{Slot:13b,tag:{SF_AwakenedPhotovoltaicCell:1s}},{Slot:21b,tag:{SF_DarkFragment:1s}}]} run function stardust:craft/items/dark_photovoltaic_cell
