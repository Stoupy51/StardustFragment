scoreboard players operation Absorption SF_Data -= @e[type=minecraft:area_effect_cloud,tag=Bullet,limit=1] SF_Data
execute store result entity @s AbsorptionAmount float 1 run scoreboard players get Absorption SF_Data

execute store result score Health SF_Data run data get entity @s Health 1
execute if score Absorption SF_Data matches ..0 run scoreboard players operation Health SF_Data += Absorption SF_Data
execute store result entity @s Health float 1 run scoreboard players get Health SF_Data
