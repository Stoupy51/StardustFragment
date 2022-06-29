
execute at @e[type=arrow,tag=stardust.thrown] run particle witch ~ ~ ~ 0.25 0.25 0.25 0 1 force
execute at @e[tag=stardust.dragon_dead] run particle dust 0 0 0 2 ~ ~ ~ 10 10 10 0 50 force
execute as @e[tag=stardust.dragon_dead] run data modify entity @s Health set value 512.0f
execute as @e[tag=stardust.dragon,tag=!stardust.ultimate_boss] run data modify entity @s DragonPhase set value 0
execute as @e[tag=stardust.dragon] at @s if entity @s[y=200,dy=800] run data modify entity @s Motion[1] set value -1.00d
execute at @e[tag=stardust.dragon,scores={stardust.data=30..}] as @a[gamemode=!creative,gamemode=!spectator,distance=..200] run function stardust:boss/ultimate_boss/fireball
execute as @e[tag=stardust.ultimate_orb] at @s unless entity @e[type=shulker,distance=..2.75] run function stardust:boss/ultimate_boss/orb_destroyed
