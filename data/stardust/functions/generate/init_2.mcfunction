#Correct Position
	function simplenergy:generate/correct_position

#Generate structures
	execute at @s run summon marker ~ 150 ~ {Tags:["StardustFragment_StructurePos"]}
	execute at @s as @e[type=marker,tag=StardustFragment_StructurePos] at @s run function stardust:generate/structure/all

#Generate Stardust Ore (x4)
#Or Awakened Stardust Ore (x8) in minecraft:the_nether
	execute at @s as @e[limit=8] run summon marker ~ 0 ~ {Tags:["StardustFragment_OrePos"]}
	execute at @s in minecraft:the_nether as @e[type=marker,tag=StardustFragment_OrePos,distance=0..,limit=8] at @s run function stardust:generate/awakened_stardust
	execute at @s as @e[type=marker,tag=StardustFragment_OrePos,limit=4] at @s run function stardust:generate/stardust

#Generate Simplunium Ore Or More Stardust Ores
	execute at @s as @e[limit=8] run summon marker ~ 0 ~ {Tags:["StardustFragment_OrePos"]}
	execute at @s in stardust:stardust as @e[type=marker,tag=StardustFragment_OrePos,distance=0..,limit=8] at @s run function stardust:generate/simplunium
	execute at @s in stardust:stardust as @e[type=marker,tag=StardustFragment_OrePos,distance=0..,limit=8] at @s run function stardust:generate/stardust
	execute at @s in minecraft:the_end as @e[type=marker,tag=StardustFragment_OrePos,distance=0..,limit=8] at @s run function stardust:generate/stardust

#Generate More Iron Ores in Cavern Dimension
	execute at @s in stardust:cavern as @s[distance=0..] as @e[limit=128] run summon marker ~ 0 ~ {Tags:["StardustFragment_OrePos"]}
	execute at @s in stardust:cavern as @e[type=marker,tag=StardustFragment_OrePos,distance=0..] at @s run function stardust:generate/iron

kill @e[type=marker,tag=StardustFragment_OrePos]
scoreboard players reset X SimplEnergy_Data
scoreboard players reset Y SimplEnergy_Data
scoreboard players reset Z SimplEnergy_Data
scoreboard players reset NewX SimplEnergy_Data
scoreboard players reset NewY SimplEnergy_Data
scoreboard players reset NewZ SimplEnergy_Data
scoreboard players reset PosX SimplEnergy_Data
scoreboard players reset PosY SimplEnergy_Data
scoreboard players reset PosZ SimplEnergy_Data
scoreboard players reset MaxY SimplEnergy_Data
tag @s remove StardustFragment_ChunkInit
