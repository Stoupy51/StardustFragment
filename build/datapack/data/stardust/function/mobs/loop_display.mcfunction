
#> stardust:mobs/loop_display
#
# @executed	as @e[type=item_display,tag=...] & at @s
#
# @within	stardust:mobs/ticking [ as @e[type=item_display,tag=...] & at @s ]
#

# Get mob's data
data modify storage stardust:temp entity_data set value {}
execute on vehicle run data modify storage stardust:temp entity_data set from entity @s

# Check if mob entity is still alive (hp >= 0), if not start dying display and stop here
scoreboard players set #mob_health stardust.data 0
execute on vehicle store result score #mob_health stardust.data run data get storage stardust:temp entity_data.Health 1000
execute if score #mob_health stardust.data matches ..0 run return run function stardust:mobs/start_dying_display

# Apply rotation (only yaw)
data modify entity @s Rotation[0] set from storage stardust:temp entity_data.Rotation[0]

# Get HurtTime (for hurt model)
scoreboard players set #hurt_time stardust.data 0
execute store result score #hurt_time stardust.data run data get storage stardust:temp entity_data.HurtTime
scoreboard players operation #hurt_time_minus_one stardust.data = #hurt_time stardust.data
scoreboard players remove #hurt_time_minus_one stardust.data 1

# Apply hurt model if HurtTime updates
execute unless score @s stardust.hurt_time matches 1.. if score #hurt_time stardust.data matches 1.. run data modify entity @s item.components."minecraft:dyed_color" set value [1.0,0.5,0.5]
execute unless score @s stardust.hurt_time matches 1.. if score #hurt_time stardust.data matches 1.. run scoreboard players operation @s stardust.hurt_time = #hurt_time_minus_one stardust.data
execute if score @s stardust.hurt_time matches 0 run data remove entity @s item.components."minecraft:dyed_color"

# Decrease mob hurt time scoreboard (to track when to remove hurt model)
execute if score @s stardust.hurt_time matches 0.. run scoreboard players remove @s stardust.hurt_time 1

