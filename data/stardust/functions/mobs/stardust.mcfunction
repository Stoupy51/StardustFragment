scoreboard players set 2 SF_Data 2
execute store result score Rand SF_Data run data get entity @s UUID[1] 1
scoreboard players operation Rand SF_Data %= 2 SF_Data

execute if score Rand SF_Data matches ..0 run function stardust:mobs/stray
execute if score Rand SF_Data matches 1 run function stardust:mobs/evoker
execute if score Mob SF_Data matches 1 run tp @s 0 -10000 0
scoreboard players set Mob SF_Data 0
scoreboard players set Rand SF_Data 0
