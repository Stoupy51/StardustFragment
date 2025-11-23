
#> stardust:advancements/use_life_crystal
#
# @executed	as the player & at current position
#
# @within	advancement stardust:technical/use_life_crystal
#

# Revoke advancement
advancement revoke @s only stardust:technical/use_life_crystal

# Stop if runned a tick ago (to prevent double consuming)
scoreboard players operation #cooldown stardust.data = @s stardust.cooldown
execute if score #cooldown stardust.data > #global_tick stardust.data run return fail
scoreboard players operation @s stardust.cooldown = #global_tick stardust.data
scoreboard players add @s stardust.cooldown 20

# Stop if already at max life crystals
execute if score @s stardust.life_crystal matches 20 run return run tellraw @s {"translate": "stardust_fragment_you_have_already_reached_the_maximum_number_of","color":"red"}

# Update life crystal count & attribute
scoreboard players add @s stardust.life_crystal 1
particle minecraft:heart ~ ~1 ~ .5 .5 .5 1 10 normal
attribute @s minecraft:max_health modifier remove stardust:life_crystal
execute if score @s stardust.life_crystal matches 1 run attribute @s minecraft:max_health modifier add stardust:life_crystal 1 add_value
execute if score @s stardust.life_crystal matches 2 run attribute @s minecraft:max_health modifier add stardust:life_crystal 2 add_value
execute if score @s stardust.life_crystal matches 3 run attribute @s minecraft:max_health modifier add stardust:life_crystal 3 add_value
execute if score @s stardust.life_crystal matches 4 run attribute @s minecraft:max_health modifier add stardust:life_crystal 4 add_value
execute if score @s stardust.life_crystal matches 5 run attribute @s minecraft:max_health modifier add stardust:life_crystal 5 add_value
execute if score @s stardust.life_crystal matches 6 run attribute @s minecraft:max_health modifier add stardust:life_crystal 6 add_value
execute if score @s stardust.life_crystal matches 7 run attribute @s minecraft:max_health modifier add stardust:life_crystal 7 add_value
execute if score @s stardust.life_crystal matches 8 run attribute @s minecraft:max_health modifier add stardust:life_crystal 8 add_value
execute if score @s stardust.life_crystal matches 9 run attribute @s minecraft:max_health modifier add stardust:life_crystal 9 add_value
execute if score @s stardust.life_crystal matches 10 run attribute @s minecraft:max_health modifier add stardust:life_crystal 10 add_value
execute if score @s stardust.life_crystal matches 11 run attribute @s minecraft:max_health modifier add stardust:life_crystal 11 add_value
execute if score @s stardust.life_crystal matches 12 run attribute @s minecraft:max_health modifier add stardust:life_crystal 12 add_value
execute if score @s stardust.life_crystal matches 13 run attribute @s minecraft:max_health modifier add stardust:life_crystal 13 add_value
execute if score @s stardust.life_crystal matches 14 run attribute @s minecraft:max_health modifier add stardust:life_crystal 14 add_value
execute if score @s stardust.life_crystal matches 15 run attribute @s minecraft:max_health modifier add stardust:life_crystal 15 add_value
execute if score @s stardust.life_crystal matches 16 run attribute @s minecraft:max_health modifier add stardust:life_crystal 16 add_value
execute if score @s stardust.life_crystal matches 17 run attribute @s minecraft:max_health modifier add stardust:life_crystal 17 add_value
execute if score @s stardust.life_crystal matches 18 run attribute @s minecraft:max_health modifier add stardust:life_crystal 18 add_value
execute if score @s stardust.life_crystal matches 19 run attribute @s minecraft:max_health modifier add stardust:life_crystal 19 add_value
execute if score @s stardust.life_crystal matches 20 run attribute @s minecraft:max_health modifier add stardust:life_crystal 20 add_value

# Clear one life crystal
clear @s *[custom_data~{stardust:{"life_crystal":true}}] 1

# Grant life crystal advancement(s)
advancement grant @s only stardust:visible/stuff/life_crystal
execute if score @s stardust.life_crystal matches 20 run advancement grant @s only stardust:visible/stuff/life_crystal_max

