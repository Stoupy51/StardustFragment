
#> stardust:advancements/bow_shoot
#
# @executed	as the player & at current position
#
# @within	advancement stardust:technical/bow_shoot
#

# Revoke advancement and reset score
advancement revoke @s only stardust:technical/bow_shoot
scoreboard players set @s stardust.bow_shoot 0

# TODO: Shooting while sneaking makes no gravity arrows
# If Stardust Bow (x2.0), if Awakened Stardust Bow (x3.0), if Ultimate Bow (x4.0)
execute if items entity @s weapon.mainhand *[custom_data~{stardust:{"stardust_bow":true}}] as @n[type=arrow,tag=!stardust.damage_multiplied,nbt={weapon:{components:{"minecraft:custom_data":{stardust:{"stardust_bow":true}}}}}] run function stardust:utils/multiply_arrow_power {scale:2.0}
execute if items entity @s weapon.mainhand *[custom_data~{stardust:{"awakened_stardust_bow":true}}] as @n[type=arrow,tag=!stardust.damage_multiplied,nbt={weapon:{components:{"minecraft:custom_data":{stardust:{"awakened_stardust_bow":true}}}}}] run function stardust:utils/multiply_arrow_power {scale:3.0}
execute if items entity @s weapon.mainhand *[custom_data~{stardust:{"ultimate_bow":true}}] as @n[type=arrow,tag=!stardust.damage_multiplied,nbt={weapon:{components:{"minecraft:custom_data":{stardust:{"ultimate_bow":true}}}}}] run function stardust:utils/multiply_arrow_power {scale:4.0}

