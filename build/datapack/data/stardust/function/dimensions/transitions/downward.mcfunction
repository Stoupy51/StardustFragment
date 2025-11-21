
#> stardust:dimensions/transitions/downward
#
# @executed	as @e[tag=!...,predicate=stardust:transitions/outside] & at @s
#
# @within	stardust:dimensions/transitions/check
#

# Bracken pack compatibility: If dimension is celestial, teleport to pax
execute if function stardust:dimensions/is_bracken_installed if dimension stardust:celestial in bracken:pax run tp @s ~ 575 ~

# If dimension is ultimate, teleport to stardust dimension
execute if dimension stardust:ultimate in stardust:stardust run return run tp @s ~ 480 ~

# If dimension is stardust, teleport to celestial dimension
execute if dimension stardust:stardust run advancement grant @s only stardust:visible/adventure/falling_stardust
execute if dimension stardust:stardust in stardust:celestial run return run tp @s ~ 480 ~

# If dimension is celestial, teleport to overworld
execute if dimension stardust:celestial run advancement grant @s only stardust:visible/adventure/falling_celestial
execute if dimension stardust:celestial in minecraft:overworld run return run tp @s ~ 480 ~

# If dimension is dungeon, teleport back to home
execute if dimension stardust:dungeon if entity @s[type=player] run return run function stardust:dimensions/teleport_home

