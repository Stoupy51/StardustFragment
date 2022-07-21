
scoreboard players operation Qx stardust.data = @s stardust.quarry_x
scoreboard players operation Qy stardust.data = @s stardust.quarry_y
scoreboard players operation Qz stardust.data = @s stardust.quarry_z
summon marker ~ ~ ~ {Tags:["stardust.quarry_temp"],UUID:[I;2013000,2013000,2013000,2013000]}
execute as 001eb748-001e-b748-001e-b748001eb748 run function stardust:quarry/working/shulkers
function stardust:quarry/working/move
