
#> stardust:quarry/display/main
#
# @executed	as @e[tag=stardust.second] & at @s
#
# @within	stardust:quarry/update_info
#

# Get coordinates
scoreboard players operation #config_x1 stardust.data = @s stardust.quarry_x1
scoreboard players operation #config_y1 stardust.data = @s stardust.quarry_y1
scoreboard players operation #config_z1 stardust.data = @s stardust.quarry_z1
scoreboard players operation #config_x2 stardust.data = @s stardust.quarry_x2
scoreboard players operation #config_y2 stardust.data = @s stardust.quarry_y2
scoreboard players operation #config_z2 stardust.data = @s stardust.quarry_z2

# Summon shulkers
execute summon marker run function stardust:quarry/display/summon_shulkers

