scoreboard players operation Absorption StardustFragment_Data -= BulletDamage StardustFragment_Data
execute store result entity @s AbsorptionAmount float 1 run scoreboard players get Absorption StardustFragment_Data

execute store result score Health StardustFragment_Data run data get entity @s Health 1
execute if score Absorption StardustFragment_Data matches ..0 run scoreboard players operation Health StardustFragment_Data += Absorption StardustFragment_Data
execute store result entity @s Health float 1 run scoreboard players get Health StardustFragment_Data
