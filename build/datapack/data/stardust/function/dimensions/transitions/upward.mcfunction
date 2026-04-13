
#> stardust:dimensions/transitions/upward
#
# @executed	as @e[tag=!...,predicate=stardust:transitions/outside] & at @s
#
# @within	stardust:dimensions/transitions/check
#

# If dimension is overworld, and expansion or bracken pack is installed, stop here (to avoid conflicts)
execute if dimension minecraft:overworld if function stardust:dimensions/is_expansion_installed run return fail
execute if dimension minecraft:overworld if function stardust:dimensions/is_bracken_installed run return fail

# If player is in overworld, teleport to celestial dimension
execute if dimension minecraft:overworld in stardust:celestial run return run tp @s ~ 16 ~

# If player is in celestial, teleport to stardust dimension
execute if dimension stardust:celestial in stardust:stardust run return run tp @s ~ 16 ~

