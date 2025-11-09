
#> stardust:custom_blocks/quarry_lv2/place_secondary
#
# @executed	at @s
#
# @within	stardust:custom_blocks/quarry_lv2/place_main [ at @s ]
#

# Add convention and utils tags, and the custom block tag
tag @s add global.ignore
tag @s add global.ignore.kill
tag @s add smithed.entity
tag @s add smithed.block
tag @s add stardust.custom_block
tag @s add stardust.quarry_lv2
tag @s add stardust.vanilla.minecraft_barrel

# Add a custom name
data merge entity @s {"CustomName": {"translate": "stardust.quarry_lv_2","italic": false}}

# Modify item display entity to match the custom block
item replace entity @s contents with minecraft:furnace[item_model="stardust:quarry_lv2"]
data modify entity @s transformation.scale set value [1.002f,1.002f,1.002f]
data modify entity @s brightness set value {block:15,sky:15}

# Energy part
tag @s add energy.receive
scoreboard players set @s stardust.energy_rate 250
scoreboard players set @s energy.max_storage 60000
scoreboard players operation @s energy.transfer_rate = @s energy.max_storage
scoreboard players add @s energy.storage 0
scoreboard players add @s energy.change_rate 0
function energy:v1/api/init_machine

# ItemIO compatibility
tag @s add itemio.container
tag @s add itemio.container.hopper
data modify entity @s item.components."minecraft:custom_data".itemio.ioconfig set value []
data modify entity @s item.components."minecraft:custom_data".itemio.ioconfig append value {"Slot":0,"mode":"both","allowed_side":{"north":true,"south":true,"east":true,"west":true,"top":true,"bottom":true}}
data modify entity @s item.components."minecraft:custom_data".itemio.ioconfig append value {"Slot":1,"mode":"both","allowed_side":{"north":true,"south":true,"east":true,"west":true,"top":true,"bottom":true}}
data modify entity @s item.components."minecraft:custom_data".itemio.ioconfig append value {"Slot":2,"mode":"both","allowed_side":{"north":true,"south":true,"east":true,"west":true,"top":true,"bottom":true}}
data modify entity @s item.components."minecraft:custom_data".itemio.ioconfig append value {"Slot":3,"mode":"both","allowed_side":{"north":true,"south":true,"east":true,"west":true,"top":true,"bottom":true}}
data modify entity @s item.components."minecraft:custom_data".itemio.ioconfig append value {"Slot":4,"mode":"both","allowed_side":{"north":true,"south":true,"east":true,"west":true,"top":true,"bottom":true}}
data modify entity @s item.components."minecraft:custom_data".itemio.ioconfig append value {"Slot":5,"mode":"both","allowed_side":{"north":true,"south":true,"east":true,"west":true,"top":true,"bottom":true}}
data modify entity @s item.components."minecraft:custom_data".itemio.ioconfig append value {"Slot":6,"mode":"both","allowed_side":{"north":true,"south":true,"east":true,"west":true,"top":true,"bottom":true}}
data modify entity @s item.components."minecraft:custom_data".itemio.ioconfig append value {"Slot":7,"mode":"both","allowed_side":{"north":true,"south":true,"east":true,"west":true,"top":true,"bottom":true}}
data modify entity @s item.components."minecraft:custom_data".itemio.ioconfig append value {"Slot":8,"mode":"both","allowed_side":{"north":true,"south":true,"east":true,"west":true,"top":true,"bottom":true}}
function #itemio:calls/container/init

# Set quarry speed, and default coordinates
scoreboard players set @s stardust.quarry_speed 3
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

