# @template stardust_test:room_large
# @environment stardust_test:loaded
# @dummy ~ ~ ~
# @padding 16
# @timeout 200
await score #stardust.loaded load.status matches 1

assert result 1 run place template stardust:flying_saucer ~ ~ ~
assert block ~5 ~1 ~2 minecraft:lapis_block
assert data block ~2 ~1 ~5 {LootTable:"stardust:structures/flying_saucer"}
assert data block ~10 ~1 ~6 {LootTable:"stardust:structures/flying_saucer"}
