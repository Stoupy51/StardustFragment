#Stardust Block
	execute as @s[tag=!SF_WaitingCraft] if block ~ ~ ~ barrel{Items:[{Slot:2b,tag:{SF_StardustFragment:1s}},{Slot:3b,tag:{SF_StardustFragment:1s}},{Slot:4b,tag:{SF_StardustFragment:1s}},{Slot:11b,tag:{SF_StardustFragment:1s}},{Slot:12b,tag:{SF_StardustFragment:1s}},{Slot:13b,tag:{SF_StardustFragment:1s}},{Slot:20b,tag:{SF_StardustFragment:1s}},{Slot:21b,tag:{SF_StardustFragment:1s}},{Slot:22b,tag:{SF_StardustFragment:1s}}]} run function stardust:craft/items/stardust_block
#Stardust Ingot
	execute as @s[tag=!SF_WaitingCraft] if block ~ ~ ~ barrel{Items:[{Slot:2b,tag:{SF_StardustFragment:1s}},{Slot:3b,tag:{SF_StardustFragment:1s}},{Slot:4b,tag:{SF_StardustFragment:1s}},{Slot:11b,tag:{SF_StardustFragment:1s}},{Slot:12b,id:"minecraft:iron_ingot"},{Slot:13b,tag:{SF_StardustFragment:1s}},{Slot:20b,tag:{SF_StardustFragment:1s}},{Slot:21b,tag:{SF_StardustFragment:1s}},{Slot:22b,tag:{SF_StardustFragment:1s}}]} run function stardust:craft/items/stardust_ingot
#Compacted Stardust
	execute as @s[tag=!SF_WaitingCraft] if block ~ ~ ~ barrel{Items:[{Slot:2b,id:"minecraft:blue_concrete"},{Slot:3b,id:"minecraft:blue_concrete"},{Slot:4b,id:"minecraft:blue_concrete"},{Slot:11b,id:"minecraft:blue_concrete"},{Slot:12b,tag:{SF_StardustFragment:1s}},{Slot:13b,id:"minecraft:blue_concrete"},{Slot:20b,id:"minecraft:blue_concrete"},{Slot:21b,id:"minecraft:blue_concrete"},{Slot:22b,id:"minecraft:blue_concrete"}]} run function stardust:craft/items/compacted_stardust
#Stardust Seed
	execute as @s[tag=!SF_WaitingCraft] if block ~ ~ ~ barrel{Items:[{Slot:2b,id:"minecraft:wheat_seeds"},{Slot:3b,id:"minecraft:wheat_seeds"},{Slot:4b,id:"minecraft:wheat_seeds"},{Slot:11b,id:"minecraft:wheat_seeds"},{Slot:12b,tag:{SF_StardustFragment:1s}},{Slot:13b,id:"minecraft:wheat_seeds"},{Slot:20b,id:"minecraft:wheat_seeds"},{Slot:21b,id:"minecraft:wheat_seeds"},{Slot:22b,id:"minecraft:wheat_seeds"}]} run function stardust:craft/items/seeds/stardust
#Advanced Stardust Seed
	execute as @s[tag=!SF_WaitingCraft] if block ~ ~ ~ barrel{Items:[{Slot:2b,tag:{SF_StardustFragment:1s}},{Slot:3b,tag:{SF_StardustFragment:1s}},{Slot:4b,tag:{SF_StardustFragment:1s}},{Slot:11b,tag:{SF_StardustFragment:1s}},{Slot:12b,tag:{SF_StardustSeed:1s}},{Slot:13b,tag:{SF_StardustFragment:1s}},{Slot:20b,tag:{SF_StardustFragment:1s}},{Slot:21b,tag:{SF_StardustFragment:1s}},{Slot:22b,tag:{SF_StardustFragment:1s}}]} run function stardust:craft/items/seeds/advanced_stardust
#Cobblestone Miner Lv.2
	execute as @s[tag=!SF_WaitingCraft] if block ~ ~ ~ barrel{Items:[{Slot:2b,tag:{SF_StardustFragment:1s}},{Slot:3b,tag:{SF_StardustFragment:1s}},{Slot:4b,tag:{SF_StardustFragment:1s}},{Slot:11b,tag:{SF_StardustFragment:1s}},{Slot:12b,tag:{SF_CobblestoneMinerLv1:1s}},{Slot:13b,tag:{SF_StardustFragment:1s}},{Slot:20b,tag:{SF_StardustFragment:1s}},{Slot:21b,tag:{SF_StardustFragment:1s}},{Slot:22b,tag:{SF_StardustFragment:1s}}]} run function stardust:craft/items/cobblestone_miner/lv2
