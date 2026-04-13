
#> stardust:quarry/working/progress_z
#
# @executed	as @e[tag=stardust.second] & at @s
#
# @within	stardust:quarry/working/progress_x
#

# Reset X coordinate
scoreboard players operation @s stardust.quarry_curr_x = @s stardust.quarry_x1

# If z1 == z2 (single row in Z), skip to Y progression
execute if score @s stardust.quarry_z1 = @s stardust.quarry_z2 run return run function stardust:quarry/working/progress_y

# Move in Z direction
execute if score @s stardust.quarry_z1 < @s stardust.quarry_z2 run scoreboard players add @s stardust.quarry_curr_z 1
execute if score @s stardust.quarry_z1 > @s stardust.quarry_z2 run scoreboard players remove @s stardust.quarry_curr_z 1

# Check if passed Z limit
execute if score @s stardust.quarry_z1 < @s stardust.quarry_z2 if score @s stardust.quarry_curr_z > @s stardust.quarry_z2 run return run function stardust:quarry/working/progress_y
execute if score @s stardust.quarry_z1 > @s stardust.quarry_z2 if score @s stardust.quarry_curr_z < @s stardust.quarry_z2 run return run function stardust:quarry/working/progress_y

