# @template stardust_test:room_large
# @environment stardust_test:loaded
# @dummy ~ ~ ~
# @padding 16
# @timeout 200
await score #stardust.loaded load.status matches 1

assert result 1 run place template stardust:water_well ~ ~ ~
assert block ~2 ~1 ~2 minecraft:water
assert block ~3 ~4 ~3 minecraft:water
