scoreboard players set Temp StardustFragment_Data 1
execute store result score Rotation StardustFragment_Data run data get entity @s UUID[1]
scoreboard players operation Rotation StardustFragment_Data %= 4 SimplEnergy_Data

#Find the perfect pos
	execute if entity @s[distance=..100] if block ~ ~ ~ #stardust:non_solid positioned ~ ~-1 ~ run function stardust:generate/structure/water_well/go_down
	execute at @s unless block ~ ~ ~ grass_block run scoreboard players set Temp StardustFragment_Data -1

#Choose a Structure
	execute if score Temp StardustFragment_Data matches -1 run scoreboard players set Rotation StardustFragment_Data -1
	execute if score Rotation StardustFragment_Data matches 0 at @s run setblock ~ ~1 ~ minecraft:structure_block{rotation:"NONE",posX:0,mode:"LOAD",posY:-5,posZ:0,sizeX:6,sizeY:9,sizeZ:6,name:"stardust:water_well"}
	execute if score Rotation StardustFragment_Data matches 1 at @s run setblock ~ ~1 ~ minecraft:structure_block{rotation:"CLOCKWISimplEnergy_90",posX:0,mode:"LOAD",posY:-5,posZ:0,sizeX:6,sizeY:9,sizeZ:6,name:"stardust:water_well"}
	execute if score Rotation StardustFragment_Data matches 2 at @s run setblock ~ ~1 ~ minecraft:structure_block{rotation:"CLOCKWISimplEnergy_180",posX:0,mode:"LOAD",posY:-5,posZ:0,sizeX:6,sizeY:9,sizeZ:6,name:"stardust:water_well"}
	execute if score Rotation StardustFragment_Data matches 3 at @s run setblock ~ ~1 ~ minecraft:structure_block{rotation:"COUNTERCLOCKWISimplEnergy_90",posX:0,mode:"LOAD",posY:-5,posZ:0,sizeX:6,sizeY:9,sizeZ:6,name:"stardust:water_well"}
	execute if score Temp StardustFragment_Data matches 1 at @s run setblock ~ ~2 ~ redstone_block
	execute if score Temp StardustFragment_Data matches 1 run summon minecraft:bat ~ 150 ~ {NoAI:1b,PersistenceRequired:1b,Silent:1,Invulnerable:1,ActiveEffects:[{Id:14,Amplifier:0,Duration:2147483647,ShowParticles:0b}],Tags:["StardustFragment_Structure","StardustFragment_StardustBat"]}
