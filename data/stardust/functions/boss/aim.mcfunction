execute store result score X StardustFragment_Data run data get entity @s Pos[0] 1000000
execute store result score Y StardustFragment_Data run data get entity @s Pos[1] 1000000
execute store result score Z StardustFragment_Data run data get entity @s Pos[2] 1000000

tp @s ^ ^ ^0.001

execute store result score Dx StardustFragment_Data run data get entity @s Pos[0] 1000000
execute store result score Dy StardustFragment_Data run data get entity @s Pos[1] 1000000
execute store result score Dz StardustFragment_Data run data get entity @s Pos[2] 1000000

scoreboard players operation Dx StardustFragment_Data -= X StardustFragment_Data
scoreboard players operation Dy StardustFragment_Data -= Y StardustFragment_Data
scoreboard players operation Dz StardustFragment_Data -= Z StardustFragment_Data

execute store result entity @s Motion[0] double 0.006 run scoreboard players get Dx StardustFragment_Data
execute store result entity @s Motion[1] double 0.006 run scoreboard players get Dy StardustFragment_Data
execute store result entity @s Motion[2] double 0.006 run scoreboard players get Dz StardustFragment_Data

tag @s remove StardustFragment_ToThrow
scoreboard players add @s StardustFragment_Data 1
