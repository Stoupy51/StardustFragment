
#> stardust:quarry/working/start
#
# @within			stardust:quarry/working
# @executed			as & at quarry custom entity
#
# @description		Function called to start the quarry
#

# Copy the start position to the current position
scoreboard players operation @s stardust.quarry_x = @s stardust.quarry_x1
scoreboard players operation @s stardust.quarry_y = @s stardust.quarry_y1
scoreboard players operation @s stardust.quarry_z = @s stardust.quarry_z1

# Set the status to "working"
scoreboard players set @s stardust.quarry_status 2

