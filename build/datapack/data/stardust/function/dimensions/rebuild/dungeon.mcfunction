
#> stardust:dimensions/rebuild/dungeon
#
# @executed	in stardust:dungeon
#
# @within	stardust:dimensions/load [ in stardust:dungeon ]
#

# Forceload the whole structure area and start placing parts
scoreboard players set #dungeon_building stardust.data 1
execute in stardust:dungeon run forceload add -19 -150 179 52
schedule function stardust:dimensions/structure/dungeon/start 2s

