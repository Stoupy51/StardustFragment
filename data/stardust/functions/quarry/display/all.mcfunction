scoreboard players operation Qx1 SF_Data = @s SF_Qx1
scoreboard players operation Qy1 SF_Data = @s SF_Qy1
scoreboard players operation Qz1 SF_Data = @s SF_Qz1
scoreboard players operation Qx2 SF_Data = @s SF_Qx2
scoreboard players operation Qy2 SF_Data = @s SF_Qy2
scoreboard players operation Qz2 SF_Data = @s SF_Qz2
summon area_effect_cloud ~ ~ ~ {Tags:["SF_QuarryTemp"]}
execute as @e[type=area_effect_cloud,limit=1,tag=SF_QuarryTemp,distance=..1] at @s run function stardust:quarry/display/shulkers
