scoreboard players set 3 SF_Data 3
execute store result score Random SF_Data run data get entity @s UUID[1] 1
scoreboard players operation Random SF_Data %= 3 SF_Data
scoreboard players reset 3 SF_Data
kill @s
