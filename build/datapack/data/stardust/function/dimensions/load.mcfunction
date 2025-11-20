
#> stardust:dimensions/load
#
# @within	stardust:dimensions/ensure_built 2s [ scheduled ]
#

execute unless score #dungeon_built stardust.data matches 1 in stardust:dungeon run function stardust:dimensions/structure/dungeon/start
execute unless score #ultimate_built stardust.data matches 1 in stardust:ultimate run function stardust:dimensions/structure/ultimate/start

