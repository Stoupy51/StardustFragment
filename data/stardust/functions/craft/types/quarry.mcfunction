#Quarry Lv.2
	execute as @s[tag=!SF_WaitingCraft] if block ~ ~ ~ barrel{Items:[{Slot:2b,tag:{SF_StardustIngot:1s}},{Slot:3b,tag:{SF_StardustIngot:1s}},{Slot:4b,tag:{SF_StardustIngot:1s}},{Slot:11b,tag:{SF_StardustIngot:1s}},{Slot:12b,tag:{SF_QuarryLv1:1s}},{Slot:13b,tag:{SF_StardustIngot:1s}},{Slot:20b,tag:{SF_StardustIngot:1s}},{Slot:21b,tag:{SF_StardustIngot:1s}},{Slot:22b,tag:{SF_StardustIngot:1s}}]} run function stardust:craft/items/quarry/lv2
#Quarry Lv.3
	execute as @s[tag=!SF_WaitingCraft] if block ~ ~ ~ barrel{Items:[{Slot:2b,tag:{SF_StardustEssence:1s}},{Slot:3b,tag:{SF_StardustEssence:1s}},{Slot:4b,tag:{SF_StardustEssence:1s}},{Slot:11b,tag:{SF_StardustEssence:1s}},{Slot:12b,tag:{SF_QuarryLv2:1s}},{Slot:13b,tag:{SF_StardustEssence:1s}},{Slot:20b,tag:{SF_StardustEssence:1s}},{Slot:21b,tag:{SF_StardustEssence:1s}},{Slot:22b,tag:{SF_StardustEssence:1s}}]} run function stardust:craft/items/quarry/lv3
#Quarry Lv.4
	execute as @s[tag=!SF_WaitingCraft] if block ~ ~ ~ barrel{Items:[{Slot:2b,tag:{SF_DragonPearl:1s}},{Slot:3b,tag:{SF_DragonPearl:1s}},{Slot:4b,tag:{SF_DragonPearl:1s}},{Slot:11b,tag:{SF_DragonPearl:1s}},{Slot:12b,tag:{SF_QuarryLv3:1s}},{Slot:13b,tag:{SF_DragonPearl:1s}},{Slot:20b,tag:{SF_DragonPearl:1s}},{Slot:21b,tag:{SF_DragonPearl:1s}},{Slot:22b,tag:{SF_DragonPearl:1s}}]} run function stardust:craft/items/quarry/lv4
#Quarry Lv.5
	execute as @s[tag=!SF_WaitingCraft] if block ~ ~ ~ barrel{Items:[{Slot:2b,tag:{SF_EnderDragonPearl:1s}},{Slot:3b,tag:{SF_EnderDragonPearl:1s}},{Slot:4b,tag:{SF_EnderDragonPearl:1s}},{Slot:11b,tag:{SF_EnderDragonPearl:1s}},{Slot:12b,tag:{SF_QuarryLv4:1s}},{Slot:13b,tag:{SF_EnderDragonPearl:1s}},{Slot:20b,tag:{SF_EnderDragonPearl:1s}},{Slot:21b,tag:{SF_EnderDragonPearl:1s}},{Slot:22b,tag:{SF_EnderDragonPearl:1s}}]} run function stardust:craft/items/quarry/lv5

#No Craft Found
	execute as @s[tag=!SF_WaitingCraft] unless data storage stardust:items Crafting[{Slot:16b,tag:{SF_Quarry:1s}}] run function stardust:craft/no_craft_found
