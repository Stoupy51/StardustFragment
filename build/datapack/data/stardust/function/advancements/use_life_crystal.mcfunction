
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
execute if score @s stardust.life_crystal matches 20 run return run tellraw @s {"translate":"stardust_fragment_you_have_already_reached_the_maximum_number_of","color":"red"}

# Update life crystal count & attribute
scoreboard players add @s stardust.life_crystal 1
particle minecraft:heart ~ ~1 ~ .5 .5 .5 1 10 normal
function stardust:utils/update_max_health

# Clear one life crystal
clear @s *[custom_data~{stardust:{"life_crystal":true}}] 1

# Grant life crystal advancement(s)
advancement grant @s only stardust:visible/stuff/life_crystal
execute if score @s stardust.life_crystal matches 20 run advancement grant @s only stardust:visible/stuff/life_crystal_max

