
#> stardust:dimensions/rebuild/ultimate
#
# @executed	in stardust:ultimate
#
# @within	stardust:dimensions/load [ in stardust:ultimate ]
#

# Forceload the whole structure area and start placing parts
scoreboard players set #ultimate_building stardust.data 1
execute in stardust:ultimate run forceload add -73 -69 71 75
schedule function stardust:dimensions/structure/ultimate/start 2s

