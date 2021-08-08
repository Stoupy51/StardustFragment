execute at @e[type=minecraft:arrow,tag=SF_Thrown] run particle minecraft:witch ~ ~ ~ 0.25 0.25 0.25 0 1 force
execute at @e[type=minecraft:ender_dragon,tag=SF_DragonDead] run particle minecraft:dust 0 0 0 2 ~ ~ ~ 10 10 10 0 50 force
execute as @e[type=minecraft:ender_dragon,tag=SF_Dragon,tag=!SF_UltimateBoss] run data modify entity @s DragonPhase set value 0
execute as @a[gamemode=!creative,gamemode=!spectator,nbt={Dimension:"stardust:ultimate"}] at @e[type=minecraft:ender_dragon,tag=SF_Dragon,scores={SF_Data=30..}] run function stardust:boss/ultimate_boss/fireball