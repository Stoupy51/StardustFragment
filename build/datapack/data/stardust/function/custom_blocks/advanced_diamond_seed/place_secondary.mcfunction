
#> stardust:custom_blocks/advanced_diamond_seed/place_secondary
#
# @executed	as @n[tag=stardust.new] & at @s
#
# @within	stardust:custom_blocks/advanced_diamond_seed/place_main [ as @n[tag=stardust.new] & at @s ]
#

# Add convention and utils tags, and the custom block tag
tag @s remove stardust.new
tag @s add global.ignore
tag @s add global.ignore.kill
tag @s add smithed.entity
tag @s add smithed.block
tag @s add stardust.custom_block
tag @s add stardust.advanced_diamond_seed
tag @s add stardust.vanilla.minecraft_item_frame

# Add a custom name
data merge entity @s {"CustomName": {"translate": "stardust.advanced_diamond_seed"}}

# Modify item frame entity to match the custom block
item replace entity @s contents with minecraft:furnace[item_model="stardust:advanced_diamond_seed",custom_data={stardust:{item_frame_destroy:true,alt_destroy:"stardust.advanced_diamond_seed"}}]
execute store result entity @s Facing byte 1 run scoreboard players get #item_frame_facing stardust.data

# Update position (fixes a Minecraft bug)
execute at @s run tp @s ^ ^ ^0.1

