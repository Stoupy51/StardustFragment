
#> stardust:custom_blocks/celestial_portal/place_secondary
#
# @executed	at @s
#
# @within	stardust:custom_blocks/celestial_portal/place_main [ at @s ]
#

# Add convention and utils tags, and the custom block tag
tag @s add global.ignore
tag @s add global.ignore.kill
tag @s add smithed.entity
tag @s add smithed.block
tag @s add stardust.custom_block
tag @s add stardust.celestial_portal
tag @s add stardust.vanilla.minecraft_iron_block

# Add a custom name
data merge entity @s {"CustomName": {"translate": "stardust.celestial_portal","italic": false,"color": "gray"}}

# Modify item display entity to match the custom block
item replace entity @s contents with minecraft:furnace[item_model="stardust:celestial_portal"]
data modify entity @s transformation.scale set value [1.002f,1.002f,1.002f]
data modify entity @s brightness set value {block:15,sky:15}

# Energy part
tag @s add energy.receive
scoreboard players set @s stardust.energy_rate 20
scoreboard players set @s energy.max_storage 800
scoreboard players operation @s energy.transfer_rate = @s energy.max_storage
scoreboard players add @s energy.storage 0
scoreboard players add @s energy.change_rate 0
function energy:v1/api/init_machine

# Make the block have infinite energy if applicable
execute if score #infinite_energy stardust.data matches 1 run tag @s add stardust.infinite_energy
scoreboard players reset #infinite_energy stardust.data

# Add tag for loop every second
tag @s add stardust.second
scoreboard players add #second_entities stardust.data 1

