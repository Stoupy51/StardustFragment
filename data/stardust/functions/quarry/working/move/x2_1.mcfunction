
scoreboard players remove @s stardust.quarry_x 1
execute if score @s stardust.quarry_x < @s stardust.quarry_x2 run function stardust:quarry/working/move/x2_2
execute if score @s stardust.quarry_x = @s stardust.quarry_x2 run function stardust:quarry/working/move/y_skip
