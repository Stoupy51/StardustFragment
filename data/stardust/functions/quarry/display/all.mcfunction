scoreboard players operation Qx1 stardust.data = @s stardust.quarry_x1
scoreboard players operation Qy1 stardust.data = @s stardust.quarry_y1
scoreboard players operation Qz1 stardust.data = @s stardust.quarry_z1
scoreboard players operation Qx2 stardust.data = @s stardust.quarry_x2
scoreboard players operation Qy2 stardust.data = @s stardust.quarry_y2
scoreboard players operation Qz2 stardust.data = @s stardust.quarry_z2
summon area_effect_cloud ~ ~ ~ {Tags:["stardust.quarry_temp"]}
execute as @e[limit=1,tag=stardust.quarry_temp,distance=..1] at @s run function stardust:quarry/display/shulkers
