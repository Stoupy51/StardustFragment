scoreboard players set @s SF_SizeQ 0
#Length, Width, Depth
	scoreboard players operation rX SF_Data = @s SF_Qx1
	scoreboard players operation rX SF_Data -= @s SF_Qx2
	scoreboard players operation rY SF_Data = @s SF_Qy1
	scoreboard players operation rY SF_Data -= @s SF_Qy2
	scoreboard players operation rZ SF_Data = @s SF_Qz1
	scoreboard players operation rZ SF_Data -= @s SF_Qz2
	execute if score rX SF_Data matches 0 run scoreboard players set rX SF_Data 1
	execute if score rY SF_Data matches 0 run scoreboard players set rY SF_Data 1
	execute if score rZ SF_Data matches 0 run scoreboard players set rZ SF_Data 1

#Calculating Size
	scoreboard players operation @s SF_SizeQ = rX SF_Data
	scoreboard players operation @s SF_SizeQ *= rY SF_Data
	scoreboard players operation @s SF_SizeQ *= rZ SF_Data
	scoreboard players set -1 SF_Data -1
	execute if score @s SF_SizeQ matches ..0 run scoreboard players operation @s SF_SizeQ *= -1 SF_Data
