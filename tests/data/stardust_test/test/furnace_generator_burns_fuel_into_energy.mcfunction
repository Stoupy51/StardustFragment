# @template stardust_test:room
# @environment stardust_test:loaded
# @dummy ~ ~ ~
# @timeout 300
await score #stardust.loaded load.status matches 1

loot replace entity @s weapon.mainhand loot stardust:i/stardust_furnace_generator
item modify entity @s weapon.mainhand {type:"minecraft:set_count",count:2}
dummy @s use block ~2 ~-1 ~2
execute positioned ~2.5 ~.5 ~2.5 run await entity @e[type=item_display,tag=stardust.stardust_furnace_generator,distance=..0.5]
item replace block ~2 ~ ~2 container.1 with minecraft:coal 4
execute positioned ~2.5 ~.5 ~2.5 run await entity @e[type=item_display,tag=stardust.stardust_furnace_generator,distance=..0.5,scores={energy.storage=1..}]
