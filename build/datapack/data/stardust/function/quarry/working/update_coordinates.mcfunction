
#> stardust:quarry/working/update_coordinates
#
# @executed	as @e[tag=stardust.second] & at @s
#
# @within	stardust:quarry/working/loop
#

# Move in X direction first
execute if score @s stardust.quarry_x1 < @s stardust.quarry_x2 run scoreboard players add @s stardust.quarry_curr_x 1
execute if score @s stardust.quarry_x1 > @s stardust.quarry_x2 run scoreboard players remove @s stardust.quarry_curr_x 1

# If passed X limit, reset X and move in Z direction
execute if score @s stardust.quarry_x1 < @s stardust.quarry_x2 if score @s stardust.quarry_curr_x > @s stardust.quarry_x2 if score @s stardust.quarry_z1 < @s stardust.quarry_z2 run scoreboard players add @s stardust.quarry_curr_z 1
execute if score @s stardust.quarry_x1 < @s stardust.quarry_x2 if score @s stardust.quarry_curr_x > @s stardust.quarry_x2 if score @s stardust.quarry_z1 > @s stardust.quarry_z2 run scoreboard players remove @s stardust.quarry_curr_z 1
execute if score @s stardust.quarry_x1 < @s stardust.quarry_x2 if score @s stardust.quarry_curr_x > @s stardust.quarry_x2 run scoreboard players operation @s stardust.quarry_curr_x = @s stardust.quarry_x1
execute if score @s stardust.quarry_x1 > @s stardust.quarry_x2 if score @s stardust.quarry_curr_x < @s stardust.quarry_x2 if score @s stardust.quarry_z1 < @s stardust.quarry_z2 run scoreboard players add @s stardust.quarry_curr_z 1
execute if score @s stardust.quarry_x1 > @s stardust.quarry_x2 if score @s stardust.quarry_curr_x < @s stardust.quarry_x2 if score @s stardust.quarry_z1 > @s stardust.quarry_z2 run scoreboard players remove @s stardust.quarry_curr_z 1
execute if score @s stardust.quarry_x1 > @s stardust.quarry_x2 if score @s stardust.quarry_curr_x < @s stardust.quarry_x2 run scoreboard players operation @s stardust.quarry_curr_x = @s stardust.quarry_x1

# If passed Z limit, reset Z and move in Y direction
execute if score @s stardust.quarry_z1 < @s stardust.quarry_z2 if score @s stardust.quarry_curr_z > @s stardust.quarry_z2 if score @s stardust.quarry_y1 < @s stardust.quarry_y2 run scoreboard players add @s stardust.quarry_curr_y 1
execute if score @s stardust.quarry_z1 < @s stardust.quarry_z2 if score @s stardust.quarry_curr_z > @s stardust.quarry_z2 if score @s stardust.quarry_y1 > @s stardust.quarry_y2 run scoreboard players remove @s stardust.quarry_curr_y 1
execute if score @s stardust.quarry_z1 < @s stardust.quarry_z2 if score @s stardust.quarry_curr_z > @s stardust.quarry_z2 run scoreboard players operation @s stardust.quarry_curr_z = @s stardust.quarry_z1
execute if score @s stardust.quarry_z1 > @s stardust.quarry_z2 if score @s stardust.quarry_curr_z < @s stardust.quarry_z2 if score @s stardust.quarry_y1 < @s stardust.quarry_y2 run scoreboard players add @s stardust.quarry_curr_y 1
execute if score @s stardust.quarry_z1 > @s stardust.quarry_z2 if score @s stardust.quarry_curr_z < @s stardust.quarry_z2 if score @s stardust.quarry_y1 > @s stardust.quarry_y2 run scoreboard players remove @s stardust.quarry_curr_y 1
execute if score @s stardust.quarry_z1 > @s stardust.quarry_z2 if score @s stardust.quarry_curr_z < @s stardust.quarry_z2 run scoreboard players operation @s stardust.quarry_curr_z = @s stardust.quarry_z1

# If passed Y limit, stop quarry
execute if score @s stardust.quarry_y1 < @s stardust.quarry_y2 if score @s stardust.quarry_curr_y > @s stardust.quarry_y2 run scoreboard players set #blocks_to_break stardust.data 0
execute if score @s stardust.quarry_y1 < @s stardust.quarry_y2 if score @s stardust.quarry_curr_y > @s stardust.quarry_y2 run return run scoreboard players set @s stardust.quarry_status 0
execute if score @s stardust.quarry_y1 > @s stardust.quarry_y2 if score @s stardust.quarry_curr_y < @s stardust.quarry_y2 run scoreboard players set #blocks_to_break stardust.data 0
execute if score @s stardust.quarry_y1 > @s stardust.quarry_y2 if score @s stardust.quarry_curr_y < @s stardust.quarry_y2 run return run scoreboard players set @s stardust.quarry_status 0

