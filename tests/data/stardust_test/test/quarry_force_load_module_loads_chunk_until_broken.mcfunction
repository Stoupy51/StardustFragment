# @template stardust_test:room_large
# @environment stardust_test:loaded
# @dummy ~ ~ ~
# @timeout 300
await score #stardust.loaded load.status matches 1

tp @s ~2.5 ~ ~2.5
loot replace entity @s weapon.mainhand loot stardust:i/quarry_lv1
item modify entity @s weapon.mainhand {type:"minecraft:set_count",count:2}
dummy @s use block ~4 ~-1 ~4
execute positioned ~4.5 ~.5 ~4.5 run await entity @e[type=item_display,tag=stardust.quarry_lv1,distance=..0.5]

loot replace block ~4 ~ ~4 container.23 loot stardust:i/force_load_module
execute positioned ~4.5 ~.5 ~4.5 as @n[type=item_display,tag=stardust.quarry_lv1,distance=..0.5] at @s run function stardust:custom_blocks/quarry_lv1/second

execute store success score #quarry_forceloaded stardust_test.data run forceload query ~4 ~4
assert score #quarry_forceloaded stardust_test.data matches 1

setblock ~4 ~ ~4 minecraft:air destroy
execute positioned ~4.5 ~.5 ~4.5 run await not entity @e[type=item_display,tag=stardust.quarry_lv1,distance=..0.5]
execute store success score #quarry_forceloaded stardust_test.data run forceload query ~4 ~4
assert score #quarry_forceloaded stardust_test.data matches 0
