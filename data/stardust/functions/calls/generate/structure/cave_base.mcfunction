

function simplenergy:generate/utils/random_position

scoreboard players set #max_attempts simplenergy.data 50
execute at @s run function simplenergy:generate/utils/find_adjacent_air

#Placing Ore
	execute store result score #rotation stardust.data run data get entity @s UUID[1]
	scoreboard players operation #rotation stardust.data %= #4 simplenergy.data
	scoreboard players set #success stardust.data 0
	execute at @s unless block ~ ~ ~ #simplenergy:non_solid positioned ~ ~1 ~ if block ~ ~ ~ air if block ~ ~1 ~ air if block ~ ~2 ~ air run scoreboard players set #success stardust.data 1
	execute if score #success stardust.data matches 0 run scoreboard players set #rotation stardust.data -1
	execute if score #rotation stardust.data matches 0.. at @s if block ~ ~ ~ deepslate run scoreboard players add #rotation stardust.data 10

	execute if score #rotation stardust.data matches 0 at @s run setblock ~ ~2 ~ structure_block{rotation:"NONE",mode:"LOAD",posY:-10,name:"stardust:cave_base_stone"}
	execute if score #rotation stardust.data matches 1 at @s run setblock ~ ~2 ~ structure_block{rotation:"CLOCKWISE_90",mode:"LOAD",posY:-10,name:"stardust:cave_base_stone"}
	execute if score #rotation stardust.data matches 2 at @s run setblock ~ ~2 ~ structure_block{rotation:"CLOCKWISE_180",mode:"LOAD",posY:-10,name:"stardust:cave_base_stone"}
	execute if score #rotation stardust.data matches 3 at @s run setblock ~ ~2 ~ structure_block{rotation:"COUNTERCLOCKWISE_90",mode:"LOAD",posY:-10,name:"stardust:cave_base_stone"}
	execute if score #rotation stardust.data matches 10 at @s run setblock ~ ~2 ~ structure_block{rotation:"NONE",mode:"LOAD",posY:-10,name:"stardust:cave_base_deepslate"}
	execute if score #rotation stardust.data matches 11 at @s run setblock ~ ~2 ~ structure_block{rotation:"CLOCKWISE_90",mode:"LOAD",posY:-10,name:"stardust:cave_base_deepslate"}
	execute if score #rotation stardust.data matches 12 at @s run setblock ~ ~2 ~ structure_block{rotation:"CLOCKWISE_180",mode:"LOAD",posY:-10,name:"stardust:cave_base_deepslate"}
	execute if score #rotation stardust.data matches 13 at @s run setblock ~ ~2 ~ structure_block{rotation:"COUNTERCLOCKWISE_90",mode:"LOAD",posY:-10,name:"stardust:cave_base_deepslate"}
	execute if score #rotation stardust.data matches 0.. at @s run setblock ~ ~1 ~ redstone_block
	execute if score #rotation stardust.data matches 0.. at @s run fill ~ ~1 ~ ~ ~2 ~ air
	

kill @s


