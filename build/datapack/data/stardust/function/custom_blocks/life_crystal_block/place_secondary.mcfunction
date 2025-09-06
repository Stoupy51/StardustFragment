
#> stardust:custom_blocks/life_crystal_block/place_secondary
#
# @executed	at @s
#
# @within	stardust:custom_blocks/life_crystal_block/place_main [ at @s ]
#

# Add convention and utils tags, and the custom block tag
tag @s add global.ignore
tag @s add global.ignore.kill
tag @s add smithed.entity
tag @s add smithed.block
tag @s add stardust.custom_block
tag @s add stardust.life_crystal_block
tag @s add stardust.vanilla.minecraft_glass

# Add a custom name
data merge entity @s {"CustomName": {"translate": "stardust.life_crystal_block"}}

# Modify item display entity to match the custom block
item replace entity @s contents with minecraft:furnace[item_model="stardust:life_crystal_block"]
data modify entity @s transformation.scale set value [1.002f,1.002f,1.002f]
data modify entity @s brightness set value {block:15,sky:15}

# Apply rotation
execute if score #rotation stardust.data matches 1 run data modify entity @s Rotation[0] set value 180.0f
execute if score #rotation stardust.data matches 2 run data modify entity @s Rotation[0] set value 270.0f
execute if score #rotation stardust.data matches 3 run data modify entity @s Rotation[0] set value 0.0f
execute if score #rotation stardust.data matches 4 run data modify entity @s Rotation[0] set value 90.0f

