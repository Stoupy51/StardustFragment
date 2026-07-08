
#> stardust:dimensions/structure/dungeon/final
#
# @within	stardust:dimensions/structure/dungeon/part_11 1t [ scheduled ]
#

# Place the stardust dungeon portal
scoreboard players set #infinite_energy stardust.data 1
execute in stardust:dungeon positioned -9 66 3 run function stardust:custom_blocks/stardust_dungeon_portal/place_main

# Place the marker block proving the dimension is built
execute in stardust:dungeon run setblock -19 1 -150 minecraft:barrier

# Remove the area forceload but keep the marker chunk loaded for the periodic check
execute in stardust:dungeon run forceload remove -19 -150 179 52
execute in stardust:dungeon run forceload add -19 -150
scoreboard players set #dungeon_building stardust.data 0

