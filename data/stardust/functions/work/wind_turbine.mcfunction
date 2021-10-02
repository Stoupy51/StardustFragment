execute store result score Temp SF_Data run data get entity @s Pos[1] 0.1

execute if score Temp SF_Data matches 6 run scoreboard players add @s EF_kJ 2
execute if score Temp SF_Data matches 7 run scoreboard players add @s EF_kJ 4
execute if score Temp SF_Data matches 8 run scoreboard players add @s EF_kJ 6
execute if score Temp SF_Data matches 9 run scoreboard players add @s EF_kJ 8
execute if score Temp SF_Data matches 10 run scoreboard players add @s EF_kJ 10
execute if score Temp SF_Data matches 11 run scoreboard players add @s EF_kJ 12
execute if score Temp SF_Data matches 12 run scoreboard players add @s EF_kJ 14
execute if score Temp SF_Data matches 13 run scoreboard players add @s EF_kJ 16
execute if score Temp SF_Data matches 14 run scoreboard players add @s EF_kJ 18
execute if score Temp SF_Data matches 15.. run scoreboard players add @s EF_kJ 20

execute if score @s EF_kJ matches 800.. run scoreboard players set @s EF_kJ 800
