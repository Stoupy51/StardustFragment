execute store result score Health SF_Data run data get entity @s Health 1
execute if score Health SF_Data matches ..5 run tag @s add SF_DragonDead
execute if score Health SF_Data matches ..5 as @e[type=ender_dragon,tag=SF_UltimateBoss,limit=1] run function stardust:boss/ultimate_boss/killed_slave
