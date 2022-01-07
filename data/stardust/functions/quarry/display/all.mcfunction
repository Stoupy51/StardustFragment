scoreboard players operation Qx1 StardustFragment_Data = @s StardustFragment_Qx1
scoreboard players operation Qy1 StardustFragment_Data = @s StardustFragment_Qy1
scoreboard players operation Qz1 StardustFragment_Data = @s StardustFragment_Qz1
scoreboard players operation Qx2 StardustFragment_Data = @s StardustFragment_Qx2
scoreboard players operation Qy2 StardustFragment_Data = @s StardustFragment_Qy2
scoreboard players operation Qz2 StardustFragment_Data = @s StardustFragment_Qz2
summon area_effect_cloud ~ ~ ~ {Tags:["StardustFragment_QuarryTemp"]}
execute as @e[type=area_effect_cloud,limit=1,tag=StardustFragment_QuarryTemp,distance=..1] at @s run function stardust:quarry/display/shulkers
