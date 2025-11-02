
#> stardust:custom_blocks/cobblestone_miner_lv6/place_secondary
#
# @executed	at @s
#
# @within	stardust:custom_blocks/cobblestone_miner_lv6/place_main [ at @s ]
#

# Add convention and utils tags, and the custom block tag
tag @s add global.ignore
tag @s add global.ignore.kill
tag @s add smithed.entity
tag @s add smithed.block
tag @s add stardust.custom_block
tag @s add stardust.cobblestone_miner_lv6
tag @s add stardust.vanilla.minecraft_deepslate

# Add a custom name
data merge entity @s {"CustomName": {"translate": "stardust.cobblestone_miner_lv_6"}}

# Modify item display entity to match the custom block
item replace entity @s contents with minecraft:furnace[item_model="stardust:cobblestone_miner_lv6"]
data modify entity @s transformation.scale set value [1.002f,1.002f,1.002f]
data modify entity @s brightness set value {block:15,sky:15}

# Add tag for loop every minute
tag @s add stardust.minute
scoreboard players add #minute_entities stardust.data 1

