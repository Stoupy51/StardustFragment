
execute store result score @s stardust.quarry_x1 run data get entity @s Pos[0]
execute store result score @s stardust.quarry_y1 run data get entity @s Pos[1]
execute store result score @s stardust.quarry_z1 run data get entity @s Pos[2]
execute store result score @s stardust.quarry_x2 run data get entity @s Pos[0]
execute store result score @s stardust.quarry_y2 run data get entity @s Pos[1]
execute store result score @s stardust.quarry_z2 run data get entity @s Pos[2]

scoreboard players add @s stardust.quarry_y1 3
scoreboard players add @s stardust.quarry_y2 6
