
#> stardust:custom_blocks/awakened_furnace_generator/place_secondary
#
# @executed	at @s
#
# @within	stardust:custom_blocks/awakened_furnace_generator/place_main [ at @s ]
#

# Add convention and utils tags, and the custom block tag
tag @s add global.ignore
tag @s add global.ignore.kill
tag @s add smithed.entity
tag @s add smithed.block
tag @s add stardust.custom_block
tag @s add stardust.awakened_furnace_generator
tag @s add stardust.vanilla.minecraft_barrel

# Add a custom name
data merge entity @s {"CustomName": {"translate": "stardust.awakened_furnace_generator","italic": false,"color": "white"}}

# Modify item display entity to match the custom block
item replace entity @s contents with minecraft:furnace[item_model="stardust:awakened_furnace_generator"]
data modify entity @s transformation.scale set value [1.002f,1.002f,1.002f]
data modify entity @s brightness set value {block:15,sky:15}

# Energy part
tag @s add energy.send
scoreboard players set @s energy.max_storage 1600
scoreboard players operation @s energy.transfer_rate = @s energy.max_storage
scoreboard players add @s energy.storage 0
scoreboard players add @s energy.change_rate 0
function energy:v1/api/init_machine

