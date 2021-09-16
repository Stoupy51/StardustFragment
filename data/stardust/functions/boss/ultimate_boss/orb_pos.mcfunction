#Define a -/+ value offset randomly with UUID.
    scoreboard players set 40 SF_Data 40
    scoreboard players set 20 SF_Data 20
    execute store result score X SF_Data run data get entity @s UUID[1] 1
    execute store result score Y SF_Data run data get entity @s UUID[2] 1
    execute store result score Z SF_Data run data get entity @s UUID[3] 1
    scoreboard players operation X SF_Data %= 40 SF_Data
    scoreboard players operation Y SF_Data %= 20 SF_Data
    scoreboard players operation Z SF_Data %= 40 SF_Data
    execute store result score PosX SF_Data run data get entity @s Pos[0] 1
    execute store result score PosY SF_Data run data get entity @s Pos[1] 1
    execute store result score PosZ SF_Data run data get entity @s Pos[2] 1

#I add the offset to the coordinates
    scoreboard players operation PosX SF_Data += X SF_Data
    scoreboard players operation PosY SF_Data += Y SF_Data
    scoreboard players operation PosZ SF_Data += Z SF_Data
    execute store result entity @s Pos[0] double 1 run scoreboard players get PosX SF_Data
    execute store result entity @s Pos[1] double 1 run scoreboard players get PosY SF_Data
    execute store result entity @s Pos[2] double 1 run scoreboard players get PosZ SF_Data

execute at @s if block ~ ~ ~ #stardust:non_solid if block ~ ~-1 ~ #stardust:non_solid if block ~ ~1 ~ #stardust:non_solid if block ~ ~ ~1 #stardust:non_solid if block ~ ~ ~-1 #stardust:non_solid if block ~1 ~ ~ #stardust:non_solid if block ~-1 ~ ~ #stardust:non_solid run summon minecraft:wither ~ ~ ~ {Passengers:[{id:"minecraft:armor_stand",Glowing:1b,Invisible:1b,Invulnerable:1b,NoBasePlate:1b,NoGravity:1b,Marker:1b,ArmorItems:[{},{},{},{id:"cobblestone",Count:1b,tag:{CustomModelData:2013397}}],Tags:["SF_UltimateOrb"]}],NoAI:1b,Health:1,Attributes:[{Name:"generic.max_health",Base:1}],DeathLootTable:"none",Team:"SF_Stardust"}
kill @s
execute unless entity @e[type=armor_stand,tag=SF_UltimateOrb,limit=1] run function stardust:boss/ultimate_boss/orb
