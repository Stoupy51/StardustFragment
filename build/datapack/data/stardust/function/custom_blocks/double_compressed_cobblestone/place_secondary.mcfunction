
#> stardust:custom_blocks/double_compressed_cobblestone/place_secondary
#
# @within	stardust:custom_blocks/double_compressed_cobblestone/place_main
#

# Add convention and utils tags, and the custom block tag
tag @s add global.ignore
tag @s add global.ignore.kill
tag @s add smithed.entity
tag @s add smithed.block
tag @s add stardust.custom_block
tag @s add stardust.double_compressed_cobblestone
tag @s add stardust.vanilla.minecraft_cobblestone

# Add a custom name
data merge entity @s {"CustomName": "Double Compressed Cobblestone"}

# Modify item display entity to match the custom block
item replace entity @s container.0 with minecraft:furnace[item_model="stardust:double_compressed_cobblestone"]
data modify entity @s transformation.scale set value [1.002f,1.002f,1.002f]
data modify entity @s brightness set value {block:15,sky:15}

