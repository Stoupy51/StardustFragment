# @template stardust_test:room
# @environment stardust_test:magnet
# @dummy ~ ~ ~
# @timeout 300
await score #stardust.loaded load.status matches 1

tp @s ~1.5 ~ ~1.5
summon minecraft:item ~3.5 ~1 ~3.5 {Item:{id:"minecraft:stone"},PickupDelay:32767s,NoGravity:1b,Tags:["stardust_test.pulled"]}
loot replace entity @s weapon.offhand loot stardust:i/item_magnet
await entity @s[tag=stardust.has_item_magnet]
execute at @s run await entity @e[type=item,tag=stardust_test.pulled,distance=..0.5]