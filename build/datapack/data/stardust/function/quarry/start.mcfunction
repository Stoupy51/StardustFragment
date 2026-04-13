
#> stardust:quarry/start
#
# @executed	as @e[tag=stardust.second] & at @s
#
# @within	stardust:quarry/gui/check_buttons
#

# Initialize current coordinates, and set status to working
scoreboard players operation @s stardust.quarry_curr_x = @s stardust.quarry_x1
scoreboard players operation @s stardust.quarry_curr_y = @s stardust.quarry_y1
scoreboard players operation @s stardust.quarry_curr_z = @s stardust.quarry_z1
scoreboard players set @s stardust.quarry_status 1

