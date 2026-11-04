# @template stardust_test:room_large
# @environment stardust_test:loaded
# @dummy ~ ~ ~
# @timeout 300
await score #stardust.loaded load.status matches 1
# ItemIO loads a few seconds after the world, and until then the quarry keeps nothing it mines
await score #loaded itemio.math matches 1

tp @s ~2.5 ~ ~2.5
loot replace entity @s weapon.mainhand loot stardust:i/quarry_lv1
item modify entity @s weapon.mainhand {type:"minecraft:set_count",count:2}
dummy @s use block ~4 ~-1 ~4
execute positioned ~4.5 ~.5 ~4.5 run await entity @e[type=item_display,tag=stardust.quarry_lv1,distance=..0.5]

execute positioned ~4.5 ~.5 ~4.5 as @n[type=item_display,tag=stardust.quarry_lv1,distance=..0.5] at @s run function stardust:custom_blocks/quarry_lv1/second
loot replace block ~4 ~ ~4 container.24 loot stardust:i/silk_touch_module
setblock ~4 ~3 ~4 minecraft:stone
execute positioned ~4.5 ~.5 ~4.5 as @n[type=item_display,tag=stardust.quarry_lv1,distance=..0.5] run function stardust:quarry/start
execute positioned ~4.5 ~.5 ~4.5 as @n[type=item_display,tag=stardust.quarry_lv1,distance=..0.5] run scoreboard players set @s energy.storage 125
execute positioned ~4.5 ~.5 ~4.5 as @n[type=item_display,tag=stardust.quarry_lv1,distance=..0.5] at @s run function stardust:custom_blocks/quarry_lv1/second

assert block ~4 ~3 ~4 minecraft:air
assert data block ~4 ~ ~4 Items[{Slot:0b,id:"minecraft:stone",count:1}]
assert not items block ~4 ~ ~4 container.* minecraft:cobblestone
