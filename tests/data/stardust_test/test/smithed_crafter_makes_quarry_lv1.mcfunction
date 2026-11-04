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

item replace block ~2 ~ ~2 container.2 with minecraft:barrel
item replace block ~2 ~ ~2 container.3 with minecraft:crafter
item replace block ~2 ~ ~2 container.4 with minecraft:barrel
item replace block ~2 ~ ~2 container.11 with minecraft:observer
item replace block ~2 ~ ~2 container.12 with minecraft:amethyst_shard
item replace block ~2 ~ ~2 container.13 with minecraft:observer
item replace block ~2 ~ ~2 container.20 with minecraft:diamond_pickaxe
item replace block ~2 ~ ~2 container.21 with minecraft:diamond_axe
item replace block ~2 ~ ~2 container.22 with minecraft:diamond_shovel

await items block ~2 ~ ~2 container.16 *[minecraft:custom_data~{stardust:{quarry_lv1:true}}]
