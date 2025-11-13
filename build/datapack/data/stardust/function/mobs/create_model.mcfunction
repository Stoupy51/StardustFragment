
#> stardust:mobs/create_model
#
# @executed	at @s
#
# @within	stardust:mobs/stardust_soldier/convert {"entity":"stardust_soldier"}
#
# @args		entity (string)
#

# Add tags
tag @s add smithed.entity
tag @s add global.ignore
tag @s add smithed.strict
tag @s add global.ignore.kill
tag @s add stardust.mob_model

# Ride the mob
ride @s mount @n[tag=stardust.new_mob]

# Scale and position (based on mob's base scale)
execute store result entity @s transformation.scale[0] double 0.001 run scoreboard players get #base_scale stardust.data
execute store result entity @s transformation.scale[1] double 0.001 run scoreboard players get #base_scale stardust.data
execute store result entity @s transformation.scale[2] double 0.001 run scoreboard players get #base_scale stardust.data
execute store result entity @s transformation.translation[1] double -0.0015 run scoreboard players get #base_scale stardust.data

# Set item display properties
$item replace entity @s contents with stone[item_model="stardust:$(entity)"]

# Smooth movement
data modify entity @s teleport_duration set value 2

