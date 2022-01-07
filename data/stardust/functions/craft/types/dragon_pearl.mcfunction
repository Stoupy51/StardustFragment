#Ender Dragon Pearl
	execute as @s[tag=!StardustFragment_FoundCraft] if block ~ ~ ~ barrel{Items:[{Slot:2b,id:"minecraft:ender_pearl"},{Slot:3b,id:"minecraft:ender_pearl"},{Slot:4b,id:"minecraft:ender_pearl"},{Slot:11b,id:"minecraft:ender_pearl"},{Slot:12b,tag:{StardustFragment_DragonPearl:1b}},{Slot:13b,id:"minecraft:ender_pearl"},{Slot:20b,id:"minecraft:ender_pearl"},{Slot:21b,id:"minecraft:ender_pearl"},{Slot:22b,id:"minecraft:ender_pearl"}]} run function stardust:craft/items/ender_dragon_pearl
#Travel Staff
	execute as @s[tag=!StardustFragment_FoundCraft] if block ~ ~ ~ barrel{Items:[{Slot:2b,tag:{StardustFragment_DragonPearl:1b}},{Slot:11b,id:"minecraft:stick"}]} unless data storage stardust:items all.Crafting[{Slot:3b}] unless data storage stardust:items all.Crafting[{Slot:4b}] unless data storage stardust:items all.Crafting[{Slot:12b}] unless data storage stardust:items all.Crafting[{Slot:13b}] unless data storage stardust:items all.Crafting[{Slot:20b}] unless data storage stardust:items all.Crafting[{Slot:21b}] unless data storage stardust:items all.Crafting[{Slot:22b}] run function stardust:craft/items/travel_staff
	execute as @s[tag=!StardustFragment_FoundCraft] if block ~ ~ ~ barrel{Items:[{Slot:3b,tag:{StardustFragment_DragonPearl:1b}},{Slot:12b,id:"minecraft:stick"}]} unless data storage stardust:items all.Crafting[{Slot:2b}] unless data storage stardust:items all.Crafting[{Slot:4b}] unless data storage stardust:items all.Crafting[{Slot:11b}] unless data storage stardust:items all.Crafting[{Slot:13b}] unless data storage stardust:items all.Crafting[{Slot:20b}] unless data storage stardust:items all.Crafting[{Slot:21b}] unless data storage stardust:items all.Crafting[{Slot:22b}] run function stardust:craft/items/travel_staff
	execute as @s[tag=!StardustFragment_FoundCraft] if block ~ ~ ~ barrel{Items:[{Slot:4b,tag:{StardustFragment_DragonPearl:1b}},{Slot:13b,id:"minecraft:stick"}]} unless data storage stardust:items all.Crafting[{Slot:2b}] unless data storage stardust:items all.Crafting[{Slot:3b}] unless data storage stardust:items all.Crafting[{Slot:11b}] unless data storage stardust:items all.Crafting[{Slot:12b}] unless data storage stardust:items all.Crafting[{Slot:20b}] unless data storage stardust:items all.Crafting[{Slot:21b}] unless data storage stardust:items all.Crafting[{Slot:22b}] run function stardust:craft/items/travel_staff
	execute as @s[tag=!StardustFragment_FoundCraft] if block ~ ~ ~ barrel{Items:[{Slot:11b,tag:{StardustFragment_DragonPearl:1b}},{Slot:20b,id:"minecraft:stick"}]} unless data storage stardust:items all.Crafting[{Slot:2b}] unless data storage stardust:items all.Crafting[{Slot:3b}] unless data storage stardust:items all.Crafting[{Slot:4b}] unless data storage stardust:items all.Crafting[{Slot:12b}] unless data storage stardust:items all.Crafting[{Slot:13b}] unless data storage stardust:items all.Crafting[{Slot:21b}] unless data storage stardust:items all.Crafting[{Slot:22b}] run function stardust:craft/items/travel_staff
	execute as @s[tag=!StardustFragment_FoundCraft] if block ~ ~ ~ barrel{Items:[{Slot:12b,tag:{StardustFragment_DragonPearl:1b}},{Slot:21b,id:"minecraft:stick"}]} unless data storage stardust:items all.Crafting[{Slot:2b}] unless data storage stardust:items all.Crafting[{Slot:3b}] unless data storage stardust:items all.Crafting[{Slot:4b}] unless data storage stardust:items all.Crafting[{Slot:11b}] unless data storage stardust:items all.Crafting[{Slot:13b}] unless data storage stardust:items all.Crafting[{Slot:20b}] unless data storage stardust:items all.Crafting[{Slot:22b}] run function stardust:craft/items/travel_staff
	execute as @s[tag=!StardustFragment_FoundCraft] if block ~ ~ ~ barrel{Items:[{Slot:13b,tag:{StardustFragment_DragonPearl:1b}},{Slot:22b,id:"minecraft:stick"}]} unless data storage stardust:items all.Crafting[{Slot:2b}] unless data storage stardust:items all.Crafting[{Slot:3b}] unless data storage stardust:items all.Crafting[{Slot:4b}] unless data storage stardust:items all.Crafting[{Slot:11b}] unless data storage stardust:items all.Crafting[{Slot:12b}] unless data storage stardust:items all.Crafting[{Slot:20b}] unless data storage stardust:items all.Crafting[{Slot:21b}] run function stardust:craft/items/travel_staff
#Quarry Lv.4
	execute as @s[tag=!StardustFragment_FoundCraft] if block ~ ~ ~ barrel{Items:[{Slot:2b,tag:{StardustFragment_DragonPearl:1b}},{Slot:3b,tag:{StardustFragment_DragonPearl:1b}},{Slot:4b,tag:{StardustFragment_DragonPearl:1b}},{Slot:11b,tag:{StardustFragment_DragonPearl:1b}},{Slot:12b,tag:{StardustFragment_QuarryLv3:1b}},{Slot:13b,tag:{StardustFragment_DragonPearl:1b}},{Slot:20b,tag:{StardustFragment_DragonPearl:1b}},{Slot:21b,tag:{StardustFragment_DragonPearl:1b}},{Slot:22b,tag:{StardustFragment_DragonPearl:1b}}]} run function stardust:craft/items/quarry/lv4

#No Craft Found
	execute as @s[tag=!StardustFragment_FoundCraft] unless data storage stardust:items all.Crafting[{Slot:16b,tag:{StardustFragment_DragonPearl:1b}}] run function stardust:craft/no_craft_found
