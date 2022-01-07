#Projectiles
	scoreboard players add @e[type=#stardust:projectiles,tag=StardustFragment_Thrown,scores={StardustFragment_Data=1..}] StardustFragment_Data 1
	kill @e[type=#stardust:projectiles,tag=StardustFragment_Thrown,scores={StardustFragment_Data=7..}]
	execute at @e[type=ender_dragon,tag=StardustFragment_Dragon] run scoreboard players add @e[type=ender_dragon,tag=StardustFragment_Dragon,limit=1,sort=random] StardustFragment_Data 1
	scoreboard players add @e[type=ender_dragon,tag=StardustFragment_DragonDead,limit=1,sort=random] StardustFragment_Data 2
	execute as @a[gamemode=!creative,gamemode=!spectator,nbt={Dimension:"stardust:ultimate"}] at @e[type=ender_dragon,tag=StardustFragment_Dragon] run function stardust:boss/ultimate_boss/arrow
#Orbs
	execute if entity @e[type=ender_dragon,tag=StardustFragment_Dragon,scores={StardustFragment_Data=14..16},limit=1] unless entity @e[type=armor_stand,tag=StardustFragment_UltimateOrb,limit=1] run function stardust:boss/ultimate_boss/orb

scoreboard players remove @e[type=ender_dragon,tag=StardustFragment_Dragon,scores={StardustFragment_Data=31..}] StardustFragment_Data 30
execute as @e[type=arrow,tag=StardustFragment_AlwaysAiming] at @s run function stardust:boss/aim
execute as @e[type=fireball,tag=StardustFragment_AlwaysAiming] at @s run function stardust:boss/aim
execute as @e[type=ender_dragon,tag=StardustFragment_Dragon,tag=!StardustFragment_UltimateBoss,tag=!StardustFragment_DragonDead] at @s run function stardust:boss/ultimate_boss/check_health
execute if entity @a[nbt={Dimension:"stardust:ultimate"},limit=1] unless entity @e[type=ender_dragon,tag=StardustFragment_UltimateBoss,limit=1] run scoreboard players add UltimateBossKilled StardustFragment_Data 1
execute if score UltimateBossKilled StardustFragment_Data matches 10.. in stardust:ultimate run forceload add -73 -69 71 75
execute if score UltimateBossKilled StardustFragment_Data matches 11.. run function stardust:boss/ultimate_boss/defeated
execute in stardust:ultimate run tp @e[x=0,z=0,distance=150..] 0 100 0
