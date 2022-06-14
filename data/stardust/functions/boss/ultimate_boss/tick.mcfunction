
execute at @e[type=arrow,tag=stardust.thrown] run particle witch ~ ~ ~ 0.25 0.25 0.25 0 1 force
execute at @e[tag=stardust.dragon_dead] run particle dust 0 0 0 2 ~ ~ ~ 10 10 10 0 50 force
execute as @e[tag=stardust.dragon,tag=!stardust.ultimate_boss] run data modify entity @s DragonPhase set value 0
execute as @a[gamemode=!creative,gamemode=!spectator,nbt={Dimension:"stardust:ultimate"}] at @e[tag=stardust.dragon,scores={stardust.data=30..}] run function stardust:boss/ultimate_boss/fireball
execute as @e[tag=stardust.ultimate_orb] at @s unless entity @e[type=shulker,distance=..2.75] run function stardust:boss/ultimate_boss/orb_destroyed
