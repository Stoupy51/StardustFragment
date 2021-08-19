scoreboard players set 4 SF_Data 4
scoreboard players set Count SF_Data 0
scoreboard players set MaxCount SF_Data 0
execute as @e[tag=SF_StardustDim,distance=..40] run scoreboard players add Count SF_Data 4
execute unless entity @s[tag=SF_Angry] run scoreboard players operation Count SF_Data /= 4 SF_Data
execute as @a[distance=..200] run scoreboard players add MaxCount SF_Data 80
execute if score Count SF_Data <= MaxCount SF_Data as @a[distance=..200] run function stardust:boss/stardust_pillar/stardust_mob
execute if score @s[tag=SF_ShieldOn] SF_Pillar matches ..1 run function stardust:boss/stardust_pillar/remove_shield
