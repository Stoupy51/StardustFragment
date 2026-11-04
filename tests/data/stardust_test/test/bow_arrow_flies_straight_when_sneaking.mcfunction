# @template stardust_test:room
# @environment stardust_test:loaded
# @dummy ~ ~ ~
# @timeout 300
await score #stardust.loaded load.status matches 1

# Ward's dummy cannot draw a bow, so the arrow a shot spawns is summoned and handed to the shoot handler
loot replace entity @s weapon.mainhand loot stardust:i/stardust_bow
summon minecraft:arrow ~2.5 ~2 ~2.5 {damage:2.0d}
execute positioned ~2.5 ~2 ~2.5 run data modify entity @n[type=arrow,distance=..0.5] weapon set from entity @s SelectedItem
execute positioned ~2.5 ~2 ~2.5 run function stardust:advancements/bow_shoot
execute positioned ~2.5 ~2 ~2.5 run assert not entity @e[type=arrow,distance=..0.5,nbt={NoGravity:1b}]
execute positioned ~2.5 ~2 ~2.5 run kill @e[type=arrow,distance=..0.5]

dummy @s sneak true
await predicate stardust:player/sneaking
summon minecraft:arrow ~2.5 ~2 ~2.5 {damage:2.0d}
execute positioned ~2.5 ~2 ~2.5 run data modify entity @n[type=arrow,distance=..0.5] weapon set from entity @s SelectedItem
execute positioned ~2.5 ~2 ~2.5 run function stardust:advancements/bow_shoot
execute positioned ~2.5 ~2 ~2.5 run assert entity @e[type=arrow,distance=..0.5,nbt={NoGravity:1b}]