
tag @s remove stardust.heat_working
execute if block ~1 ~ ~ lava run tag @s add stardust.heat_working
execute if block ~-1 ~ ~ lava run tag @s add stardust.heat_working
execute if block ~ ~ ~1 lava run tag @s add stardust.heat_working
execute if block ~ ~ ~-1 lava run tag @s add stardust.heat_working
execute if block ~ ~1 ~ lava run tag @s add stardust.heat_working
execute if block ~ ~-1 ~ lava run tag @s add stardust.heat_working
scoreboard players add @s[tag=stardust.heat_working] energy.storage 8
execute if score @s energy.storage >= @s energy.max_storage run scoreboard players operation @s energy.storage = @s energy.max_storage
data modify entity @s[tag=stardust.heat_working] item.tag.CustomModelData set value 2013323
