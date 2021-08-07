execute at @e[type=ender_dragon,tag=ultimeDead] run particle dust 0 0 0 2 ~ ~ ~ 10 10 10 0 50
execute as @e[type=ender_dragon,tag=ultime,tag=!ultimeDragon] store result score @s SF_X run data get entity @s Health 1
execute at @e[type=ender_dragon,tag=ultime,tag=!ultimeDragon,tag=!ultimeDead,scores={x=..5},limit=1] run function stardust:boss/slavekill
scoreboard players reset * x
execute as @e[type=ender_dragon,tag=ultime,tag=!ultimeDragon] run data modify entity @s DragonPhase set value 0
execute as @a[gamemode=!creative,gamemode=!spectator,nbt={Dimension:"stardust:ultimate"}] at @e[tag=ultime,scores={SF_Data=30..}] run function stardust:boss/fireball
scoreboard players add Dragon SF_Data 1
execute as @e[type=minecraft:arrow,tag=Thrown] at @s run particle witch ~ ~ ~ 0.25 0.25 0.25 0 1 force
