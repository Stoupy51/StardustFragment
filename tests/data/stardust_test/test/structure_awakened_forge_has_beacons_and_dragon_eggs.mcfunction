# @template stardust_test:room_large
# @environment stardust_test:loaded
# @dummy ~ ~ ~
# @padding 16
# @timeout 200
await score #stardust.loaded load.status matches 1

assert result 1 run place template stardust:awakened_forge ~ ~ ~
assert block ~2 ~ ~ minecraft:beacon
assert block ~4 ~ ~2 minecraft:beacon
assert block ~1 ~1 ~1 minecraft:dragon_egg
assert block ~3 ~1 ~3 minecraft:dragon_egg
