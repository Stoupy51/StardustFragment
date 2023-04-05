
#> stardust:load/dimensions
#
# @within			stardust:load/confirm_load
# @executed			default context
#
# @description		Function executed 2 seconds after parent function
#

# Load End, Dungeon, and Ultimate dimensions
execute unless score #end_built stardust.data matches 2 as @r at @s run function stardust:dimensions/end/all
execute unless score #dungeon_built stardust.data matches 2 in stardust:dungeon run function stardust:dimensions/structure/dungeon
execute unless score #ultimate_built stardust.data matches 2 in stardust:ultimate run function stardust:dimensions/structure/ultimate

