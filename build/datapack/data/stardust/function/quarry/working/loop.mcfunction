
#> stardust:quarry/working/loop
#
# @executed	as @e[tag=stardust.second] & at @s
#
# @within	stardust:quarry/work
#			stardust:quarry/working/loop
#

# Break at position
scoreboard players operation #quarry_x stardust.data = @s stardust.quarry_curr_x
scoreboard players operation #quarry_y stardust.data = @s stardust.quarry_curr_y
scoreboard players operation #quarry_z stardust.data = @s stardust.quarry_curr_z
execute summon marker run function stardust:quarry/working/break_at_position
function stardust:quarry/working/update_coordinates

# Continue loop if blocks remain to break
execute if score #blocks_to_break stardust.data matches 1.. run function stardust:quarry/working/loop

