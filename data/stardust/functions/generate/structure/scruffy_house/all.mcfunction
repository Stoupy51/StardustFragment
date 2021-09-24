#Define a positive value randomly with UUID.
	scoreboard players set 4 SF_Data 4
	execute store result score Random2 SF_Data run data get entity @s UUID[2] 1
	scoreboard players operation Random2 SF_Data %= 4 SF_Data

#Find the perfect pos
	execute if entity @e[type=marker,distance=..150,tag=SF_ScruffyHouse] run scoreboard players set Random2 SF_Data -1
	execute as @s[distance=..100] positioned ~ ~-1 ~ unless block ~ ~ ~ podzol run function stardust:generate/structure/scruffy_house/go_down
	execute at @s unless block ~ ~ ~ podzol run scoreboard players set Random2 SF_Data -1

#Choose a Structure
	execute if score Random2 SF_Data matches 0 at @s run setblock ~ ~1 ~ minecraft:structure_block{posX:-2,mode:"LOAD",posY:-1,posZ:-2,sizeX:6,sizeY:9,sizeZ:6,name:"stardust:scruffy_house_1"}
	execute if score Random2 SF_Data matches 1 at @s run setblock ~ ~1 ~ minecraft:structure_block{posX:-2,mode:"LOAD",posY:-1,posZ:-2,sizeX:6,sizeY:9,sizeZ:6,name:"stardust:scruffy_house_2"}
	execute if score Random2 SF_Data matches 2 at @s run setblock ~ ~1 ~ minecraft:structure_block{posX:-2,mode:"LOAD",posY:-1,posZ:-2,sizeX:6,sizeY:9,sizeZ:6,name:"stardust:scruffy_house_3"}
	execute if score Random2 SF_Data matches 3 at @s run setblock ~ ~1 ~ minecraft:structure_block{posX:-2,mode:"LOAD",posY:-1,posZ:-2,sizeX:6,sizeY:9,sizeZ:6,name:"stardust:scruffy_house_4"}
	execute if score Random2 SF_Data matches 4 at @s run setblock ~ ~1 ~ minecraft:structure_block{posX:-2,mode:"LOAD",posY:-1,posZ:-2,sizeX:6,sizeY:9,sizeZ:6,name:"stardust:scruffy_house_5"}
	execute if score Random2 SF_Data matches 0..4 at @s run setblock ~ ~2 ~ redstone_block
	execute if score Random2 SF_Data matches 0..4 at @s run summon minecraft:marker ~ 150 ~ {Tags:["SF_ScruffyHouse"]}
