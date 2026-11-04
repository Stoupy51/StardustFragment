# @template stardust_test:room
# @environment stardust_test:loaded
# @dummy ~ ~ ~
# @timeout 300
await score #stardust.loaded load.status matches 1

setblock ~2 ~ ~4 minecraft:stone
loot replace entity @s weapon.mainhand loot stardust:i/quarry_configurator
tp @s ~2.5 ~ ~1.5 0 20
execute at @s run function stardust:advancements/right_click

# The stone shares the column of the dummy in X, and lies 3 blocks south of it
execute store result score #aimed_x stardust_test.data run data get entity @s SelectedItem.components."minecraft:custom_data".stardust.quarry_x1
execute store result score #aimed_z stardust_test.data run data get entity @s SelectedItem.components."minecraft:custom_data".stardust.quarry_z1
execute store result score #stone_x stardust_test.data run data get entity @s Pos[0]
execute store result score #stone_z stardust_test.data run data get entity @s Pos[2]
scoreboard players add #stone_z stardust_test.data 3

assert score #aimed_x stardust_test.data = #stone_x stardust_test.data
assert score #aimed_z stardust_test.data = #stone_z stardust_test.data
