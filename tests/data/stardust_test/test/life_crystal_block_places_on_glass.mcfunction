# @template stardust_test:room
# @environment stardust_test:loaded
# @dummy ~ ~ ~
# @timeout 300
await score #stardust.loaded load.status matches 1

loot replace entity @s weapon.mainhand loot stardust:i/life_crystal_block
item modify entity @s weapon.mainhand {type:"minecraft:set_count",count:2}
dummy @s use block ~2 ~-1 ~2
execute positioned ~2.5 ~.5 ~2.5 run await entity @e[type=item_display,tag=stardust.life_crystal_block,distance=..0.5]
assert block ~2 ~ ~2 minecraft:glass
execute positioned ~2.5 ~.5 ~2.5 run assert entity @e[type=item_display,tag=stardust.life_crystal_block,tag=stardust.custom_block,tag=stardust.vanilla.minecraft_glass,distance=..0.5]
