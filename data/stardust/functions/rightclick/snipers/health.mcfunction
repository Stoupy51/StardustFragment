execute store result score Health SF_Data run data get entity @s Health 1
scoreboard players operation Health SF_Data -= @e[type=minecraft:area_effect_cloud,tag=SF_Bullet,limit=1] SF_Data
execute if score Health SF_Data matches ..0 run kill @s[type=!minecraft:ender_dragon]
execute store result entity @s Health float 1 run scoreboard players get Health SF_Data