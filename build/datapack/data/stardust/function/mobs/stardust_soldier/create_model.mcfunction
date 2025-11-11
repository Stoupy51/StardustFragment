
#> stardust:mobs/stardust_soldier/create_model
#
# @executed	at @s
#
# @within	stardust:mobs/stardust_soldier/convert
#

# Add tags
tag @s add smithed.entity
tag @s add global.ignore
tag @s add smithed.strict
tag @s add global.ignore.kill

# Ride the mob
ride @s mount @n[tag=stardust.new_mob]

# Set item display's item to the mob model
loot replace entity @s contents loot stardust:i/stardust_soldier

# Scale and position (based on mob's base scale)
execute store result entity @s transformation.scale[0] double 0.001 run scoreboard players get #base_scale stardust.data
execute store result entity @s transformation.scale[1] double 0.001 run scoreboard players get #base_scale stardust.data
execute store result entity @s transformation.scale[2] double 0.001 run scoreboard players get #base_scale stardust.data
execute store result entity @s transformation.translation[1] double -0.0015 run scoreboard players get #base_scale stardust.data

# Smooth movement
data modify entity @s teleport_duration set value 1

