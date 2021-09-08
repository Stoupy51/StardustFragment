scoreboard players remove @s SF_Qx 1
execute if score @s SF_Qx < @s SF_Qx2 run function stardust:quarry/working/move/x2_2
execute if score @s SF_Qx = @s SF_Qx2 run function stardust:quarry/working/move/y_skip
