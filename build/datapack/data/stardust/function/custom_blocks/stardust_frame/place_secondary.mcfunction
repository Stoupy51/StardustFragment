
#> stardust:custom_blocks/stardust_frame/place_secondary
#
# @executed	at @s
#
# @within	stardust:custom_blocks/stardust_frame/place_main [ at @s ]
#

# Add convention and utils tags, and the custom block tag
tag @s add global.ignore
tag @s add global.ignore.kill
tag @s add smithed.entity
tag @s add smithed.block
tag @s add stardust.custom_block
tag @s add stardust.stardust_frame
tag @s add stardust.vanilla.minecraft_lapis_block

# Add a custom name
data merge entity @s {"CustomName": {"translate": "stardust_frame"}}

# Modify item display entity to match the custom block
item replace entity @s contents with minecraft:furnace[item_model="stardust:stardust_frame"]
data modify entity @s transformation.scale set value [1.002f,1.002f,1.002f]
data modify entity @s brightness set value {block:15,sky:15}

