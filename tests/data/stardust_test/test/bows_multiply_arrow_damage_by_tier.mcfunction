# @template stardust_test:room
# @environment stardust_test:loaded
# @dummy ~ ~ ~
# @timeout 300
await score #stardust.loaded load.status matches 1

# Ward's dummy cannot draw a bow, so the arrow a shot spawns is summoned and handed to the shoot handler
loot replace entity @s weapon.mainhand loot stardust:i/stardust_bow
summon minecraft:arrow ~2.5 ~2 ~2.5 {NoGravity:1b,damage:2.0d,Tags:["stardust_test.x2"]}
execute positioned ~2.5 ~2 ~2.5 run data modify entity @n[type=arrow,distance=..0.5] weapon set from entity @s SelectedItem
execute positioned ~2.5 ~2 ~2.5 run function stardust:advancements/bow_shoot

loot replace entity @s weapon.mainhand loot stardust:i/awakened_stardust_bow
summon minecraft:arrow ~2.5 ~2 ~0.5 {NoGravity:1b,damage:2.0d,Tags:["stardust_test.x3"]}
execute positioned ~2.5 ~2 ~0.5 run data modify entity @n[type=arrow,distance=..0.5] weapon set from entity @s SelectedItem
execute positioned ~2.5 ~2 ~0.5 run function stardust:advancements/bow_shoot

loot replace entity @s weapon.mainhand loot stardust:i/ultimate_bow
summon minecraft:arrow ~0.5 ~2 ~2.5 {NoGravity:1b,damage:2.0d,Tags:["stardust_test.x4"]}
execute positioned ~0.5 ~2 ~2.5 run data modify entity @n[type=arrow,distance=..0.5] weapon set from entity @s SelectedItem
execute positioned ~0.5 ~2 ~2.5 run function stardust:advancements/bow_shoot

execute positioned ~2.5 ~2 ~2.5 run assert entity @e[type=arrow,tag=stardust_test.x2,distance=..0.5,nbt={damage:4.0d}]
execute positioned ~2.5 ~2 ~0.5 run assert entity @e[type=arrow,tag=stardust_test.x3,distance=..0.5,nbt={damage:6.0d}]
execute positioned ~0.5 ~2 ~2.5 run assert entity @e[type=arrow,tag=stardust_test.x4,distance=..0.5,nbt={damage:8.0d}]