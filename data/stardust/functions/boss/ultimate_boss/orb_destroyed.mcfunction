scoreboard players set 99 StardustFragment_Data 99
execute as @e[type=ender_dragon,tag=StardustFragment_Dragon] store result score @s StardustFragment_X run data get entity @s Health 1
scoreboard players operation @e[type=ender_dragon,tag=StardustFragment_Dragon] StardustFragment_X *= 99 StardustFragment_Data
execute as @e[type=ender_dragon,tag=StardustFragment_Dragon] store result entity @s Health float 0.01 run scoreboard players get @s StardustFragment_X
kill @s
