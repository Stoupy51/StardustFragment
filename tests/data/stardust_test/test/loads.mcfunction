# @template stardust_test:room
# @environment stardust_test:loaded
# @dummy ~ ~ ~
# @timeout 200
await score #stardust.loaded load.status matches 1
assert score #game_version stardust.data matches 5023..
