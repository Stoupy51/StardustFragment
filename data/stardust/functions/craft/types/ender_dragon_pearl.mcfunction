#Quarry Lv.5
	execute as @s[tag=!SF_FoundCraft] if block ~ ~ ~ barrel{Items:[{Slot:2b,tag:{SF_EnderDragonPearl:1s}},{Slot:3b,tag:{SF_EnderDragonPearl:1s}},{Slot:4b,tag:{SF_EnderDragonPearl:1s}},{Slot:11b,tag:{SF_EnderDragonPearl:1s}},{Slot:12b,tag:{SF_QuarryLv4:1s}},{Slot:13b,tag:{SF_EnderDragonPearl:1s}},{Slot:20b,tag:{SF_EnderDragonPearl:1s}},{Slot:21b,tag:{SF_EnderDragonPearl:1s}},{Slot:22b,tag:{SF_EnderDragonPearl:1s}}]} run function stardust:craft/items/quarry/lv5

#No Craft Found
	execute as @s[tag=!SF_FoundCraft] unless data storage stardust:items Crafting[{Slot:16b,tag:{SF_EnderDragonPearl:1s}}] run function stardust:craft/no_craft_found
