# @template stardust_test:room
# @environment stardust_test:magnet
# @dummy ~ ~ ~
# @timeout 300
await score #stardust.loaded load.status matches 1

loot replace entity @s weapon.offhand loot stardust:i/item_magnet
await entity @s[tag=stardust.has_item_magnet]
assert score #has_item_magnet stardust.data matches 1..

item replace entity @s weapon.offhand with minecraft:air
await entity @s[tag=!stardust.has_item_magnet]