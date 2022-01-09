#Quarry Lv.5
	execute if entity @s[tag=!StardustFragment_FoundCraft] if block ~ ~ ~ barrel{Items:[{Slot:2b,tag:{StardustFragment_EnderDragonPearl:1b}},{Slot:3b,tag:{StardustFragment_EnderDragonPearl:1b}},{Slot:4b,tag:{StardustFragment_EnderDragonPearl:1b}},{Slot:11b,tag:{StardustFragment_EnderDragonPearl:1b}},{Slot:12b,tag:{StardustFragment_QuarryLv4:1b}},{Slot:13b,tag:{StardustFragment_EnderDragonPearl:1b}},{Slot:20b,tag:{StardustFragment_EnderDragonPearl:1b}},{Slot:21b,tag:{StardustFragment_EnderDragonPearl:1b}},{Slot:22b,tag:{StardustFragment_EnderDragonPearl:1b}}]} run function stardust:craft/items/quarry/lv5

#No Craft Found
	execute if entity @s[tag=!StardustFragment_FoundCraft] unless data storage stardust:items all.Crafting[{Slot:16b,tag:{StardustFragment_EnderDragonPearl:1b}}] run function stardust:craft/no_craft_found
