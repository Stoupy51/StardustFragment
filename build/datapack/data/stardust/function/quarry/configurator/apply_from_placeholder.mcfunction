
#> stardust:quarry/configurator/apply_from_placeholder
#
# @executed	as @e[tag=stardust.second] & at @s
#
# @within	stardust:quarry/update_info
#

# Retrieve configuration from placeholder
data modify storage stardust:temp config set from block ~ ~ ~ Items[{Slot:25b}].components."minecraft:custom_data".stardust
execute store result score @s stardust.quarry_x1 run data get storage stardust:temp config.quarry_x1
execute store result score @s stardust.quarry_y1 run data get storage stardust:temp config.quarry_y1
execute store result score @s stardust.quarry_z1 run data get storage stardust:temp config.quarry_z1
execute store result score @s stardust.quarry_x2 run data get storage stardust:temp config.quarry_x2
execute store result score @s stardust.quarry_y2 run data get storage stardust:temp config.quarry_y2
execute store result score @s stardust.quarry_z2 run data get storage stardust:temp config.quarry_z2

