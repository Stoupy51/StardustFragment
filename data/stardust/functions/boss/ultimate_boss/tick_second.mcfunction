#Projectiles
    scoreboard players add @e[type=#stardust:projectiles,tag=SF_Thrown,scores={SF_Data=1..}] SF_Data 1
    kill @e[type=#stardust:projectiles,tag=SF_Thrown,scores={SF_Data=7..}]
    execute at @e[type=ender_dragon,tag=SF_Dragon] run scoreboard players add @e[type=ender_dragon,tag=SF_Dragon,limit=1,sort=random] SF_Data 1
    scoreboard players add @e[type=ender_dragon,tag=SF_DragonDead,limit=1,sort=random] SF_Data 2
    execute as @a[gamemode=!creative,gamemode=!spectator,nbt={Dimension:"stardust:ultimate"}] at @e[type=ender_dragon,tag=SF_Dragon] run function stardust:boss/ultimate_boss/arrow
#Orbs
    execute if entity @e[type=ender_dragon,tag=SF_Dragon,scores={SF_Data=14..16},limit=1] unless entity @e[type=armor_stand,tag=SF_UltimateOrb,limit=1] run function stardust:boss/ultimate_boss/orb
    execute as @e[type=armor_stand,tag=SF_UltimateOrb] at @s unless entity @e[type=wither,distance=..2.75] run function stardust:boss/ultimate_boss/orb_destroyed

scoreboard players remove @e[type=ender_dragon,tag=SF_Dragon,scores={SF_Data=31..}] SF_Data 30
execute as @e[type=arrow,tag=SF_AlwaysAiming] at @s run function stardust:boss/aim
execute as @e[type=fireball,tag=SF_AlwaysAiming] at @s run function stardust:boss/aim
execute as @e[type=ender_dragon,tag=SF_Dragon,tag=!SF_UltimateBoss,tag=!SF_DragonDead] at @s run function stardust:boss/ultimate_boss/check_health
execute if entity @a[nbt={Dimension:"stardust:ultimate"},limit=1] unless entity @e[type=ender_dragon,tag=SF_UltimateBoss,limit=1] run scoreboard players add UltimateBossKilled SF_Data 1
execute if score UltimateBossKilled SF_Data matches 11.. run function stardust:boss/ultimate_boss/defeated
execute in stardust:ultimate run tp @e[x=0,z=0,distance=150..] 0 100 0
