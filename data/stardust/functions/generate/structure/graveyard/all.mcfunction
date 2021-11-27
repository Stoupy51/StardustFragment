scoreboard players set Temp SF_Data 1
tp @s ~ 90 ~

#Find the perfect pos
	execute as @s[distance=..100] if block ~ ~ ~ #stardust:non_solid positioned ~ ~-1 ~ run function stardust:generate/structure/graveyard/go_down
	execute at @s unless block ~ ~ ~ grass_block run scoreboard players set Temp SF_Data -1

#Choose a Structure
	execute if score Temp SF_Data matches 1 at @s run setblock ~ ~1 ~ minecraft:structure_block{posX:-2,mode:"LOAD",posY:-2,posZ:-2,sizeX:6,sizeY:9,sizeZ:6,name:"stardust:graveyard"}
	execute if score Temp SF_Data matches 1 at @s run setblock ~ ~2 ~ redstone_block
	execute if score Temp SF_Data matches 1 run summon minecraft:bat ~ 150 ~ {NoAI:1b,PersistenceRequired:1b,Silent:1,Invulnerable:1,ActiveEffects:[{Id:14,Amplifier:0,Duration:2147483647,ShowParticles:0b}],Tags:["SF_Structure","SF_StardustBat"]}
