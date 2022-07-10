
tag @s add stardust.teleported
scoreboard players reset @s stardust.data
scoreboard players set @s stardust.data_2 0
execute store result score @s stardust.data_2 run data get entity @s Pos[0] 100
execute store result score #y stardust.data run data get entity @s Pos[1] 1
execute store result score #z stardust.data run data get entity @s Pos[2] 100
scoreboard players operation @s stardust.data_2 += #y stardust.data
scoreboard players operation @s stardust.data_2 += #z stardust.data
