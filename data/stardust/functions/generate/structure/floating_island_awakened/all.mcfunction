scoreboard players set Temp SF_Data 1
execute store result score Rotation SF_Data run data get entity @s UUID[1]
scoreboard players operation Rotation SF_Data %= 4 SE_Data
tp @s ~ 250 ~

#Find the perfect pos
	execute at @s as @s[distance=..64] if block ~ ~ ~ #stardust:non_solid positioned ~ ~-1 ~ run function stardust:generate/structure/floating_island_awakened/go_down

#Choose a Structure
	execute if score Temp SF_Data matches -1 run scoreboard players set Rotation SF_Data -1
	execute if score Temp SF_Data matches 1 run function stardust:generate/structure/height_variation
	execute if score Rotation SF_Data matches 0 at @s run setblock ~ ~1 ~ minecraft:structure_block{rotation:"NONE",posX:0,mode:"LOAD",posY:0,posZ:0,sizeX:6,sizeY:9,sizeZ:6,name:"stardust:floating_island_awakened"}
	execute if score Rotation SF_Data matches 1 at @s run setblock ~ ~1 ~ minecraft:structure_block{rotation:"CLOCKWISE_90",posX:0,mode:"LOAD",posY:0,posZ:0,sizeX:6,sizeY:9,sizeZ:6,name:"stardust:floating_island_awakened"}
	execute if score Rotation SF_Data matches 2 at @s run setblock ~ ~1 ~ minecraft:structure_block{rotation:"CLOCKWISE_180",posX:0,mode:"LOAD",posY:0,posZ:0,sizeX:6,sizeY:9,sizeZ:6,name:"stardust:floating_island_awakened"}
	execute if score Rotation SF_Data matches 3 at @s run setblock ~ ~1 ~ minecraft:structure_block{rotation:"COUNTERCLOCKWISE_90",posX:0,mode:"LOAD",posY:0,posZ:0,sizeX:6,sizeY:9,sizeZ:6,name:"stardust:floating_island_awakened"}
	execute if score Temp SF_Data matches 1 at @s run setblock ~ ~2 ~ redstone_block
	execute if score Temp SF_Data matches 1 run summon minecraft:bat ~ 150 ~ {NoAI:1b,PersistenceRequired:1b,Silent:1,Invulnerable:1,ActiveEffects:[{Id:14,Amplifier:0,Duration:2147483647,ShowParticles:0b}],Tags:["SF_Structure","SF_StardustBat"]}
