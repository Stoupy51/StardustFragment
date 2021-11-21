#Generate structures
	summon marker ~ 150 ~ {Tags:["SF_StructurePos"]}
	execute as @e[type=marker,tag=SF_StructurePos] at @s run function stardust:generate/structure/all

#Generate Stardust Ore (x4)
#Or Awakened Stardust Ore (x8) in minecraft:the_nether
	execute as @e[limit=8] run summon marker ~ 0 ~ {Tags:["SF_OrePos"]}
	execute in minecraft:the_nether as @e[type=marker,tag=SF_OrePos,distance=0..,limit=8] at @s run function stardust:generate/awakened_stardust
	execute as @e[type=marker,tag=SF_OrePos,limit=4] at @s run function stardust:generate/stardust

#Generate Simplunium Ore Or More Stardust Ores
	execute as @e[limit=8] run summon marker ~ 0 ~ {Tags:["SF_OrePos"]}
	execute in stardust:stardust as @e[type=marker,tag=SF_OrePos,distance=0..,limit=8] at @s run function stardust:generate/simplunium
	execute in stardust:stardust as @e[type=marker,tag=SF_OrePos,distance=0..,limit=8] at @s run function stardust:generate/stardust
	execute in minecraft:the_end as @e[type=marker,tag=SF_OrePos,distance=0..,limit=8] at @s run function stardust:generate/stardust

#Generate More Iron Ores in Cavern Dimension
	execute in stardust:cavern as @s[distance=0..] as @e[limit=128] run summon marker ~ 0 ~ {Tags:["SF_OrePos"]}
	execute in stardust:cavern as @e[type=marker,tag=SF_OrePos,distance=0..] at @s run function stardust:generate/iron

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
