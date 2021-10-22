execute store result score Count SF_Data if entity @e[tag=SF_StardustDim,distance=..40]
execute if entity @s[tag=SF_Angry] run scoreboard players operation Count SF_Data *= 4 SE_Data
execute store result score MaxCount SF_Data if entity @a[distance=..200]
scoreboard players operation MaxCount SF_Data *= 80 SE_Data
execute if score Count SF_Data <= MaxCount SF_Data as @a[distance=..200] run function stardust:boss/stardust_pillar/stardust_mob
execute if score Count SF_Data <= MaxCount SF_Data run function stardust:boss/stardust_pillar/remove_health
execute if score @s[tag=SF_ShieldOn] SF_Pillar matches ..1 run function stardust:boss/stardust_pillar/remove_shield
