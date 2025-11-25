
#> stardust:utils/multiply_arrow_power
#
# @executed	as @n[type=arrow,tag=!stardust.damage_multiplied,nbt={...}]
#
# @within	stardust:advancements/bow_shoot {scale:2.0} [ as @n[type=arrow,tag=!stardust.damage_multiplied,nbt={...}] ]
#			stardust:advancements/bow_shoot {scale:3.0} [ as @n[type=arrow,tag=!stardust.damage_multiplied,nbt={...}] ]
#			stardust:advancements/bow_shoot {scale:4.0} [ as @n[type=arrow,tag=!stardust.damage_multiplied,nbt={...}] ]
#
# @args		scale (double)
#

$execute store result entity @s damage double $(scale) run data get entity @s damage 1.0
tag @s add stardust.damage_multiplied

