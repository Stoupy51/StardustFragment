scoreboard players set @s stardust.quarry_size 0
#Length, Width, Depth
	scoreboard players operation rX stardust.data = @s stardust.quarry_x1
	scoreboard players operation rX stardust.data -= @s stardust.quarry_x2
	scoreboard players operation rY stardust.data = @s stardust.quarry_y1
	scoreboard players operation rY stardust.data -= @s stardust.quarry_y2
	scoreboard players operation rZ stardust.data = @s stardust.quarry_z1
	scoreboard players operation rZ stardust.data -= @s stardust.quarry_z2
	execute if score rX stardust.data matches 0 run scoreboard players set rX stardust.data 1
	execute if score rY stardust.data matches 0 run scoreboard players set rY stardust.data 1
	execute if score rZ stardust.data matches 0 run scoreboard players set rZ stardust.data 1

#Calculating Size
	scoreboard players operation @s stardust.quarry_size = rX stardust.data
	scoreboard players operation @s stardust.quarry_size *= rY stardust.data
	scoreboard players operation @s stardust.quarry_size *= rZ stardust.data
	scoreboard players set -1 stardust.data -1
	execute if score @s stardust.quarry_size matches ..0 run scoreboard players operation @s stardust.quarry_size *= -1 stardust.data
