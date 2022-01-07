execute store result score Health StardustFragment_Data run data get entity @s Health 1
scoreboard players operation Health StardustFragment_Data -= BulletDamage StardustFragment_Data
execute if score Health StardustFragment_Data matches ..0 run kill @s[type=!minecraft:ender_dragon]
execute store result entity @s Health float 1 run scoreboard players get Health StardustFragment_Data
