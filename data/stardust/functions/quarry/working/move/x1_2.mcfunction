
execute if score @s stardust.quarry_y1 < @s stardust.quarry_y2 run scoreboard players add @s stardust.quarry_y 1
execute if score @s stardust.quarry_y1 > @s stardust.quarry_y2 run scoreboard players remove @s stardust.quarry_y 1
scoreboard players operation @s stardust.quarry_x = @s stardust.quarry_x1
