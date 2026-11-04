# @template stardust_test:room
# @environment stardust_test:loaded
# @dummy ~ ~ ~
# @timeout 300
await score #stardust.loaded load.status matches 1

setblock ~2 ~ ~2 minecraft:stone
loot replace entity @s weapon.mainhand loot stardust:i/cobblestone_miner_lv1
item modify entity @s weapon.mainhand {type:"minecraft:set_count",count:2}
dummy @s use block ~2 ~ ~2 up
execute positioned ~2.5 ~1.5 ~2.5 run await entity @e[type=item_display,tag=stardust.cobblestone_miner_lv1,distance=..0.5]
execute positioned ~2.5 ~1.5 ~2.5 as @n[type=item_display,tag=stardust.cobblestone_miner_lv1,distance=..0.5] at @s run function stardust:custom_blocks/cobblestone_miner_lv1/minute
assert block ~2 ~ ~2 minecraft:stone
execute positioned ~2.5 ~.5 ~2.5 run assert not entity @e[type=item,distance=..1.5]
