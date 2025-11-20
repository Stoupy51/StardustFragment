
#> stardust:dimensions/ensure_built
#
# @within	stardust:v3.5.0/load/confirm_load
#			stardust:mobs/ultimate_dragon/finish_death_at_entity 20s [ scheduled ]
#

# Make sure dimensions are built
execute unless score #dungeon_built stardust.data matches 1 in stardust:dungeon run forceload add -19 -150 179 52
execute unless score #ultimate_built stardust.data matches 1 in stardust:ultimate run forceload add -73 -69 71 75
schedule function stardust:dimensions/load 2s

