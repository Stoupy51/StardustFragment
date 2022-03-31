scoreboard players set 99 stardust.data 99
execute as @e[type=ender_dragon,tag=stardust.dragon] store result score @s stardust.data_2 run data get entity @s Health 1
scoreboard players operation @e[type=ender_dragon,tag=stardust.dragon] stardust.data_2 *= 99 stardust.data
execute as @e[type=ender_dragon,tag=stardust.dragon] store result entity @s Health float 0.01 run scoreboard players get @s stardust.data_2
kill @s
