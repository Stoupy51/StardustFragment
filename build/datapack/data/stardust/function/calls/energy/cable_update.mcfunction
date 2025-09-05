
#> stardust:calls/energy/cable_update
#
# @within	#energy:v1/cable_update
#

# Stop if not stardust cable
execute unless entity @s[tag=stardust.custom_block,tag=energy.cable] run return fail

# Apply the model dynamically based on cable tags
execute if entity @s[tag=stardust.awakened_stardust_cable] run item replace entity @s contents with minecraft:command_block[item_model="stardust:awakened_stardust_cable"]
execute if entity @s[tag=stardust.stardust_cable] run item replace entity @s contents with minecraft:command_block[item_model="stardust:stardust_cable"]
execute if entity @s[tag=stardust.ultimate_cable] run item replace entity @s contents with minecraft:command_block[item_model="stardust:ultimate_cable"]

# Get the right model
item modify entity @s contents {"function": "minecraft:set_custom_model_data","floats": {"values": [{"type": "minecraft:score","target": "this","score": "energy.data"}],"mode": "replace_all"}}

