
#> stardust:quarry/update_info
#
# @executed	as @e[tag=stardust.second] & at @s
#
# @within	stardust:quarry/second
#

# If quarry configurator, apply its settings
# TODO

# Compute quarry size
function stardust:quarry/update_size

# Set quarry status
data modify storage stardust:temp quarry_status set value {"translate": "stardust.idle","color":"red"}
execute if score @s stardust.quarry_status matches 1 run data modify storage stardust:temp quarry_status set value {"translate": "stardust.working","color":"green"}
execute if score @s stardust.quarry_status matches 2 run data modify storage stardust:temp quarry_status set value {"translate": "stardust.paused","color":"yellow"}

# Update info gui
item modify block ~ ~ ~ container.23 {"function":"minecraft:set_lore","entity":"this","lore":[[{"translate": "stardust.energy_stored", "color": "aqua", "italic": false}, {"score": {"name": "@s", "objective": "energy.storage"}, "color": "yellow"}, {"text": "/"}, {"score": {"name": "@s", "objective": "energy.max_storage"}, "color": "yellow"}], [{"translate": "stardust.quarry_status", "color": "aqua", "italic": false}, {"nbt": "quarry_status", "storage": "stardust:temp", "interpret": true}], [{"translate": "stardust.quarry_speed", "color": "aqua", "italic": false}, {"score": {"name": "@s", "objective": "stardust.quarry_speed"}, "color": "yellow"}, {"translate": "stardust.blocks_s"}], [{"translate": "stardust.selected_area", "color": "aqua", "italic": false}, {"score": {"name": "@s", "objective": "stardust.quarry_size"}, "color": "yellow"}, {"translate": "stardust.blocks"}], [{"text": "- X: ", "color": "dark_red", "italic": false}, {"score": {"name": "@s", "objective": "stardust.quarry_x1"}}, {"text": " to "}, {"score": {"name": "@s", "objective": "stardust.quarry_x2"}}], [{"text": "- Y: ", "color": "green", "italic": false}, {"score": {"name": "@s", "objective": "stardust.quarry_y1"}}, {"text": " to "}, {"score": {"name": "@s", "objective": "stardust.quarry_y2"}}], [{"text": "- Z: ", "color": "blue", "italic": false}, {"score": {"name": "@s", "objective": "stardust.quarry_z1"}}, {"text": " to "}, {"score": {"name": "@s", "objective": "stardust.quarry_z2"}}]],"mode":"replace_all"}

