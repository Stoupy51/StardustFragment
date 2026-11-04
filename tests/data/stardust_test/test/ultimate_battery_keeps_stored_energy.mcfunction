# @template stardust_test:room
# @environment stardust_test:loaded
# @dummy ~ ~ ~
# @timeout 300
await score #stardust.loaded load.status matches 1

loot replace entity @s weapon.mainhand loot stardust:i/ultimate_battery
item modify entity @s weapon.mainhand {type:"minecraft:set_count",count:2}
item modify entity @s weapon.mainhand {type:"minecraft:set_custom_data",tag:{energy:{storage:5000000}}}
dummy @s use block ~2 ~-1 ~2
execute positioned ~2.5 ~.5 ~2.5 run await entity @e[type=item_display,tag=stardust.ultimate_battery,distance=..0.5]
execute positioned ~2.5 ~.5 ~2.5 run assert entity @e[type=item_display,tag=stardust.ultimate_battery,distance=..0.5,scores={energy.storage=5000000,energy.max_storage=10000000}]
