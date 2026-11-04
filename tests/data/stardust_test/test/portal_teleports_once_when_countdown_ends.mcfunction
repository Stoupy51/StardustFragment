# @template stardust_test:room
# @environment stardust_test:portal_countdown_end
# @dummy ~ ~ ~
# @timeout 300
await score #stardust.loaded load.status matches 1

loot replace entity @s weapon.mainhand loot stardust:i/cavern_portal
item modify entity @s weapon.mainhand {type:"minecraft:set_count",count:2}
dummy @s use block ~2 ~-1 ~2
execute positioned ~2.5 ~.5 ~2.5 run await entity @e[type=item_display,tag=stardust.cavern_portal,distance=..0.5]
execute positioned ~2.5 ~.5 ~2.5 as @n[type=item_display,tag=stardust.cavern_portal,distance=..0.5] run scoreboard players operation @s energy.storage = @s energy.max_storage
tp @s ~2.5 ~1 ~2.5
execute positioned ~2.5 ~.5 ~2.5 as @n[type=item_display,tag=stardust.cavern_portal,distance=..0.5] at @s run function stardust:custom_blocks/cavern_portal/second

# Skips the five seconds: the countdown ends on the second the portal ticks next
scoreboard players operation @s stardust.teleportation = #global_second stardust.data
execute positioned ~2.5 ~.5 ~2.5 as @n[type=item_display,tag=stardust.cavern_portal,distance=..0.5] at @s run function stardust:custom_blocks/cavern_portal/second
assert score @s stardust.teleported matches 1

# A player still standing on the portal after the trip is pushed one second ahead each time, never teleported again
scoreboard players operation #seconds_ahead stardust_test.data = @s stardust.teleportation
execute positioned ~2.5 ~.5 ~2.5 as @n[type=item_display,tag=stardust.cavern_portal,distance=..0.5] at @s run function stardust:custom_blocks/cavern_portal/second
scoreboard players operation #seconds_ahead stardust_test.data -= @s stardust.teleportation
assert score #seconds_ahead stardust_test.data matches -1
