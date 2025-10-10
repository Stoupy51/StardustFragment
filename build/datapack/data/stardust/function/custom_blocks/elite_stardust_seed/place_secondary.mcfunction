
#> stardust:custom_blocks/elite_stardust_seed/place_secondary
#
# @executed	at @s
#
# @within	stardust:custom_blocks/elite_stardust_seed/place_main [ at @s ]
#

# Add convention and utils tags, and the custom block tag
tag @s add global.ignore
tag @s add global.ignore.kill
tag @s add smithed.entity
tag @s add smithed.block
tag @s add stardust.custom_block
tag @s add stardust.elite_stardust_seed
tag @s add stardust.vanilla.minecraft_moss_carpet
tag @s add stardust.growing_seed

# Add a custom name
data merge entity @s {"CustomName": {"translate": "stardust.elite_stardust_seed"}}

# Modify item display entity to match the custom block
item replace entity @s contents with minecraft:furnace[item_model="stardust:elite_stardust_seed"]
data modify entity @s transformation.scale set value [1.002f,1.002f,1.002f]
data modify entity @s brightness set value {block:15,sky:15}

# Update seed model
scoreboard players add @s stardust.growth_time 0
function stardust:custom_blocks/elite_stardust_seed/update_seed_model

# Add tag for loop every minute
tag @s add stardust.minute
scoreboard players add #minute_entities stardust.data 1

