execute store result score Count StardustFragment_Data if entity @e[tag=StardustFragment_StardustDim,distance=..40]
execute if entity @s[tag=StardustFragment_Angry] run scoreboard players operation Count StardustFragment_Data *= 4 SimplEnergy_Data
execute store result score MaxCount StardustFragment_Data if entity @a[distance=..200]
scoreboard players operation MaxCount StardustFragment_Data *= 80 SimplEnergy_Data
execute if score Count StardustFragment_Data <= MaxCount StardustFragment_Data as @a[distance=..200] run function stardust:boss/stardust_pillar/stardust_mob
execute if score Count StardustFragment_Data <= MaxCount StardustFragment_Data run function stardust:boss/stardust_pillar/remove_health
execute if score @s[tag=StardustFragment_ShieldOn] StardustFragment_Pillar matches ..1 run function stardust:boss/stardust_pillar/remove_shield
