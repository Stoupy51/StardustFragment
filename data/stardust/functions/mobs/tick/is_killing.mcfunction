
#> stardust:mobs/tick/is_killing
#
# @within			stardust:mobs/tick/secondary
# @executed			as & at Model item display
#
# @description		Entity died, launch death animation
#

# Set death animation scores
scoreboard players set #temp stardust.data 2
scoreboard players set #death stardust.data 1
scoreboard players set @s stardust.cooldown 20
tag @s add stardust.death_model

# Set transformation data
data modify entity @s transformation.left_rotation set value [0.0f,0.0f,0.7f,0.7f]
data modify entity @s transformation.translation set value [-0.7f,-1.0f,0.0f]
data modify entity @s interpolation_duration set value 8
data modify entity @s start_interpolation set value 0

