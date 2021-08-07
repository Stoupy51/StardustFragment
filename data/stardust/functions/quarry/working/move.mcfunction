#Moving X
    execute if score @s SF_Qx1 < @s SF_Qx2 run function stardust:quarry/working/move/x1_1
    execute if score @s SF_Qx1 > @s SF_Qx2 run function stardust:quarry/working/move/x2_1

#Moving Y
    execute if score @s SF_Qy1 < @s SF_Qy2 if score @s SF_Qy > @s SF_Qy2 run function stardust:quarry/working/move/y1
    execute if score @s SF_Qy1 > @s SF_Qy2 if score @s SF_Qy < @s SF_Qy2 run function stardust:quarry/working/move/y2

#Moving Z
    execute if score @s SF_Qz1 < @s SF_Qz2 if score @s SF_Qz > @s SF_Qz2 run scoreboard players set @s SF_StatQ 0
    execute if score @s SF_Qz1 > @s SF_Qz2 if score @s SF_Qz < @s SF_Qz2 run scoreboard players set @s SF_StatQ 0