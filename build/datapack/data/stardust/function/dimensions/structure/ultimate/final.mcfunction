
#> stardust:dimensions/structure/ultimate/final
#
# @within	stardust:dimensions/structure/ultimate/part_21 1t [ scheduled ]
#

# Place the marker block proving the dimension is built
execute in stardust:ultimate run setblock -73 1 -69 minecraft:barrier

# Remove the area forceload but keep the marker chunk loaded for the periodic check
execute in stardust:ultimate run forceload remove -73 -69 71 75
execute in stardust:ultimate run forceload add -73 -69
scoreboard players set #ultimate_building stardust.data 0

