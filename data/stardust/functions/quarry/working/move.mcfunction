#Moving X
	execute if score @s StardustFragment_Qx1 < @s StardustFragment_Qx2 run function stardust:quarry/working/move/x1_1
	execute if score @s StardustFragment_Qx1 > @s StardustFragment_Qx2 run function stardust:quarry/working/move/x2_1

#Moving Y
	execute if score @s StardustFragment_Qy1 < @s StardustFragment_Qy2 if score @s StardustFragment_Qy > @s StardustFragment_Qy2 run function stardust:quarry/working/move/y1
	execute if score @s StardustFragment_Qy1 > @s StardustFragment_Qy2 if score @s StardustFragment_Qy < @s StardustFragment_Qy2 run function stardust:quarry/working/move/y2

#Moving Z
	execute if score @s StardustFragment_Qz1 < @s StardustFragment_Qz2 if score @s StardustFragment_Qz > @s StardustFragment_Qz2 run scoreboard players set @s StardustFragment_StatQ 0
	execute if score @s StardustFragment_Qz1 > @s StardustFragment_Qz2 if score @s StardustFragment_Qz < @s StardustFragment_Qz2 run scoreboard players set @s StardustFragment_StatQ 0
