# @template stardust_test:room_large
# @environment stardust_test:cavern_arrival
# @dummy ~ ~ ~
# @timeout 200
await score #stardust.loaded load.status matches 1

# Ward 26.3 has no level for the datapack dimensions, so the arrival is built where the test stands
execute positioned ~4.5 ~4 ~4.5 run function stardust:custom_blocks/cavern_portal/create_teleporter

execute positioned ~4.5 ~5 ~4.5 run assert entity @s[distance=..0.1]
assert block ~4 ~3 ~4 minecraft:cobbled_deepslate
execute positioned ~4.5 ~3.5 ~4.5 run assert entity @e[type=item_display,tag=stardust.cavern_portal,tag=stardust.infinite_energy,distance=..0.5]
assert block ~4 ~2 ~4 minecraft:cobblestone
assert block ~1 ~4 ~4 minecraft:cobblestone
assert block ~4 ~4 ~4 minecraft:air
assert block ~3 ~3 ~3 minecraft:torch
assert not score #infinite_energy stardust.data matches 1
