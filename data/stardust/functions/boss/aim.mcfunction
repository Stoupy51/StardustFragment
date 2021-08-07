execute store result score X SF_Data run data get entity @s Pos[0] 1000000
execute store result score Y SF_Data run data get entity @s Pos[1] 1000000
execute store result score Z SF_Data run data get entity @s Pos[2] 1000000

tp @s ^ ^ ^0.001

execute store result score Dx SF_Data run data get entity @s Pos[0] 1000000
execute store result score Dy SF_Data run data get entity @s Pos[1] 1000000
execute store result score Dz SF_Data run data get entity @s Pos[2] 1000000

scoreboard players operation Dx SF_Data -= X SF_Data
scoreboard players operation Dy SF_Data -= Y SF_Data
scoreboard players operation Dz SF_Data -= Z SF_Data

execute store result entity @s Motion[0] double 0.006 run scoreboard players get Dx SF_Data
execute store result entity @s Motion[1] double 0.006 run scoreboard players get Dy SF_Data
execute store result entity @s Motion[2] double 0.006 run scoreboard players get Dz SF_Data

tag @s remove SF_ToThrow
scoreboard players add @s SF_Data 1