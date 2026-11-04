# @template stardust_test:room
# @environment stardust_test:loaded
# @dummy ~ ~ ~
# @timeout 300
await score #stardust.loaded load.status matches 1

tp @s ~2.5 ~ ~1.5 0 20
loot replace entity @s weapon.mainhand loot stardust:i/quarry_lv1
item modify entity @s weapon.mainhand {type:"minecraft:set_count",count:2}
dummy @s use block ~2 ~-1 ~4
execute positioned ~2.5 ~.5 ~4.5 run await entity @e[type=item_display,tag=stardust.quarry_lv1,distance=..0.5]

loot replace entity @s weapon.mainhand loot stardust:i/quarry_configurator
item modify entity @s weapon.mainhand {type:"minecraft:set_custom_data",tag:{stardust:{quarry_x1:10,quarry_y1:-20,quarry_z1:30,quarry_x2:15,quarry_y2:-25,quarry_z2:35}}}
execute at @s run function stardust:advancements/right_click

execute positioned ~2.5 ~.5 ~4.5 run assert entity @e[type=item_display,tag=stardust.quarry_lv1,distance=..0.5,scores={stardust.quarry_x1=10,stardust.quarry_y1=-20,stardust.quarry_z1=30,stardust.quarry_x2=15,stardust.quarry_y2=-25,stardust.quarry_z2=35}]
