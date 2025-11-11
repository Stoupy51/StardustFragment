
#> stardust:dimensions/load
#
# @within	stardust:v3.5.0/load/confirm_load 2s
#

execute unless score #dungeon_built stardust.data matches 1 in stardust:dungeon run function stardust:dimensions/structure/dungeon
execute unless score #ultimate_built stardust.data matches 1 in stardust:ultimate run function stardust:dimensions/structure/ultimate

