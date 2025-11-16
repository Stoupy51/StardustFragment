
#> stardust:custom_blocks/ultimate_portal/place_secondary
#
# @executed	at @s
#
# @within	stardust:custom_blocks/ultimate_portal/place_main [ at @s ]
#

# Add convention and utils tags, and the custom block tag
tag @s add global.ignore
tag @s add global.ignore.kill
tag @s add smithed.entity
tag @s add smithed.block
tag @s add stardust.custom_block
tag @s add stardust.ultimate_portal
tag @s add stardust.vanilla.minecraft_crying_obsidian

# Add a custom name
data merge entity @s {"CustomName": [{"text": "U","color": "#ff0000","italic": false},{"text": "l","color": "#ff6600"},{"text": "t","color": "#ffcc00"},{"text": "i","color": "#ccff00"},{"text": "m","color": "#65ff00"},{"text": "a","color": "#00ff00"},{"text": "t","color": "#00ff65"},{"text": "e","color": "#00ffcb"},{"text": " ","color": "#00cbff"},{"text": "P","color": "#0065ff"},{"text": "o","color": "#0000ff"},{"text": "r","color": "#6600ff"},{"text": "t","color": "#cb00ff"},{"text": "a","color": "#ff00cb"},{"text": "l","color": "#ff0066"}]}

# Modify item display entity to match the custom block
item replace entity @s contents with minecraft:furnace[item_model="stardust:ultimate_portal"]
data modify entity @s transformation.scale set value [1.002f,1.002f,1.002f]
data modify entity @s brightness set value {block:15,sky:15}

# Energy part
tag @s add energy.receive
scoreboard players set @s stardust.energy_rate 500
scoreboard players set @s energy.max_storage 24000
scoreboard players operation @s energy.transfer_rate = @s energy.max_storage
scoreboard players add @s energy.storage 0
scoreboard players add @s energy.change_rate 0
function energy:v1/api/init_machine

# Make the block have infinite energy if applicable
execute if score #infinite_energy stardust.data matches 1 run tag @s add stardust.infinite_energy
scoreboard players reset #infinite_energy stardust.data

# Add tag for loop every second
tag @s add stardust.second
scoreboard players add #second_entities stardust.data 1

