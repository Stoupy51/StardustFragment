
#> stardust:mobs/create_model
#
# @executed	positioned over world_surface run
#
# @within	stardust:mobs/stoupy/convert {"entity":"stoupy"}
#			stardust:mobs/stardust_soldier/convert {"entity":"stardust_soldier"}
#			stardust:mobs/stardust_evoker/convert {"entity":"stardust_evoker"}
#			stardust:mobs/stardust_bat/convert {"entity":"stardust_bat"}
#			stardust:mobs/stardust_pillar/convert {"entity":"stardust_pillar"}
#			stardust:mobs/stardust_guardian/convert {"entity":"stardust_guardian"}
#			stardust:mobs/ultimate_dragon/convert {"entity":"ultimate_dragon"}
#			stardust:mobs/ultimate_slave/convert {"entity":"ultimate_slave"}
#
# @args		entity (string)
#

# Add tags
tag @s add smithed.entity
tag @s add global.ignore
tag @s add smithed.strict
tag @s add global.ignore.kill
$tag @s add stardust.$(entity)
tag @s add stardust.mob_model

# Ride the mob
ride @s mount @n[tag=stardust.new_mob]

# Set item display properties
$item replace entity @s contents with stone[item_model="stardust:$(entity)"]

# Scale and position (based on mob's base scale)
execute store result entity @s transformation.scale[0] double 0.001 run scoreboard players get #base_scale stardust.data
execute store result entity @s transformation.scale[1] double 0.001 run scoreboard players get #base_scale stardust.data
execute store result entity @s transformation.scale[2] double 0.001 run scoreboard players get #base_scale stardust.data
execute store result entity @s transformation.translation[1] double -0.0015 run scoreboard players get #base_scale stardust.data

# If Stardust Pillar, adjust Y position for model
execute if data entity @s item.components{"minecraft:item_model":"stardust:stardust_pillar"} store result entity @s transformation.translation[1] double -0.0012 run scoreboard players get #base_scale stardust.data

# Smooth movement
data modify entity @s teleport_duration set value 2

