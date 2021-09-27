scoreboard players set 99 SF_Data 99
execute as @e[type=ender_dragon,tag=SF_Dragon] store result score @s SF_X run data get entity @s Health 1
scoreboard players operation @e[type=ender_dragon,tag=SF_Dragon] SF_X *= 99 SF_Data
execute as @e[type=ender_dragon,tag=SF_Dragon] store result entity @s Health float 0.01 run scoreboard players get @s SF_X
kill @s
