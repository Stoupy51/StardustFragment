# @template stardust_test:room
# @environment stardust_test:loaded
# @dummy ~ ~ ~
# @timeout 300
await score #stardust.loaded load.status matches 1

loot replace entity @s weapon.mainhand loot stardust:i/wormhole_potion

# Every other player online counts, the loader dummy and those of parallel tests: the tag hides them for one command
tag @a[distance=0..] add stardust.temp
execute at @s run function stardust:utils/wormhole_potion/right_click
tag @a[distance=0..] remove stardust.temp

assert chat "No other players are currently connected" @s