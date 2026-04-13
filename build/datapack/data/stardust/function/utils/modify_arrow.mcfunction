
#> stardust:utils/modify_arrow
#
# @executed	as @n[type=arrow,tag=!stardust.damage_multiplied,nbt={...}]
#
# @within	stardust:advancements/bow_shoot {scale:2.0} [ as @n[type=arrow,tag=!stardust.damage_multiplied,nbt={...}] ]
#			stardust:advancements/bow_shoot {scale:3.0} [ as @n[type=arrow,tag=!stardust.damage_multiplied,nbt={...}] ]
#			stardust:advancements/bow_shoot {scale:4.0} [ as @n[type=arrow,tag=!stardust.damage_multiplied,nbt={...}] ]
#
# @args		scale (double)
#

# Multiply arrow damage
$execute store result entity @s damage double $(scale) run data get entity @s damage 1.0

# Set NoGravity if sneaking
execute if score #is_sneaking stardust.data matches 1 run data modify entity @s NoGravity set value 1b

# Mark as modified
tag @s add stardust.damage_multiplied

