scoreboard players operation Qx StardustFragment_Data = @s StardustFragment_Qx
scoreboard players operation Qy StardustFragment_Data = @s StardustFragment_Qy
scoreboard players operation Qz StardustFragment_Data = @s StardustFragment_Qz
summon area_effect_cloud ~ ~ ~ {Tags:["StardustFragment_QuarryTemp"]}
execute as @e[type=area_effect_cloud,limit=1,tag=StardustFragment_QuarryTemp,distance=..1] at @s run function stardust:quarry/working/shulkers

scoreboard players remove Count StardustFragment_Data 1
execute at @e[type=shulker,tag=StardustFragment_QuarryMiner,tag=!StardustFragment_QuarryMinerDone] run function stardust:quarry/working/mine
tag @e[type=shulker,tag=!StardustFragment_QuarryMinerDone] add StardustFragment_QuarryMinerDone
function stardust:quarry/working/move
