# @template stardust_test:room
# @environment stardust_test:loaded
# @dummy ~ ~ ~
# @timeout 300
await score #stardust.loaded load.status matches 1

loot replace entity @s weapon.mainhand loot stardust:i/stardust_furnace_generator
item modify entity @s weapon.mainhand {type:"minecraft:set_count",count:2}
dummy @s use block ~1 ~-1 ~2
loot replace entity @s weapon.mainhand loot stardust:i/stardust_cable
item modify entity @s weapon.mainhand {type:"minecraft:set_count",count:2}
dummy @s use block ~2 ~-1 ~2
loot replace entity @s weapon.mainhand loot stardust:i/stardust_battery
item modify entity @s weapon.mainhand {type:"minecraft:set_count",count:2}
dummy @s use block ~3 ~-1 ~2
execute positioned ~1.5 ~.5 ~2.5 run await entity @e[type=item_display,tag=stardust.stardust_furnace_generator,distance=..0.5]
execute positioned ~2.5 ~.5 ~2.5 run await entity @e[type=item_display,tag=stardust.stardust_cable,distance=..0.5]
execute positioned ~3.5 ~.5 ~2.5 run await entity @e[type=item_display,tag=stardust.stardust_battery,distance=..0.5]
execute positioned ~1.5 ~.5 ~2.5 run scoreboard players set @n[type=item_display,tag=stardust.stardust_furnace_generator,distance=..0.5] energy.storage 1600
execute positioned ~3.5 ~.5 ~2.5 run await entity @e[type=item_display,tag=stardust.stardust_battery,distance=..0.5,scores={energy.storage=1..}]
