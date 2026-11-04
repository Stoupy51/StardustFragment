# @template stardust_test:room
# @environment stardust_test:loaded
# @dummy ~ ~ ~
# @timeout 200
await score #stardust.loaded load.status matches 1

loot replace entity @s hotbar.0 loot stardust:i/stardust_ore
assert items entity @s hotbar.0 *[minecraft:custom_data~{stardust:{stardust_ore:true}}]
loot replace entity @s hotbar.1 loot stardust:i/stardust_frame
assert items entity @s hotbar.1 *[minecraft:custom_data~{stardust:{stardust_frame:true}}]
loot replace entity @s hotbar.2 loot stardust:i/stardust_battery
assert items entity @s hotbar.2 *[minecraft:custom_data~{stardust:{stardust_battery:true}}]
loot replace entity @s hotbar.3 loot stardust:i/stardust_bow
assert items entity @s hotbar.3 *[minecraft:custom_data~{stardust:{stardust_bow:true}}]
loot replace entity @s hotbar.4 loot stardust:i/stardust_sniper
assert items entity @s hotbar.4 *[minecraft:custom_data~{stardust:{stardust_sniper:true}}]
loot replace entity @s hotbar.5 loot stardust:i/quarry_lv1
assert items entity @s hotbar.5 *[minecraft:custom_data~{stardust:{quarry_lv1:true}}]
loot replace entity @s hotbar.6 loot stardust:i/cobblestone_miner_lv1
assert items entity @s hotbar.6 *[minecraft:custom_data~{stardust:{cobblestone_miner_lv1:true}}]
loot replace entity @s hotbar.7 loot stardust:i/awakened_stardust_ore
assert items entity @s hotbar.7 *[minecraft:custom_data~{stardust:{awakened_stardust_ore:true}}]
loot replace entity @s hotbar.8 loot stardust:i/ultimate_frame
assert items entity @s hotbar.8 *[minecraft:custom_data~{stardust:{ultimate_frame:true}}]
