
#> stardust:custom_blocks/quarry_lv1/place_secondary
#
# @executed	at @s
#
# @within	stardust:custom_blocks/quarry_lv1/place_main [ at @s ]
#

# Add convention and utils tags, and the custom block tag
tag @s add global.ignore
tag @s add global.ignore.kill
tag @s add smithed.entity
tag @s add smithed.block
tag @s add stardust.custom_block
tag @s add stardust.quarry_lv1
tag @s add stardust.vanilla.minecraft_barrel

# Add a custom name
data merge entity @s {"CustomName": {"translate": "stardust.quarry_lv_1","italic": false}}

# Modify item display entity to match the custom block
item replace entity @s contents with minecraft:furnace[item_model="stardust:quarry_lv1"]
data modify entity @s transformation.scale set value [1.002f,1.002f,1.002f]
data modify entity @s brightness set value {block:15,sky:15}

# Energy part
tag @s add energy.receive
scoreboard players set @s energy.max_storage 20000
scoreboard players operation @s energy.transfer_rate = @s energy.max_storage
scoreboard players add @s energy.storage 0
scoreboard players add @s energy.change_rate 0
function energy:v1/api/init_machine

# Set quarry speed, and default coordinates
scoreboard players set @s stardust.quarry_speed 1
execute store result score @s stardust.quarry_x1 run data get entity @s Pos[0]
execute store result score @s stardust.quarry_y1 run data get entity @s Pos[1]
execute store result score @s stardust.quarry_z1 run data get entity @s Pos[2]
execute store result score @s stardust.quarry_x2 run data get entity @s Pos[0]
execute store result score @s stardust.quarry_y2 run data get entity @s Pos[1]
execute store result score @s stardust.quarry_z2 run data get entity @s Pos[2]
scoreboard players add @s stardust.quarry_y1 3
scoreboard players add @s stardust.quarry_y2 6
tag @s add stardust.quarry

# Add tag for loop every second
tag @s add stardust.second
scoreboard players add #second_entities stardust.data 1

