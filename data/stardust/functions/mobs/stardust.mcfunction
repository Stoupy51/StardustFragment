scoreboard players set 2 StardustFragment_Data 2
execute store result score Rand StardustFragment_Data run data get entity @s UUID[1] 1
scoreboard players operation Rand StardustFragment_Data %= 2 StardustFragment_Data

execute if score Rand StardustFragment_Data matches ..0 run function stardust:mobs/stray
execute if score Rand StardustFragment_Data matches 1 run function stardust:mobs/evoker
scoreboard players set Rand StardustFragment_Data 0
tp @s 0 -10000 0
