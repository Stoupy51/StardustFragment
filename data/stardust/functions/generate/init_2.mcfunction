#Generate structures
	summon minecraft:marker ~ 150 ~ {Tags:["SF_StructurePos"]}
	execute as @e[type=marker,tag=SF_StructurePos] at @s run function stardust:generate/structure/all

#Generate Stardust Ore (x16)
#Or Awakened Stardust Ore (x5) in minecraft:the_nether
	summon minecraft:marker ~ 0 ~ {Tags:["SF_OrePos"]}
	summon minecraft:marker ~ 0 ~ {Tags:["SF_OrePos"]}
	summon minecraft:marker ~ 0 ~ {Tags:["SF_OrePos"]}
	summon minecraft:marker ~ 0 ~ {Tags:["SF_OrePos"]}
	summon minecraft:marker ~ 0 ~ {Tags:["SF_OrePos"]}
	summon minecraft:marker ~ 0 ~ {Tags:["SF_OrePos"]}
	summon minecraft:marker ~ 0 ~ {Tags:["SF_OrePos"]}
	summon minecraft:marker ~ 0 ~ {Tags:["SF_OrePos"]}
	summon minecraft:marker ~ 0 ~ {Tags:["SF_OrePos"]}
	summon minecraft:marker ~ 0 ~ {Tags:["SF_OrePos"]}
	summon minecraft:marker ~ 0 ~ {Tags:["SF_OrePos"]}
	summon minecraft:marker ~ 0 ~ {Tags:["SF_OrePos"]}
	summon minecraft:marker ~ 0 ~ {Tags:["SF_OrePos"]}
	summon minecraft:marker ~ 0 ~ {Tags:["SF_OrePos"]}
	summon minecraft:marker ~ 0 ~ {Tags:["SF_OrePos"]}
	summon minecraft:marker ~ 0 ~ {Tags:["SF_OrePos"]}
	execute in minecraft:the_nether as @e[type=marker,tag=SF_OrePos,distance=0..,limit=5] at @s run function stardust:generate/awakened_stardust
	execute as @e[type=marker,tag=SF_OrePos] at @s run function stardust:generate/stardust

#Generate Quadruple Compressed Cobblestone Or More Stardust Ores
	summon minecraft:marker ~ 0 ~ {Tags:["SF_OrePos"]}
	summon minecraft:marker ~ 0 ~ {Tags:["SF_OrePos"]}
	summon minecraft:marker ~ 0 ~ {Tags:["SF_OrePos"]}
	summon minecraft:marker ~ 0 ~ {Tags:["SF_OrePos"]}
	summon minecraft:marker ~ 0 ~ {Tags:["SF_OrePos"]}
	summon minecraft:marker ~ 0 ~ {Tags:["SF_OrePos"]}
	summon minecraft:marker ~ 0 ~ {Tags:["SF_OrePos"]}
	summon minecraft:marker ~ 0 ~ {Tags:["SF_OrePos"]}
	summon minecraft:marker ~ 0 ~ {Tags:["SF_OrePos"]}
	summon minecraft:marker ~ 0 ~ {Tags:["SF_OrePos"]}
	summon minecraft:marker ~ 0 ~ {Tags:["SF_OrePos"]}
	summon minecraft:marker ~ 0 ~ {Tags:["SF_OrePos"]}
	summon minecraft:marker ~ 0 ~ {Tags:["SF_OrePos"]}
	summon minecraft:marker ~ 0 ~ {Tags:["SF_OrePos"]}
	summon minecraft:marker ~ 0 ~ {Tags:["SF_OrePos"]}
	summon minecraft:marker ~ 0 ~ {Tags:["SF_OrePos"]}
	execute in stardust:stardust as @e[type=marker,tag=SF_OrePos,distance=0..,limit=8] at @s run function stardust:generate/quadruple_compressed_cobblestone
	execute in stardust:cavern as @e[type=marker,tag=SF_OrePos,distance=0..,limit=8] at @s run function stardust:generate/stardust
	execute in stardust:stardust as @e[type=marker,tag=SF_OrePos,distance=0..,limit=8] at @s run function stardust:generate/stardust
	execute in minecraft:the_end as @e[type=marker,tag=SF_OrePos,distance=0..,limit=8] at @s run function stardust:generate/stardust
	kill @e[type=marker,tag=SF_OrePos]

scoreboard players reset X SE_Data
scoreboard players reset Y SE_Data
scoreboard players reset Z SE_Data
scoreboard players reset NewX SE_Data
scoreboard players reset NewY SE_Data
scoreboard players reset NewZ SE_Data
scoreboard players reset PosX SE_Data
scoreboard players reset PosY SE_Data
scoreboard players reset PosZ SE_Data
scoreboard players reset MaxY SE_Data
tag @s remove SF_ChunkInit
