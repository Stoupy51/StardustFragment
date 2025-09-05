
#> stardust:custom_blocks/awakened_stardust_cable/place_secondary
#
# @executed	at @s
#
# @within	stardust:custom_blocks/awakened_stardust_cable/place_main [ at @s ]
#

# Add convention and utils tags, and the custom block tag
tag @s add global.ignore
tag @s add global.ignore.kill
tag @s add smithed.entity
tag @s add smithed.block
tag @s add stardust.custom_block
tag @s add stardust.awakened_stardust_cable
tag @s add stardust.vanilla.minecraft_player_head

# Add a custom name
data merge entity @s {"CustomName": {"translate": "stardust.awakened_stardust_cable"}}

# Modify item display entity to match the custom block
data modify entity @s transformation.scale set value [1.002f,1.002f,1.002f]
data modify entity @s brightness set value {block:15,sky:15}

