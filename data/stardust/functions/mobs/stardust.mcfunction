scoreboard players set 2 stardust.data 2
execute store result score Rand stardust.data run data get entity @s UUID[1] 1
scoreboard players operation Rand stardust.data %= 2 stardust.data

execute if score Rand stardust.data matches ..0 run function stardust:mobs/stray
execute if score Rand stardust.data matches 1 run function stardust:mobs/evoker
scoreboard players set Rand stardust.data 0
tp @s 0 -10000 0
