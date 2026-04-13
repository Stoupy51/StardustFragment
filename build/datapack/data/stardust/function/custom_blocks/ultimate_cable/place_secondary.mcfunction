
#> stardust:custom_blocks/ultimate_cable/place_secondary
#
# @executed	at @s
#
# @within	stardust:custom_blocks/ultimate_cable/place_main [ at @s ]
#

# Add convention and utils tags, and the custom block tag
tag @s add global.ignore
tag @s add global.ignore.kill
tag @s add smithed.entity
tag @s add smithed.block
tag @s add stardust.custom_block
tag @s add stardust.ultimate_cable
tag @s add stardust.vanilla.minecraft_player_head

# Add a custom name
data merge entity @s {"CustomName": [{"text": "U","color": "#ff0000","italic": false},{"text": "l","color": "#ff6d00"},{"text": "t","color": "#ffda00"},{"text": "i","color": "#b6ff00"},{"text": "m","color": "#48ff00"},{"text": "a","color": "#00ff24"},{"text": "t","color": "#00ff91"},{"text": "e","color": "#00ffff"},{"text": " ","color": "#0091ff"},{"text": "C","color": "#0024ff"},{"text": "a","color": "#4800ff"},{"text": "b","color": "#b600ff"},{"text": "l","color": "#ff00da"},{"text": "e","color": "#ff006d"}]}

# Modify item display entity to match the custom block
data modify entity @s transformation.scale set value [1.002f,1.002f,1.002f]
data modify entity @s brightness set value {block:15,sky:15}

tag @s add energy.cable
scoreboard players set @s energy.transfer_rate 1920
function energy:v1/api/init_cable

# Cable rotation for models, and common cable tag
data modify entity @s item_display set value "fixed"
tag @s add stardust.cable

