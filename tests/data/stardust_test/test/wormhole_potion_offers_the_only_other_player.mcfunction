# @template stardust_test:room
# @environment stardust_test:two_players
# @dummy ~ ~ ~
# @timeout 300
await score #stardust.loaded load.status matches 1

# The loader dummy is the only other player of this batch
loot replace entity @s weapon.mainhand loot stardust:i/wormhole_potion
execute at @s run function stardust:utils/wormhole_potion/right_click
assert not chat "No other players are currently connected" @s