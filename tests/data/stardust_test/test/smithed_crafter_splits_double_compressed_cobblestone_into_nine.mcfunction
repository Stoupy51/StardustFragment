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

loot replace block ~2 ~ ~2 container.2 loot stardust:i/double_compressed_cobblestone

await data block ~2 ~ ~2 Items[{Slot:16b,count:9,components:{"minecraft:custom_data":{stardust:{compressed_cobblestone:true}}}}]
