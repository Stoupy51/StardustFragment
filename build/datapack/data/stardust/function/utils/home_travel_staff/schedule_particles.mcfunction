
#> stardust:utils/home_travel_staff/schedule_particles
#
# @within	stardust:utils/home_travel_staff/right_click 50t append [ scheduled ]
#

# Particle effect when 50 ticks left
scoreboard players operation #plus_50 stardust.data = #global_tick stardust.data
scoreboard players add #plus_50 stardust.data 50
execute as @a if score @s stardust.travel_staff_cooldown = #plus_50 stardust.data at @s run particle minecraft:portal ~ ~1 ~ 1 1 1 3 2500

