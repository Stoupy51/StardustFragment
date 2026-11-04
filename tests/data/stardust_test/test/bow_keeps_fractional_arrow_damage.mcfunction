# @template stardust_test:room
# @environment stardust_test:loaded
# @dummy ~ ~ ~
# @timeout 300
await score #stardust.loaded load.status matches 1

# A Power I arrow deals 3.5 before the bow multiplier
loot replace entity @s weapon.mainhand loot stardust:i/stardust_bow
summon minecraft:arrow ~2.5 ~2 ~2.5 {NoGravity:1b,damage:3.5d}
execute positioned ~2.5 ~2 ~2.5 run data modify entity @n[type=arrow,distance=..0.5] weapon set from entity @s SelectedItem
execute positioned ~2.5 ~2 ~2.5 run function stardust:advancements/bow_shoot
execute positioned ~2.5 ~2 ~2.5 run assert entity @e[type=arrow,distance=..0.5,nbt={damage:7.0d}]