# @template stardust_test:room
# @environment stardust_test:loaded
# @dummy ~ ~ ~
# @timeout 200
await score #stardust.loaded load.status matches 1

assert not biome ~ ~ ~ stardust:cosmic
assert not biome ~ ~ ~ stardust:bloodbath
assert not biome ~ ~ ~ stardust:emptiness
assert not biome ~ ~ ~ stardust:the_underground
