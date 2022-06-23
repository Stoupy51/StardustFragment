
scoreboard players operation Qx stardust.data = @s stardust.quarry_x
scoreboard players operation Qy stardust.data = @s stardust.quarry_y
scoreboard players operation Qz stardust.data = @s stardust.quarry_z
summon area_effect_cloud ~ ~ ~ {Tags:["stardust.quarry_temp"]}
execute as @e[type=area_effect_cloud,tag=stardust.quarry_temp,distance=..1,limit=1] run function stardust:quarry/working/shulkers
function stardust:quarry/working/move
