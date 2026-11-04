
#> stardust:utils/modify_arrow
#
# @executed	as @n[type=arrow,tag=!stardust.damage_multiplied,nbt={...}]
#
# @within	stardust:advancements/bow_shoot {hundredfold:200.0} [ as @n[type=arrow,tag=!stardust.damage_multiplied,nbt={...}] ]
#			stardust:advancements/bow_shoot {hundredfold:300.0} [ as @n[type=arrow,tag=!stardust.damage_multiplied,nbt={...}] ]
#			stardust:advancements/bow_shoot {hundredfold:400.0} [ as @n[type=arrow,tag=!stardust.damage_multiplied,nbt={...}] ]
#
# @args		hundredfold (double)
#

# Multiply arrow damage
$execute store result entity @s damage double 0.01 run data get entity @s damage $(hundredfold)

# Set NoGravity if sneaking
execute if score #is_sneaking stardust.data matches 1 run data modify entity @s NoGravity set value 1b

# Mark as modified
tag @s add stardust.damage_multiplied

