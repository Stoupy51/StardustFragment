#Wormhole Potion (x9)
	execute as @s[tag=!SF_FoundCraft] if block ~ ~ ~ barrel{Items:[{Slot:2b,tag:{SF_WormholePotion:1s}},{Slot:3b,tag:{SF_WormholePotion:1s}},{Slot:4b,tag:{SF_WormholePotion:1s}},{Slot:11b,tag:{SF_WormholePotion:1s}},{Slot:12b,tag:{SF_WormholePotion:1s}},{Slot:13b,tag:{SF_WormholePotion:1s}},{Slot:20b,tag:{SF_WormholePotion:1s}},{Slot:21b,tag:{SF_WormholePotion:1s}},{Slot:22b,tag:{SF_WormholePotion:1s}}]} run function stardust:craft/items/wormhole_potion_x9
#Diamond Seeds
	execute as @s[tag=!SF_FoundCraft] if block ~ ~ ~ barrel{Items:[{Slot:2b,id:"minecraft:diamond"},{Slot:3b,id:"minecraft:diamond"},{Slot:4b,id:"minecraft:diamond"},{Slot:11b,id:"minecraft:diamond"},{Slot:12b,tag:{SF_DiamondSeed:1s}},{Slot:13b,id:"minecraft:diamond"},{Slot:20b,id:"minecraft:diamond"},{Slot:21b,id:"minecraft:diamond"},{Slot:22b,id:"minecraft:diamond"}]} run function stardust:craft/items/seeds/advanced_diamond
#Stoupy's Egg
	execute as @s[tag=!SF_FoundCraft] if block ~ ~ ~ barrel{Items:[{Slot:2b,tag:{SF_DogExcrement:1s}},{Slot:3b,tag:{SF_DogExcrement:1s}},{Slot:4b,tag:{SF_DogExcrement:1s}},{Slot:11b,tag:{SF_DogExcrement:1s}},{Slot:12b,id:"minecraft:cake"},{Slot:13b,tag:{SF_DogExcrement:1s}},{Slot:20b,tag:{SF_DogExcrement:1s}},{Slot:21b,tag:{SF_DogExcrement:1s}},{Slot:22b,tag:{SF_DogExcrement:1s}}]} run function stardust:craft/items/stoup_egg
#Machine Frame
	execute as @s[tag=!SF_FoundCraft] if block ~ ~ ~ barrel{Items:[{Slot:2b,id:"minecraft:iron_ingot"},{Slot:3b,id:"minecraft:iron_ingot"},{Slot:4b,id:"minecraft:iron_ingot"},{Slot:11b,id:"minecraft:iron_ingot"},{Slot:12b,tag:{SE_SimpluniumBlock:1s}},{Slot:13b,id:"minecraft:iron_ingot"},{Slot:20b,id:"minecraft:iron_ingot"},{Slot:21b,id:"minecraft:iron_ingot"},{Slot:22b,id:"minecraft:iron_ingot"}]} run function stardust:craft/items/machine_frame
#Advanced Furnace Generator
	execute as @s[tag=!SF_FoundCraft] if block ~ ~ ~ barrel{Items:[{Slot:2b,tag:{SF_MachineFrame:1s}},{Slot:3b,tag:{SF_MachineFrame:1s}},{Slot:4b,tag:{SF_MachineFrame:1s}},{Slot:11b,id:"minecraft:glass"},{Slot:12b,tag:{SE_FurnaceGenerator:1s}},{Slot:13b,id:"minecraft:glass"},{Slot:20b,id:"minecraft:iron_block"},{Slot:21b,id:"minecraft:iron_block"},{Slot:22b,id:"minecraft:iron_block"}]} run function stardust:craft/items/advanced_furnace_generator
#Redstone Generator
	execute as @s[tag=!SF_FoundCraft] if block ~ ~ ~ barrel{Items:[{Slot:2b,tag:{SF_MachineFrame:1s}},{Slot:3b,tag:{SF_MachineFrame:1s}},{Slot:4b,tag:{SF_MachineFrame:1s}},{Slot:11b,id:"minecraft:redstone_block"},{Slot:12b,tag:{SE_FurnaceGenerator:1s}},{Slot:13b,id:"minecraft:redstone_block"},{Slot:20b,id:"minecraft:redstone_block"},{Slot:21b,id:"minecraft:redstone_block"},{Slot:22b,id:"minecraft:redstone_block"}]} run function stardust:craft/items/redstone_generator
#Nether Star Generator
	execute as @s[tag=!SF_FoundCraft] if block ~ ~ ~ barrel{Items:[{Slot:2b,tag:{SF_MachineFrame:1s}},{Slot:3b,tag:{SF_MachineFrame:1s}},{Slot:4b,tag:{SF_MachineFrame:1s}},{Slot:11b,id:"minecraft:nether_star"},{Slot:12b,tag:{SF_RedstoneGenerator:1s}},{Slot:13b,id:"minecraft:nether_star"},{Slot:20b,id:"minecraft:iron_block"},{Slot:21b,id:"minecraft:iron_block"},{Slot:22b,id:"minecraft:iron_block"}]} run function stardust:craft/items/nether_star_generator
#Heat Generator
	execute as @s[tag=!SF_FoundCraft] if block ~ ~ ~ barrel{Items:[{Slot:2b,id:"minecraft:iron_block"},{Slot:3b,id:"minecraft:glass"},{Slot:4b,id:"minecraft:iron_block"},{Slot:11b,id:"minecraft:glass"},{Slot:12b,tag:{SF_MachineFrame:1s}},{Slot:13b,id:"minecraft:glass"},{Slot:20b,id:"minecraft:iron_block"},{Slot:21b,id:"minecraft:glass"},{Slot:22b,id:"minecraft:iron_block"}]} run function stardust:craft/items/heat_generator
#Empty Module
	execute as @s[tag=!SF_FoundCraft] if block ~ ~ ~ barrel{Items:[{Slot:2b,id:"minecraft:paper"},{Slot:3b,id:"minecraft:paper"},{Slot:4b,id:"minecraft:paper"},{Slot:11b,id:"minecraft:paper"},{Slot:12b,tag:{SE_SimpluniumIngot:1s}},{Slot:13b,id:"minecraft:paper"},{Slot:20b,id:"minecraft:paper"},{Slot:21b,id:"minecraft:paper"},{Slot:22b,id:"minecraft:paper"}]} run function stardust:craft/items/empty_module
#Silk Touch Module
	execute as @s[tag=!SF_FoundCraft] if block ~ ~ ~ barrel{Items:[{Slot:2b,id:"minecraft:iron_ore"},{Slot:3b,id:"minecraft:iron_ore"},{Slot:4b,id:"minecraft:iron_ore"},{Slot:11b,id:"minecraft:iron_ore"},{Slot:12b,tag:{SF_EmptyModule:1s}},{Slot:13b,id:"minecraft:iron_ore"},{Slot:20b,id:"minecraft:iron_ore"},{Slot:21b,id:"minecraft:iron_ore"},{Slot:22b,id:"minecraft:iron_ore"}]} run function stardust:craft/items/silk_touch_module
#Fortune Module
	execute as @s[tag=!SF_FoundCraft] if block ~ ~ ~ barrel{Items:[{Slot:2b,id:"minecraft:emerald"},{Slot:3b,id:"minecraft:diamond"},{Slot:4b,id:"minecraft:emerald"},{Slot:11b,id:"minecraft:diamond"},{Slot:12b,tag:{SF_EmptyModule:1s}},{Slot:13b,id:"minecraft:diamond"},{Slot:20b,id:"minecraft:emerald"},{Slot:21b,id:"minecraft:diamond"},{Slot:22b,id:"minecraft:emerald"}]} run function stardust:craft/items/fortune_module


#Types Crafts
	execute as @s[tag=!SF_FoundCraft] run function stardust:craft/types/all

tag @s add SF_FoundCraft
