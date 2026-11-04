# @template stardust_test:room
# @environment stardust_test:loaded
# @dummy ~ ~ ~
# @timeout 300
await score #stardust.loaded load.status matches 1

loot replace entity @s weapon.mainhand loot smithed.crafter:blocks/table
item modify entity @s weapon.mainhand {type:"minecraft:set_count",count:2}
dummy @s use block ~2 ~-1 ~2
await block ~2 ~ ~2 minecraft:barrel
dummy @s use block ~2 ~ ~2
await block ~2 ~ ~2 minecraft:barrel[open=true]

item replace block ~2 ~ ~2 container.2 with minecraft:diamond_block
loot replace block ~2 ~ ~2 container.3 loot stardust:i/stardust_ingot
loot replace block ~2 ~ ~2 container.4 loot stardust:i/stardust_ingot
loot replace block ~2 ~ ~2 container.11 loot stardust:i/stardust_ingot
loot replace block ~2 ~ ~2 container.12 loot stardust:i/stardust_ingot
loot replace block ~2 ~ ~2 container.13 loot stardust:i/stardust_ingot
loot replace block ~2 ~ ~2 container.20 loot stardust:i/stardust_ingot
loot replace block ~2 ~ ~2 container.21 loot stardust:i/stardust_ingot
loot replace block ~2 ~ ~2 container.22 loot stardust:i/stardust_ingot

await items block ~2 ~ ~2 container.16 *[minecraft:custom_data~{stardust:{stardust_block:true}}]
