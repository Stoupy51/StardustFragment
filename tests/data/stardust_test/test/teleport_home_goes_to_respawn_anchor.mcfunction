# @template stardust_test:room
# @environment stardust_test:home_respawn_anchor
# @dummy ~ ~ ~
# @timeout 200
await score #stardust.loaded load.status matches 1

setblock ~2 ~ ~2 minecraft:respawn_anchor[charges=1]
spawnpoint @s ~2 ~1 ~2
tp @s ~4.5 ~ ~4.5
function stardust:dimensions/teleport_home

execute positioned ~2.5 ~1.6 ~2.5 run assert entity @s[distance=..0.1]
