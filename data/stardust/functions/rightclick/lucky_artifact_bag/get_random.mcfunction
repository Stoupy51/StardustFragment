scoreboard players set 3 StardustFragment_Data 3
execute store result score Random StardustFragment_Data run data get entity @s UUID[1] 1
scoreboard players operation Random StardustFragment_Data %= 3 StardustFragment_Data
scoreboard players reset 3 StardustFragment_Data
kill @s
