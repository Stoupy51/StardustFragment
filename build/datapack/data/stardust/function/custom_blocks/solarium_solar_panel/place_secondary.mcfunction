
#> stardust:custom_blocks/solarium_solar_panel/place_secondary
#
# @executed	at @s
#
# @within	stardust:custom_blocks/solarium_solar_panel/place_main [ at @s ]
#

# Add convention and utils tags, and the custom block tag
tag @s add global.ignore
tag @s add global.ignore.kill
tag @s add smithed.entity
tag @s add smithed.block
tag @s add stardust.custom_block
tag @s add stardust.solarium_solar_panel
tag @s add stardust.vanilla.minecraft_daylight_detector

# Add a custom name
data merge entity @s {"CustomName": {"translate": "stardust.solarium_solar_panel"}}

# Modify item display entity to match the custom block
item replace entity @s contents with minecraft:furnace[item_model="stardust:solarium_solar_panel"]
data modify entity @s transformation.scale set value [1.002f,1.002f,1.002f]
data modify entity @s brightness set value {block:15,sky:15}

# Energy part
tag @s add energy.send
scoreboard players set @s stardust.energy_rate 32
scoreboard players set @s energy.max_storage 4800
scoreboard players operation @s energy.transfer_rate = @s energy.max_storage
scoreboard players add @s energy.storage 0
scoreboard players add @s energy.change_rate 0
function energy:v1/api/init_machine

# Fix scale
data modify entity @s transformation.scale[1] set value 1.005f
data modify entity @s transformation.translation[1] set value 0.002f

# Add balancing tag
tag @s add stardust.can_balance

# Add tag for loop every second
tag @s add stardust.second
scoreboard players add #second_entities stardust.data 1

