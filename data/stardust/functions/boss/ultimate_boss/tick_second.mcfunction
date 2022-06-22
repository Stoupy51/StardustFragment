#Projectiles
	scoreboard players add @e[type=#stardust:projectiles,tag=stardust.thrown,scores={stardust.data=1..}] stardust.data 1
	kill @e[type=#stardust:projectiles,tag=stardust.thrown,scores={stardust.data=7..}]
	execute at @e[tag=stardust.dragon] run scoreboard players add @e[tag=stardust.dragon,limit=1,sort=random] stardust.data 1
	scoreboard players add @e[tag=stardust.dragon_dead,limit=1,sort=random] stardust.data 2
	execute as @a[gamemode=!creative,gamemode=!spectator,nbt={Dimension:"stardust:ultimate"}] at @e[tag=stardust.dragon] run function stardust:boss/ultimate_boss/arrow
#Orbs
	execute if entity @e[tag=stardust.dragon,scores={stardust.data=14..16},limit=1] unless entity @e[tag=stardust.ultimate_orb,limit=1] run function stardust:boss/ultimate_boss/orb

scoreboard players remove @e[tag=stardust.dragon,scores={stardust.data=31..}] stardust.data 30
execute as @e[type=arrow,tag=stardust.always_aiming] at @s run function stardust:boss/aim
execute as @e[type=fireball,tag=stardust.always_aiming] at @s run function stardust:boss/aim
execute as @e[tag=stardust.dragon,tag=!stardust.ultimate_boss,tag=!stardust.dragon_dead] at @s run function stardust:boss/ultimate_boss/check_health
execute if entity @a[nbt={Dimension:"stardust:ultimate"},limit=1] unless entity @e[tag=stardust.ultimate_boss,limit=1] run scoreboard players add #ultimate_boss_killed stardust.data 1
execute if score #ultimate_boss_killed stardust.data matches 10.. in stardust:ultimate run forceload add -73 -69 71 75
execute if score #ultimate_boss_killed stardust.data matches 11.. run function stardust:boss/ultimate_boss/defeated
execute in stardust:ultimate run tp @e[x=0,z=0,distance=150..] 0 100 0
