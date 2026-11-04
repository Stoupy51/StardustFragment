# @template stardust_test:room
# @environment stardust_test:portal_countdown
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

scoreboard players operation #seconds_left stardust_test.data = @s stardust.teleportation
scoreboard players operation #seconds_left stardust_test.data -= #global_second stardust.data
assert score #seconds_left stardust_test.data matches 5
assert data entity @s active_effects[{id:"minecraft:nausea"}]
assert not score @s stardust.teleported matches 1
