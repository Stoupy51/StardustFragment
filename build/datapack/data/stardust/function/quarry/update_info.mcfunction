
#> stardust:quarry/update_info
#
# @executed	as @e[tag=stardust.second] & at @s
#
# @within	stardust:quarry/second
#

# If quarry configurator, apply its settings
execute if items block ~ ~ ~ container.25 *[custom_data~{stardust:{quarry_configurator:true}}] run function stardust:quarry/configurator/apply_from_placeholder

# Check if buttons pressed
execute if data storage stardust:temp Items[0] run function stardust:quarry/gui/check_buttons

# Display first and last coordinates
function stardust:quarry/display/main

# Compute quarry size
function stardust:quarry/update_size

# Clear temp items
clear @a[distance=..6] *[minecraft:custom_data={"common_signals":{"temp":true}}]

# Set quarry status
data modify storage stardust:temp quarry_status set value {"translate":"stardust.idle","fallback":"Idle","color":"red"}
execute if score @s stardust.quarry_status matches 1 run data modify storage stardust:temp quarry_status set value {"translate":"stardust.working","fallback":"Working","color":"green"}
execute if score @s stardust.quarry_status matches 2 run data modify storage stardust:temp quarry_status set value {"translate":"stardust.paused","fallback":"Paused","color":"yellow"}

# Update info gui
item modify block ~ ~ ~ container.22 {"type":"minecraft:set_lore","entity":"this","lore":[[{"translate": "stardust.energy_stored","fallback": "Energy Stored: ", "color": "aqua", "italic": false}, {"score": {"name": "@s", "objective": "energy.storage"}, "color": "yellow"}, {"text": "/"}, {"score": {"name": "@s", "objective": "energy.max_storage"}, "color": "yellow"}], [{"translate": "stardust.quarry_status","fallback": "Quarry Status: ", "color": "aqua", "italic": false}, {"nbt": "quarry_status", "storage": "stardust:temp", "interpret": true}], [{"translate": "stardust.quarry_speed","fallback": "Quarry Speed: ", "color": "aqua", "italic": false}, {"score": {"name": "@s", "objective": "stardust.quarry_speed"}, "color": "yellow"}, [{"text":" "}, {"translate": "stardust.blocks_s","fallback": "blocks/s"}]], [{"translate": "stardust.selected_area","fallback": "Selected Area: ", "color": "aqua", "italic": false}, {"score": {"name": "@s", "objective": "stardust.quarry_size"}, "color": "yellow"}, [{"text":" "}, {"translate": "stardust.blocks","fallback": "blocks"}]], [{"text": "- X: ", "color": "dark_red", "italic": false}, {"score": {"name": "@s", "objective": "stardust.quarry_x1"}}, {"text": " to "}, {"score": {"name": "@s", "objective": "stardust.quarry_x2"}}], [{"text": "- Y: ", "color": "green", "italic": false}, {"score": {"name": "@s", "objective": "stardust.quarry_y1"}}, {"text": " to "}, {"score": {"name": "@s", "objective": "stardust.quarry_y2"}}], [{"text": "- Z: ", "color": "blue", "italic": false}, {"score": {"name": "@s", "objective": "stardust.quarry_z1"}}, {"text": " to "}, {"score": {"name": "@s", "objective": "stardust.quarry_z2"}}]],"mode":"replace_all"}

