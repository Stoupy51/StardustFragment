tag @s remove StardustFragment_HeatWorking
execute if block ~1 ~ ~ minecraft:lava run tag @s add StardustFragment_HeatWorking
execute if block ~-1 ~ ~ minecraft:lava run tag @s add StardustFragment_HeatWorking
execute if block ~ ~ ~1 minecraft:lava run tag @s add StardustFragment_HeatWorking
execute if block ~ ~ ~-1 minecraft:lava run tag @s add StardustFragment_HeatWorking
execute if block ~ ~1 ~ minecraft:lava run tag @s add StardustFragment_HeatWorking
execute if block ~ ~-1 ~ minecraft:lava run tag @s add StardustFragment_HeatWorking
scoreboard players add @s[tag=StardustFragment_HeatWorking] energy.storage 8
execute if score @s energy.storage >= @s energy.max_storage run scoreboard players operation @s energy.storage = @s energy.max_storage
data modify entity @s[tag=StardustFragment_HeatWorking] Item.tag.CustomModelData set value 2013240
