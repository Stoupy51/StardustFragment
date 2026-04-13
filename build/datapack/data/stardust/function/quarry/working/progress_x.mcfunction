
#> stardust:quarry/working/progress_x
#
# @executed	as @e[tag=stardust.second] & at @s
#
# @within	stardust:quarry/working/update_coordinates
#

# If x1 == x2 (single column in X), skip to Z progression
execute if score @s stardust.quarry_x1 = @s stardust.quarry_x2 run return run function stardust:quarry/working/progress_z

# Move in X direction
execute if score @s stardust.quarry_x1 < @s stardust.quarry_x2 run scoreboard players add @s stardust.quarry_curr_x 1
execute if score @s stardust.quarry_x1 > @s stardust.quarry_x2 run scoreboard players remove @s stardust.quarry_curr_x 1

# Check if passed X limit
execute if score @s stardust.quarry_x1 < @s stardust.quarry_x2 if score @s stardust.quarry_curr_x > @s stardust.quarry_x2 run return run function stardust:quarry/working/progress_z
execute if score @s stardust.quarry_x1 > @s stardust.quarry_x2 if score @s stardust.quarry_curr_x < @s stardust.quarry_x2 run return run function stardust:quarry/working/progress_z

