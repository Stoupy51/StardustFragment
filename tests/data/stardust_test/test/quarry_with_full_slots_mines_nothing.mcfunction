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

execute positioned ~4.5 ~.5 ~4.5 as @n[type=item_display,tag=stardust.quarry_lv1,distance=..0.5] at @s run function stardust:custom_blocks/quarry_lv1/second
item replace block ~4 ~ ~4 container.0 with minecraft:dirt 64
item replace block ~4 ~ ~4 container.1 with minecraft:dirt 64
item replace block ~4 ~ ~4 container.2 with minecraft:dirt 64
item replace block ~4 ~ ~4 container.3 with minecraft:dirt 64
item replace block ~4 ~ ~4 container.4 with minecraft:dirt 64
item replace block ~4 ~ ~4 container.5 with minecraft:dirt 64
item replace block ~4 ~ ~4 container.6 with minecraft:dirt 64
item replace block ~4 ~ ~4 container.7 with minecraft:dirt 64
item replace block ~4 ~ ~4 container.8 with minecraft:dirt 64
setblock ~4 ~3 ~4 minecraft:stone
execute positioned ~4.5 ~.5 ~4.5 as @n[type=item_display,tag=stardust.quarry_lv1,distance=..0.5] run function stardust:quarry/start
execute positioned ~4.5 ~.5 ~4.5 as @n[type=item_display,tag=stardust.quarry_lv1,distance=..0.5] run scoreboard players set @s energy.storage 125
execute positioned ~4.5 ~.5 ~4.5 as @n[type=item_display,tag=stardust.quarry_lv1,distance=..0.5] at @s run function stardust:custom_blocks/quarry_lv1/second

assert block ~4 ~3 ~4 minecraft:stone
execute positioned ~4.5 ~.5 ~4.5 run assert entity @e[type=item_display,tag=stardust.quarry_lv1,distance=..0.5,scores={energy.storage=125}]
