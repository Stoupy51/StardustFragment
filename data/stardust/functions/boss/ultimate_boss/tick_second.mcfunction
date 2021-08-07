scoreboard players add @e[tag=SF_Thrown,scores={SF_Data=1..}] SF_Data 1
kill @e[tag=SF_Thrown,scores={SF_Data=7..}]
execute at @e[type=minecraft:ender_dragon,tag=SF_Dragon] run scoreboard players add @e[tag=SF_Dragon,limit=1,sort=random] SF_Data 1
scoreboard players add @e[type=minecraft:ender_dragon,tag=SF_DragonDead,limit=1,sort=random] SF_Data 2
execute as @a[gamemode=!creative,gamemode=!spectator,nbt={Dimension:"stardust:ultimate"}] at @e[tag=SF_Dragon] run function stardust:boss/ultimate_boss/arrow
scoreboard players remove @e[type=minecraft:ender_dragon,tag=SF_Dragon,scores={SF_Data=31..}] SF_Data 30
execute in stardust:ultimate run tp @e[x=0,z=0,distance=150..] 0 100 0
execute as @e[type=minecraft:arrow,tag=SF_AlwaysAiming] at @s run function stardust:boss/aim
execute as @e[type=minecraft:fireball,tag=SF_AlwaysAiming] at @s run function stardust:boss/aim
