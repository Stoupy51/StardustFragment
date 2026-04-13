
#> stardust:utils/home_travel_staff/schedule_teleport
#
# @within	stardust:utils/home_travel_staff/right_click 100t append [ scheduled ]
#

execute as @a if score @s stardust.travel_staff_cooldown = #global_tick stardust.data at @s run function stardust:utils/home_travel_staff/check

