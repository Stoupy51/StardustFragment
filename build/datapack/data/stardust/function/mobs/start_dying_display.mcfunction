
#> stardust:mobs/start_dying_display
#
# @executed	as @e[type=item_display,tag=...] & at @s
#
# @within	stardust:mobs/loop_display
#

# Tag as dying model to avoid looping
tag @s add stardust.dying_model
tag @s remove stardust.mob_model

# Set dyed color to red
data modify entity @s item.components."minecraft:dyed_color" set value [1.0,0.5,0.5]

# Set transformation data
data modify entity @s transformation.left_rotation set value [0.0f,0.0f,0.7f,0.7f]
data modify entity @s transformation.translation[0] set value -0.7f
data modify entity @s interpolation_duration set value 8
data modify entity @s start_interpolation set value 0
data modify entity @s teleport_duration set value 20

# Schedule removal after 20 ticks
scoreboard players set @s stardust.data 20
schedule function stardust:mobs/remove_dying_display 1t append

