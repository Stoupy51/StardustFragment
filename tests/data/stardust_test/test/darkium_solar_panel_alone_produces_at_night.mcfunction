# @template stardust_test:room
# @environment stardust_test:night
# @dummy ~ ~ ~
# @timeout 300
await score #stardust.loaded load.status matches 1

loot replace entity @s weapon.mainhand loot stardust:i/stardust_solar_panel
item modify entity @s weapon.mainhand {type:"minecraft:set_count",count:2}
dummy @s use block ~1 ~-1 ~2
loot replace entity @s weapon.mainhand loot stardust:i/darkium_solar_panel
item modify entity @s weapon.mainhand {type:"minecraft:set_count",count:2}
dummy @s use block ~3 ~-1 ~2
execute positioned ~1.5 ~.5 ~2.5 run await entity @e[type=item_display,tag=stardust.stardust_solar_panel,distance=..0.5]
execute positioned ~3.5 ~.5 ~2.5 run await entity @e[type=item_display,tag=stardust.darkium_solar_panel,distance=..0.5]
execute positioned ~1.5 ~.5 ~2.5 run scoreboard players set @n[type=item_display,tag=stardust.stardust_solar_panel,distance=..0.5] energy.storage 0
execute positioned ~3.5 ~.5 ~2.5 run scoreboard players set @n[type=item_display,tag=stardust.darkium_solar_panel,distance=..0.5] energy.storage 0
execute positioned ~1.5 ~.5 ~2.5 as @n[type=item_display,tag=stardust.stardust_solar_panel,distance=..0.5] at @s run function stardust:custom_blocks/stardust_solar_panel/second
execute positioned ~3.5 ~.5 ~2.5 as @n[type=item_display,tag=stardust.darkium_solar_panel,distance=..0.5] at @s run function stardust:custom_blocks/darkium_solar_panel/second
execute positioned ~1.5 ~.5 ~2.5 run assert entity @e[type=item_display,tag=stardust.stardust_solar_panel,distance=..0.5,scores={energy.storage=0}]
execute positioned ~3.5 ~.5 ~2.5 run assert entity @e[type=item_display,tag=stardust.darkium_solar_panel,distance=..0.5,scores={energy.storage=32}]
