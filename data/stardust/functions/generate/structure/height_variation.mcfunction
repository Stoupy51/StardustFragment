execute store result score PosY StardustFragment_Data run data get entity @s Pos[1]
scoreboard players add PosY StardustFragment_Data 10
execute store result score HeightVariation StardustFragment_Data run data get entity @s UUID[2]
scoreboard players operation HeightVariation StardustFragment_Data %= 20 SimplEnergy_Data
scoreboard players operation PosY StardustFragment_Data -= HeightVariation StardustFragment_Data
execute store result entity @s Pos[1] double 1 run scoreboard players get PosY StardustFragment_Data

scoreboard players reset PosY StardustFragment_Data
scoreboard players reset HeightVariation StardustFragment_Data
