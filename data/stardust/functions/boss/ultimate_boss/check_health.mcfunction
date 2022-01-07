execute store result score Health StardustFragment_Data run data get entity @s Health 1
execute if score Health StardustFragment_Data matches ..5 run tag @s add StardustFragment_DragonDead
execute if score Health StardustFragment_Data matches ..5 as @e[type=ender_dragon,tag=StardustFragment_UltimateBoss,limit=1] run function stardust:boss/ultimate_boss/killed_slave
