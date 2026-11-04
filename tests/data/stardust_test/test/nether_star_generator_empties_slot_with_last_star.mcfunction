# @template stardust_test:room
# @environment stardust_test:loaded
# @dummy ~ ~ ~
# @timeout 300
await score #stardust.loaded load.status matches 1

loot replace entity @s weapon.mainhand loot stardust:i/nether_star_generator
item modify entity @s weapon.mainhand {type:"minecraft:set_count",count:2}
dummy @s use block ~2 ~-1 ~2
execute positioned ~2.5 ~.5 ~2.5 run await entity @e[type=item_display,tag=stardust.nether_star_generator,distance=..0.5]

item replace block ~2 ~ ~2 container.0 with minecraft:nether_star 1
data modify block ~2 ~ ~2 lit_time_remaining set value 0s
execute positioned ~2.5 ~.5 ~2.5 as @e[type=item_display,tag=stardust.nether_star_generator,distance=..0.5] at @s run function stardust:custom_blocks/nether_star_generator/second
assert data block ~2 ~ ~2 {lit_time_remaining:18000}
execute if data block ~2 ~ ~2 Items[{Slot:0b}] run fail "the last star stays in its slot"
