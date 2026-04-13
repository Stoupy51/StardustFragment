
#> stardust:quarry/working/progress_y
#
# @executed	as @e[tag=stardust.second] & at @s
#
# @within	stardust:quarry/working/progress_z
#

# Reset X and Z coordinates
scoreboard players operation @s stardust.quarry_curr_x = @s stardust.quarry_x1
scoreboard players operation @s stardust.quarry_curr_z = @s stardust.quarry_z1

# Move in Y direction
execute if score @s stardust.quarry_y1 < @s stardust.quarry_y2 run scoreboard players add @s stardust.quarry_curr_y 1
execute if score @s stardust.quarry_y1 > @s stardust.quarry_y2 run scoreboard players remove @s stardust.quarry_curr_y 1

# Check if passed Y limit (quarry is finished)
execute if score @s stardust.quarry_y1 < @s stardust.quarry_y2 if score @s stardust.quarry_curr_y > @s stardust.quarry_y2 run return run function stardust:quarry/working/progress_stop
execute if score @s stardust.quarry_y1 > @s stardust.quarry_y2 if score @s stardust.quarry_curr_y < @s stardust.quarry_y2 run return run function stardust:quarry/working/progress_stop

# Handle single-layer Y case: if y1 == y2 and we've reached y2, we're finished
execute if score @s stardust.quarry_y1 = @s stardust.quarry_y2 if score @s stardust.quarry_curr_y = @s stardust.quarry_y2 run return run function stardust:quarry/working/progress_stop

