
execute if score @s stardust.quarry_y1 = @s stardust.quarry_y2 if score @s stardust.quarry_z1 < @s stardust.quarry_z2 run scoreboard players add @s stardust.quarry_z 1
execute if score @s stardust.quarry_y1 = @s stardust.quarry_y2 if score @s stardust.quarry_z1 > @s stardust.quarry_z2 run scoreboard players remove @s stardust.quarry_z 1
