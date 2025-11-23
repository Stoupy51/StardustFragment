
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
item modify entity @s weapon {"function": "minecraft:set_damage","damage": -0.015625,"add": true}
execute store result score #current_damage stardust.data run data get entity @s SelectedItem.components."minecraft:damage"
execute if score #current_damage stardust.data matches 64.. anchored eyes run particle item{item:{id:"minecraft:stone",components:{"minecraft:item_model":"stardust:home_travel_staff"}}} ^ ^ ^0.5 0 0 0 0.1 10
execute if score #current_damage stardust.data matches 64.. run playsound minecraft:item.shield.break ambient @a[distance=..16]
execute if score #current_damage stardust.data matches 64.. run item replace entity @s weapon with minecraft:air

# Feedback
playsound minecraft:block.portal.trigger ambient @s ~ ~ ~ 0.5
effect give @s minecraft:nausea 8 255 true

