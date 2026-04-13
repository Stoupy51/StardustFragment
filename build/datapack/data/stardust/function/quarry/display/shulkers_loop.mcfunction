
#> stardust:quarry/display/shulkers_loop
#
# @executed	as @e[tag=stardust.quarry_displaying]
#
# @within	stardust:quarry/display/kill_shulkers [ as @e[tag=stardust.quarry_displaying] ]
#

# Increment score
scoreboard players add @s stardust.data 1

# Kill shulker
execute if score @s stardust.data matches ..1 run scoreboard players add #shulkers_remaining stardust.data 1
execute if score @s stardust.data matches 2.. run tp @s 0 -10000 0
execute if score @s stardust.data matches 2.. run kill @s

