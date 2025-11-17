
#> stardust:mobs/ultimate_dragon/essence/add_passenger
#
# @executed	as @e[type=minecraft:lingering_potion,tag=!stardust.potion_checked]
#
# @within	stardust:mobs/ultimate_dragon/essence/on_new_lingering_potion
#

# Ride the lingering potion
ride @s mount @n[tag=stardust.temp]

# Set transformation properties
data modify entity @s transformation.scale set value [0.0d,0.0d,0.0d]
data modify entity @s transformation.translation[1] set value -15.0d
data modify entity @s interpolation_duration set value 160
data modify entity @s teleport_duration set value 0

# Add tags
tag @s add smithed.entity
tag @s add global.ignore
tag @s add smithed.strict
tag @s add global.ignore.kill
tag @s add stardust.check_ultimate_dragon_essence

