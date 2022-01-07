scoreboard players set @s StardustFragment_SizeQ 0
#Length, Width, Depth
	scoreboard players operation rX StardustFragment_Data = @s StardustFragment_Qx1
	scoreboard players operation rX StardustFragment_Data -= @s StardustFragment_Qx2
	scoreboard players operation rY StardustFragment_Data = @s StardustFragment_Qy1
	scoreboard players operation rY StardustFragment_Data -= @s StardustFragment_Qy2
	scoreboard players operation rZ StardustFragment_Data = @s StardustFragment_Qz1
	scoreboard players operation rZ StardustFragment_Data -= @s StardustFragment_Qz2
	execute if score rX StardustFragment_Data matches 0 run scoreboard players set rX StardustFragment_Data 1
	execute if score rY StardustFragment_Data matches 0 run scoreboard players set rY StardustFragment_Data 1
	execute if score rZ StardustFragment_Data matches 0 run scoreboard players set rZ StardustFragment_Data 1

#Calculating Size
	scoreboard players operation @s StardustFragment_SizeQ = rX StardustFragment_Data
	scoreboard players operation @s StardustFragment_SizeQ *= rY StardustFragment_Data
	scoreboard players operation @s StardustFragment_SizeQ *= rZ StardustFragment_Data
	scoreboard players set -1 StardustFragment_Data -1
	execute if score @s StardustFragment_SizeQ matches ..0 run scoreboard players operation @s StardustFragment_SizeQ *= -1 StardustFragment_Data
