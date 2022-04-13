
#Moving X
	execute if score @s stardust.quarry_x1 < @s stardust.quarry_x2 run function stardust:quarry/working/move/x1_1
	execute if score @s stardust.quarry_x1 > @s stardust.quarry_x2 run function stardust:quarry/working/move/x2_1

#Moving Y
	execute if score @s stardust.quarry_y1 < @s stardust.quarry_y2 if score @s stardust.quarry_y > @s stardust.quarry_y2 run function stardust:quarry/working/move/y1
	execute if score @s stardust.quarry_y1 > @s stardust.quarry_y2 if score @s stardust.quarry_y < @s stardust.quarry_y2 run function stardust:quarry/working/move/y2

#Moving Z
	execute if score @s stardust.quarry_z1 < @s stardust.quarry_z2 if score @s stardust.quarry_z > @s stardust.quarry_z2 run scoreboard players set @s stardust.quarry_status 0
	execute if score @s stardust.quarry_z1 > @s stardust.quarry_z2 if score @s stardust.quarry_z < @s stardust.quarry_z2 run scoreboard players set @s stardust.quarry_status 0
