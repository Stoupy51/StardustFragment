#Define a -/+ value offset randomly with UUID.
	scoreboard players set 40 StardustFragment_Data 40
	scoreboard players set 20 StardustFragment_Data 20
	execute store result score X StardustFragment_Data run data get entity @s UUID[1] 1
	execute store result score Y StardustFragment_Data run data get entity @s UUID[2] 1
	execute store result score Z StardustFragment_Data run data get entity @s UUID[3] 1
	scoreboard players operation X StardustFragment_Data %= 40 StardustFragment_Data
	scoreboard players operation Y StardustFragment_Data %= 20 StardustFragment_Data
	scoreboard players operation Z StardustFragment_Data %= 40 StardustFragment_Data
	execute store result score PosX StardustFragment_Data run data get entity @s Pos[0] 1
	execute store result score PosY StardustFragment_Data run data get entity @s Pos[1] 1
	execute store result score PosZ StardustFragment_Data run data get entity @s Pos[2] 1

#I add the offset to the coordinates
	scoreboard players operation PosX StardustFragment_Data += X StardustFragment_Data
	scoreboard players operation PosY StardustFragment_Data += Y StardustFragment_Data
	scoreboard players operation PosZ StardustFragment_Data += Z StardustFragment_Data
	execute store result entity @s Pos[0] double 1 run scoreboard players get PosX StardustFragment_Data
	execute store result entity @s Pos[1] double 1 run scoreboard players get PosY StardustFragment_Data
	execute store result entity @s Pos[2] double 1 run scoreboard players get PosZ StardustFragment_Data

execute at @s if block ~ ~ ~ #stardust:non_solid if block ~ ~-1 ~ #stardust:non_solid if block ~ ~1 ~ #stardust:non_solid if block ~ ~ ~1 #stardust:non_solid if block ~ ~ ~-1 #stardust:non_solid if block ~1 ~ ~ #stardust:non_solid if block ~-1 ~ ~ #stardust:non_solid run summon minecraft:shulker ~ ~ ~ {Passengers:[{id:"minecraft:armor_stand",Glowing:1b,Invisible:1b,Invulnerable:1b,NoBasePlate:1b,NoGravity:1b,Marker:1b,ArmorItems:[{},{},{},{id:"cobblestone",Count:1b,tag:{Enchantments:[{id:"protection",lvl:0}],CustomModelData:2013397}}],Tags:["StardustFragment_UltimateOrb"]}],Peek:30b,NoAI:1b,Health:1,Attributes:[{Name:"generic.max_health",Base:1}],DeathLootTable:"none",Team:"StardustFragment_Stardust",Tags:["StardustFragment_UltimateOrb"]}
kill @s
execute unless entity @e[type=armor_stand,tag=StardustFragment_UltimateOrb,limit=1] run function stardust:boss/ultimate_boss/orb
