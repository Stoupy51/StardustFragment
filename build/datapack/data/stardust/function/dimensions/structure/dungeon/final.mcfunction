
#> stardust:dimensions/structure/dungeon/final
#
# @within	stardust:dimensions/structure/dungeon/part_11 1t [ scheduled ]
#

# Place the stardust dungeon portal
scoreboard players set #infinite_energy stardust.data 1
execute in stardust:dungeon positioned -9 66 3 run function stardust:custom_blocks/stardust_dungeon_portal/place_main

# Mark dimension as built if successful
execute in stardust:dungeon run forceload remove -19 -150 179 52
scoreboard players set #dungeon_built stardust.data 1

