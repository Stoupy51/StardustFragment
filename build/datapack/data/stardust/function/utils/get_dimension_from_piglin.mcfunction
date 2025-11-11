
#> stardust:utils/get_dimension_from_piglin
#
# @executed	positioned -30000000 51 1610
#
# @within	stardust:utils/get_world_spawn_from_marker [ positioned -30000000 51 1610 ]
#

data modify storage stardust:main world_spawn.dimension set from entity @s Brain.memories."minecraft:home".value.dimension
tp @s ~ -10000 ~
kill @s

