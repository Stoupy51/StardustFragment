#Define a positive value randomly with UUID.
	scoreboard players set 4 SF_Data 4
	execute store result score Random2 SF_Data run data get entity @s UUID[2] 1
	scoreboard players operation Random2 SF_Data %= 4 SF_Data
	tp @s ~ 90 ~

#Find the perfect pos
	execute as @s[distance=..100] if block ~ ~ ~ #stardust:non_solid positioned ~ ~-1 ~ run function stardust:generate/structure/graveyard/go_down
	execute at @s unless block ~ ~ ~ grass_block run scoreboard players set Random2 SF_Data -1

#Choose a Structure
	execute if score Random2 SF_Data matches 0 at @s run setblock ~ ~1 ~ minecraft:structure_block{posX:-2,mode:"LOAD",posY:-2,posZ:-2,sizeX:6,sizeY:9,sizeZ:6,name:"stardust:graveyard_1"}
	execute if score Random2 SF_Data matches 1 at @s run setblock ~ ~1 ~ minecraft:structure_block{posX:-2,mode:"LOAD",posY:-2,posZ:-2,sizeX:6,sizeY:9,sizeZ:6,name:"stardust:graveyard_2"}
	execute if score Random2 SF_Data matches 2 at @s run setblock ~ ~1 ~ minecraft:structure_block{posX:-2,mode:"LOAD",posY:-2,posZ:-2,sizeX:6,sizeY:9,sizeZ:6,name:"stardust:graveyard_3"}
	execute if score Random2 SF_Data matches 3 at @s run setblock ~ ~1 ~ minecraft:structure_block{posX:-2,mode:"LOAD",posY:-2,posZ:-2,sizeX:6,sizeY:9,sizeZ:6,name:"stardust:graveyard_4"}
	execute if score Random2 SF_Data matches 4 at @s run setblock ~ ~1 ~ minecraft:structure_block{posX:-2,mode:"LOAD",posY:-2,posZ:-2,sizeX:6,sizeY:9,sizeZ:6,name:"stardust:graveyard_5"}
	execute if score Random2 SF_Data matches 0..4 at @s run setblock ~ ~2 ~ redstone_block
	execute if score Random2 SF_Data matches 0..4 run summon minecraft:bat ~ 150 ~ {NoAI:1b,PersistenceRequired:1b,Silent:1,Invulnerable:1,ActiveEffects:[{Id:14,Amplifier:0,Duration:2147483647,ShowParticles:0b}],Tags:["SF_Structure"]}
