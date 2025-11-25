
#> stardust:utils/home_travel_staff/right_click
#
# @executed	as the player & at current position
#
# @within	stardust:advancements/right_click
#

# Stop if already clicked recently
execute if score @s stardust.travel_staff_cooldown > #global_tick stardust.data run return fail

# Time to teleport (100 ticks)
scoreboard players operation @s stardust.travel_staff_cooldown = #global_tick stardust.data
scoreboard players add @s stardust.travel_staff_cooldown 100
schedule function stardust:utils/home_travel_staff/schedule_teleport 100t append
schedule function stardust:utils/home_travel_staff/schedule_particles 50t append

# Copy current position (to detect if moved)
execute store result score @s stardust.travel_x run data get entity @s Pos[0] 100
execute store result score @s stardust.travel_y run data get entity @s Pos[1] 100
execute store result score @s stardust.travel_z run data get entity @s Pos[2] 100

# Use 1 durability
function stardust:utils/use_durability/main {"amount":1,"max_damage":64,"item_model":"stardust:home_travel_staff"}

# Feedback
playsound minecraft:block.portal.trigger ambient @s ~ ~ ~ 0.5
effect give @s minecraft:nausea 8 255 true

