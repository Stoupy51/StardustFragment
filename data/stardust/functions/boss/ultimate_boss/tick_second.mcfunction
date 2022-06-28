
#Projectiles
execute as @a[gamemode=!creative,gamemode=!spectator,nbt={Dimension:"stardust:ultimate"}] at @e[tag=stardust.dragon] run function stardust:boss/ultimate_boss/arrow
scoreboard players add @e[type=#stardust:projectiles,tag=stardust.thrown,scores={stardust.data=1..}] stardust.data 1
kill @e[type=#stardust:projectiles,tag=stardust.thrown,scores={stardust.data=7..}]
execute as @e[type=arrow,tag=stardust.always_aiming] at @s run function stardust:boss/aim
execute as @e[type=fireball,tag=stardust.always_aiming] at @s run function stardust:boss/aim

#Update states
execute at @e[tag=stardust.dragon] run scoreboard players add @e[tag=stardust.dragon,limit=1,sort=random] stardust.data 1
scoreboard players remove @e[tag=stardust.dragon,scores={stardust.data=31..}] stardust.data 30
scoreboard players add @e[tag=stardust.dragon_dead,limit=1,sort=random] stardust.data 2

#Orbs
execute if entity @e[tag=stardust.dragon,scores={stardust.data=14..16},limit=1] unless entity @e[tag=stardust.ultimate_orb,limit=1] run function stardust:boss/ultimate_boss/orb

#Defeat check
scoreboard players set #success stardust.data 0
execute store success score #success stardust.data if entity @a[predicate=stardust:in_dim/ultimate]
execute if score #success stardust.data matches 1 store success score #success stardust.data unless entity @e[tag=stardust.ultimate_boss,limit=1]
execute if score #success stardust.data matches 1 run scoreboard players add #ultimate_boss_killed stardust.data 1
execute if score #success stardust.data matches 0 run scoreboard players set #ultimate_boss_killed stardust.data 0
execute if score #ultimate_boss_killed stardust.data matches 10.. in stardust:ultimate run forceload add -73 -69 71 75
execute if score #ultimate_boss_killed stardust.data matches 11.. run function stardust:boss/ultimate_boss/defeated

#Others
execute as @e[tag=stardust.dragon,tag=!stardust.ultimate_boss,tag=!stardust.dragon_dead] at @s run function stardust:boss/ultimate_boss/check_health
execute as @e[tag=stardust.ultimate_boss,sort=random] store result bossbar stardust:ultimate_boss value run data get entity @s Health
execute in stardust:ultimate positioned 0 100 0 run tp @e[distance=256..] 0 100 0
execute in stardust:ultimate positioned 0 100 0 run bossbar set stardust:ultimate_boss players @a[distance=..500]
