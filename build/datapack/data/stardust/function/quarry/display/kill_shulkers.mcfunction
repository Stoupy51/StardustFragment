
#> stardust:quarry/display/kill_shulkers
#
# @executed	as @e[tag=stardust.second] & at @s
#
# @within	stardust:quarry/display/summon_shulkers 1t append
#			stardust:quarry/display/kill_shulkers 1s replace
#			stardust:quarry/work 1t append
#

# Increment score of all shulkers, and kill them if score >= 2 seconds
scoreboard players set #shulkers_remaining stardust.data 0
execute as @e[tag=stardust.quarry_displaying] run function stardust:quarry/display/shulkers_loop

# Reschedule if any shulker remains
execute if score #shulkers_remaining stardust.data matches 1.. run schedule function stardust:quarry/display/kill_shulkers 1s replace

