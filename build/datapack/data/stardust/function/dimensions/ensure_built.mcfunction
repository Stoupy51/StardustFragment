
#> stardust:dimensions/ensure_built
#
# @within	stardust:v4.0.13/load/confirm_load
#			stardust:v4.0.13/minute
#			stardust:mobs/ultimate_dragon/finish_death_at_entity 20s [ scheduled ]
#

# Forceload the marker chunk of each dimension (also restores forceloads wiped by a dimension reset)
execute in stardust:dungeon run forceload add -19 -150
execute in stardust:ultimate run forceload add -73 -69
schedule function stardust:dimensions/load 2s

