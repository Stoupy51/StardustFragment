
#> stardust:dimensions/load
#
# @within	stardust:dimensions/ensure_built 2s [ scheduled ]
#

# Rebuild any dimension whose marker block is missing (unless a build is already in progress)
execute in stardust:dungeon if loaded -19 1 -150 unless block -19 1 -150 minecraft:barrier unless score #dungeon_building stardust.data matches 1 run function stardust:dimensions/rebuild/dungeon
execute in stardust:ultimate if loaded -73 1 -69 unless block -73 1 -69 minecraft:barrier unless score #ultimate_building stardust.data matches 1 run function stardust:dimensions/rebuild/ultimate

