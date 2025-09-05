
#> stardust:custom_blocks/awakened_stardust_battery/place_secondary
#
# @executed	at @s
#
# @within	stardust:custom_blocks/awakened_stardust_battery/place_main [ at @s ]
#

# Add convention and utils tags, and the custom block tag
tag @s add global.ignore
tag @s add global.ignore.kill
tag @s add smithed.entity
tag @s add smithed.block
tag @s add stardust.custom_block
tag @s add stardust.awakened_stardust_battery
tag @s add stardust.vanilla.minecraft_crimson_hyphae

# Add a custom name
data merge entity @s {"CustomName": {"translate": "stardust.awakened_stardust_battery"}}

# Modify item display entity to match the custom block
item replace entity @s contents with minecraft:furnace[item_model="stardust:awakened_stardust_battery"]
data modify entity @s transformation.scale set value [1.002f,1.002f,1.002f]
data modify entity @s brightness set value {block:15,sky:15}

# Energy part
tag @s add stardust.battery_switcher
tag @s add energy.receive
tag @s add energy.send
data modify storage stardust:temp energy set from entity @p[tag=stardust.placer] SelectedItem.components."minecraft:custom_data".energy
execute store result score @s energy.max_storage run data get storage stardust:temp energy.max_storage
execute store result score @s energy.storage run data get storage stardust:temp energy.storage
scoreboard players operation @s energy.transfer_rate = @s energy.max_storage
function energy:v1/api/init_machine

# Add balancing tag
tag @s add stardust.can_balance

