
#> stardust:quarry/gui/check_buttons
#
# @executed	as @e[tag=stardust.second] & at @s
#
# @within	stardust:quarry/update_info
#

# Start button
execute unless score @s stardust.quarry_status matches 1.. unless data storage stardust:temp Items[{Slot:19b}] run return run function stardust:quarry/start
execute unless score @s stardust.quarry_status matches 2 unless data storage stardust:temp Items[{Slot:19b}] run return run scoreboard players set @s stardust.quarry_status 1

# Pause button
execute if score @s stardust.quarry_status matches 1 unless data storage stardust:temp Items[{Slot:20b}] run return run scoreboard players set @s stardust.quarry_status 2
execute if score @s stardust.quarry_status matches 2 unless data storage stardust:temp Items[{Slot:20b}] run return run scoreboard players set @s stardust.quarry_status 1

# Stop button
execute if score @s stardust.quarry_status matches 1.. unless data storage stardust:temp Items[{Slot:21b}] run return run scoreboard players set @s stardust.quarry_status 0

