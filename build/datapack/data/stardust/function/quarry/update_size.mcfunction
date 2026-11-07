
#> stardust:quarry/update_size
#
# @executed	as @e[tag=stardust.second] & at @s
#
# @within	stardust:quarry/update_info
#

# Length, Width, Depth
scoreboard players operation #rX stardust.data = @s stardust.quarry_x1
scoreboard players operation #rX stardust.data -= @s stardust.quarry_x2
scoreboard players operation #rY stardust.data = @s stardust.quarry_y1
scoreboard players operation #rY stardust.data -= @s stardust.quarry_y2
scoreboard players operation #rZ stardust.data = @s stardust.quarry_z1
scoreboard players operation #rZ stardust.data -= @s stardust.quarry_z2

# Each side counts both of its end blocks: |a - b| + 1
execute if score #rX stardust.data matches ..-1 run scoreboard players operation #rX stardust.data *= #-1 stardust.data
execute if score #rY stardust.data matches ..-1 run scoreboard players operation #rY stardust.data *= #-1 stardust.data
execute if score #rZ stardust.data matches ..-1 run scoreboard players operation #rZ stardust.data *= #-1 stardust.data
scoreboard players add #rX stardust.data 1
scoreboard players add #rY stardust.data 1
scoreboard players add #rZ stardust.data 1

# Calculating Size
scoreboard players operation @s stardust.quarry_size = #rX stardust.data
scoreboard players operation @s stardust.quarry_size *= #rY stardust.data
scoreboard players operation @s stardust.quarry_size *= #rZ stardust.data

