
#> stardust:utils/home_travel_staff/right_click
#
# @executed	as the player & at current position
#
# @within	stardust:advancements/right_click
#

# Stop if already clicked recently
execute if score @s stardust.travel_staff_cooldown > #global_tick stardust.data run return fail

# Mainhand or offhand?
data modify storage stardust:temp slot set value "weapon.mainhand"
execute unless items entity @s weapon.mainhand *[custom_data~{stardust:{home_travel_staff:true}}] run data modify storage stardust:temp slot set value "weapon.offhand"

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
data modify storage stardust:temp amount set value 1
data modify storage stardust:temp max_damage set value 64
data modify storage stardust:temp item_model set value "stardust:home_travel_staff"
function stardust:utils/use_durability/main with storage stardust:temp

# Feedback
playsound minecraft:block.portal.trigger ambient @s ~ ~ ~ 0.5
effect give @s minecraft:nausea 8 255 true

