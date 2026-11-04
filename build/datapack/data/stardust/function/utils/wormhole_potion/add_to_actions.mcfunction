
#> stardust:utils/wormhole_potion/add_to_actions
#
# @executed	as @a[tag=!stardust.temp]
#
# @within	stardust:utils/wormhole_potion/right_click [ as @a[tag=!stardust.temp] ]
#

# Get player username for macro
execute at @s run tag @e[type=item,distance=..3] add stardust.temp
execute at @s run loot spawn ~ ~ ~ loot stardust:player_head
data modify storage stardust:temp player_name set from entity @n[type=item,tag=!stardust.temp,distance=..3] Item.components."minecraft:profile".name
execute at @s run kill @e[type=item,tag=!stardust.temp,distance=..3]
execute at @s run tag @e[type=item,tag=stardust.temp,distance=..3] remove stardust.temp

# Prepare action
data modify storage stardust:temp element set value {"label":[],"action":{}}
data modify storage stardust:temp element.label append value {"player":{"name":""},"hat":true}
data modify storage stardust:temp element.label[-1].player.name set from storage stardust:temp player_name
data modify storage stardust:temp element.label append value " "
data modify storage stardust:temp element.label append from storage stardust:temp player_name
data modify storage stardust:temp element.label append value " "
data modify storage stardust:temp element.label append from storage stardust:temp element.label[0]
data modify storage stardust:temp element.action set value {"type":"minecraft:run_command","command":""}
function stardust:utils/wormhole_potion/set_teleport_command with storage stardust:temp

# Add action to dialog
data modify storage stardust:temp dialog.actions append from storage stardust:temp element

