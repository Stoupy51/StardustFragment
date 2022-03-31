scoreboard players operation Qx stardust.data = @s stardust.quarry_x
scoreboard players operation Qy stardust.data = @s stardust.quarry_y
scoreboard players operation Qz stardust.data = @s stardust.quarry_z
summon area_effect_cloud ~ ~ ~ {Tags:["stardust.quarrytemp"]}
execute as @e[type=area_effect_cloud,limit=1,tag=stardust.quarrytemp,distance=..1] at @s run function stardust:quarry/working/shulkers

scoreboard players remove Count stardust.data 1
execute at @e[type=shulker,tag=stardust.quarryMiner,tag=!stardust.quarryMinerDone] run function stardust:quarry/working/mine
tag @e[type=shulker,tag=!stardust.quarryMinerDone] add stardust.quarryMinerDone
function stardust:quarry/working/move
