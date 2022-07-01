
execute at @e[type=arrow,tag=stardust.thrown] run particle witch ~ ~ ~ 0.25 0.25 0.25 0 1 force
execute at @e[tag=stardust.dragon_dead] run particle dust 0 0 0 2 ~ ~ ~ 10 10 10 0 50 force
execute as @e[tag=stardust.dragon_dead] run data modify entity @s Health set value 512.0f
execute as @e[tag=stardust.dragon,tag=!stardust.ultimate_boss] run data modify entity @s DragonPhase set value 0
execute as @e[tag=stardust.dragon] at @s if entity @s[y=150,dy=800] run data modify entity @s Motion[1] set value -1.00d
execute at @e[tag=stardust.dragon,scores={stardust.data=30..}] as @a[gamemode=!creative,gamemode=!spectator,distance=..200] run function stardust:boss/ultimate_boss/fireball
execute as @e[type=armor_stand,tag=stardust.ultimate_orb] at @s positioned ~ ~-2 ~ unless entity @e[type=!armor_stand,tag=stardust.ultimate_orb,distance=..1] run function stardust:boss/ultimate_boss/orb/check_destroy
