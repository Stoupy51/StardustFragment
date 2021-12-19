tag @s remove SF_HeatWorking
execute if block ~1 ~ ~ minecraft:lava run tag @s add SF_HeatWorking
execute if block ~-1 ~ ~ minecraft:lava run tag @s add SF_HeatWorking
execute if block ~ ~ ~1 minecraft:lava run tag @s add SF_HeatWorking
execute if block ~ ~ ~-1 minecraft:lava run tag @s add SF_HeatWorking
execute if block ~ ~1 ~ minecraft:lava run tag @s add SF_HeatWorking
execute if block ~ ~-1 ~ minecraft:lava run tag @s add SF_HeatWorking
scoreboard players add @s[tag=SF_HeatWorking] energy.storage 8
execute if score @s energy.storage >= @s energy.max_storage run scoreboard players operation @s energy.storage = @s energy.max_storage
data modify entity @s[tag=SF_HeatWorking] Item.tag.CustomModelData set value 2013240
