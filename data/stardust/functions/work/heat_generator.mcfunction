tag @s remove SF_HeatWorking
execute if block ~1 ~ ~ minecraft:lava run tag @s add SF_HeatWorking
execute if block ~-1 ~ ~ minecraft:lava run tag @s add SF_HeatWorking
execute if block ~ ~ ~1 minecraft:lava run tag @s add SF_HeatWorking
execute if block ~ ~ ~-1 minecraft:lava run tag @s add SF_HeatWorking
execute if block ~ ~1 ~ minecraft:lava run tag @s add SF_HeatWorking
execute if block ~ ~-1 ~ minecraft:lava run tag @s add SF_HeatWorking
scoreboard players add @s[tag=SF_HeatWorking] EF_kJ 8
execute if score @s EF_kJ matches 800.. run scoreboard players set @s EF_kJ 800
data modify entity @s[tag=SF_HeatWorking] Item.tag.CustomModelData set value 2013240
