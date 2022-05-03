
execute store result score Qx2 stardust.data_2 run data get entity @s Pos[0] 1
execute store result score Qy2 stardust.data_2 run data get entity @s Pos[1] 1
execute store result score Qz2 stardust.data_2 run data get entity @s Pos[2] 1
particle firework ~ ~0.5 ~ 0.25 0.25 0.25 0.01 100
kill @s
