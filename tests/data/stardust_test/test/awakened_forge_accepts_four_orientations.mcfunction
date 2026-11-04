# @template stardust_test:room_large
# @environment stardust_test:loaded
# @dummy ~ ~ ~
# @timeout 300
await score #stardust.loaded load.status matches 1

# Each rotation is placed so that its center glass stays at ~4 ~1 ~4
place template stardust:awakened_forge ~2 ~ ~2
execute store success score #none stardust_test.data positioned ~4.5 ~2 ~4.5 run function stardust:forge/verify_structure
place template stardust:awakened_forge ~6 ~ ~2 clockwise_90
execute store success score #clockwise_90 stardust_test.data positioned ~4.5 ~2 ~4.5 run function stardust:forge/verify_structure
place template stardust:awakened_forge ~6 ~ ~6 180
execute store success score #180 stardust_test.data positioned ~4.5 ~2 ~4.5 run function stardust:forge/verify_structure
place template stardust:awakened_forge ~2 ~ ~6 counterclockwise_90
execute store success score #counterclockwise_90 stardust_test.data positioned ~4.5 ~2 ~4.5 run function stardust:forge/verify_structure

assert score #none stardust_test.data matches 1
assert score #clockwise_90 stardust_test.data matches 1
assert score #180 stardust_test.data matches 1
assert score #counterclockwise_90 stardust_test.data matches 1
