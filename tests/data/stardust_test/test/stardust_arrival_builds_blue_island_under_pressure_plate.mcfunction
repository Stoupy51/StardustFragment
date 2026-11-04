# @template stardust_test:room_large
# @environment stardust_test:stardust_arrival
# @dummy ~ ~ ~
# @timeout 200
await score #stardust.loaded load.status matches 1

# Ward 26.3 has no level for the datapack dimensions, so the arrival is built where the test stands
execute positioned ~4.5 ~4 ~4.5 run function stardust:custom_blocks/stardust_portal/create_teleporter

execute positioned ~4.5 ~5 ~4.5 run assert entity @s[distance=..0.1]
assert block ~4 ~3 ~4 minecraft:lapis_block
execute positioned ~4.5 ~3.5 ~4.5 run assert entity @e[type=item_display,tag=stardust.stardust_portal,tag=stardust.infinite_energy,distance=..0.5]
assert block ~4 ~4 ~4 minecraft:light_weighted_pressure_plate
assert block ~1 ~3 ~4 minecraft:blue_concrete
assert block ~1 ~3 ~1 minecraft:air
assert block ~4 ~ ~4 minecraft:glowstone
