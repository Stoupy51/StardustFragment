# @template stardust_test:room
# @environment stardust_test:loaded
# @dummy ~ ~ ~
# @timeout 200
await score #stardust.loaded load.status matches 1

loot spawn ~2 ~ ~2 loot stardust:entities/stardust_bat
await entity @e[type=item,distance=..3]
