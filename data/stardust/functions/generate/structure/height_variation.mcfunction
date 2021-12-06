execute store result score PosY SF_Data run data get entity @s Pos[1]
scoreboard players add PosY SF_Data 10
execute store result score HeightVariation SF_Data run data get entity @s UUID[2]
scoreboard players operation HeightVariation SF_Data %= 20 SE_Data
scoreboard players operation PosY SF_Data -= HeightVariation SF_Data
execute store result entity @s Pos[1] double 1 run scoreboard players get PosY SF_Data

scoreboard players reset PosY SF_Data
scoreboard players reset HeightVariation SF_Data
