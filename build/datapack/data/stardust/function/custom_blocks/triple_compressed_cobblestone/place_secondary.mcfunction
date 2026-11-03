
#> stardust:custom_blocks/triple_compressed_cobblestone/place_secondary
#
# @executed	at @s
#
# @within	stardust:custom_blocks/triple_compressed_cobblestone/place_main [ at @s ]
#

# Add convention and utils tags, and the custom block tag
tag @s add global.ignore
tag @s add global.ignore.kill
tag @s add smithed.entity
tag @s add smithed.block
tag @s add stardust.custom_block
tag @s add stardust.triple_compressed_cobblestone
tag @s add stardust.vanilla.minecraft_cobbled_deepslate

# Add a custom name
data merge entity @s {"CustomName": {"translate": "stardust.triple_compressed_cobblestone","fallback": "Triple Compressed Cobblestone"}}

# Modify item display entity to match the custom block
item replace entity @s contents with minecraft:furnace[item_model="stardust:triple_compressed_cobblestone"]
function stardust:custom_blocks/compute_brightness

