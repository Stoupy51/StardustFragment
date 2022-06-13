
scoreboard players operation Qx stardust.data = @s stardust.quarry_x
scoreboard players operation Qy stardust.data = @s stardust.quarry_y
scoreboard players operation Qz stardust.data = @s stardust.quarry_z
summon area_effect_cloud ~ ~ ~ {Tags:["stardust.quarry_temp"]}
execute as @e[type=area_effect_cloud,limit=1,tag=stardust.quarry_temp,distance=..1] at @s run function stardust:quarry/working/shulkers

scoreboard players remove #quarry_count stardust.data 1
execute at @e[type=shulker,tag=stardust.quarryMiner,tag=!stardust.quarryMinerDone] align xyz run function stardust:quarry/working/mine
tag @e[type=shulker,tag=stardust.quarryMiner] add stardust.quarryMinerDone
function stardust:quarry/working/move
