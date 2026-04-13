
#> stardust:utils/home_travel_staff/check
#
# @executed	as @a & at @s
#
# @within	stardust:utils/home_travel_staff/schedule_teleport [ as @a & at @s ]
#

# Check if player has moved
scoreboard players reset @s stardust.travel_staff_cooldown
execute store result score #new_x stardust.data run data get entity @s Pos[0] 100
execute store result score #new_y stardust.data run data get entity @s Pos[1] 100
execute store result score #new_z stardust.data run data get entity @s Pos[2] 100
execute unless score @s stardust.travel_x = #new_x stardust.data run return run function stardust:utils/home_travel_staff/fail
execute unless score @s stardust.travel_y = #new_y stardust.data run return run function stardust:utils/home_travel_staff/fail
execute unless score @s stardust.travel_z = #new_z stardust.data run return run function stardust:utils/home_travel_staff/fail

# Teleport
advancement grant @s only stardust:visible/stuff/home_travel_staff
function stardust:dimensions/teleport_home

