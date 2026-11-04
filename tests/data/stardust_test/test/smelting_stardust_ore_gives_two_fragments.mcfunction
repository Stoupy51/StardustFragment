# @template stardust_test:room
# @environment stardust_test:loaded
# @dummy ~ ~ ~
# @timeout 600
await score #stardust.loaded load.status matches 1
await block -30000000 14 1610 minecraft:yellow_shulker_box

setblock ~1 ~-1 ~2 minecraft:gold_block
item replace entity @s weapon.mainhand with minecraft:furnace
dummy @s use block ~1 ~-1 ~2
loot replace entity @s hotbar.8 loot stardust:i/stardust_ore
item replace block ~1 ~ ~2 container.0 from entity @s hotbar.8
item replace block ~1 ~ ~2 container.1 with minecraft:coal

await data block ~1 ~ ~2 Items[{Slot:2b,count:2,components:{"minecraft:custom_data":{stardust:{stardust_fragment:true}}}}]
assert not data block ~1 ~ ~2 Items[{Slot:0b}]
