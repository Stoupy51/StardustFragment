
#> stardust:quarry/second
#
# @executed	as @e[tag=stardust.second] & at @s
#
# @within	stardust:custom_blocks/quarry_lv1/second
#			stardust:custom_blocks/quarry_lv2/second
#			stardust:custom_blocks/quarry_lv3/second
#			stardust:custom_blocks/quarry_lv4/second
#			stardust:custom_blocks/quarry_lv5/second
#			stardust:custom_blocks/quarry_creative/second
#

# Prevent items in unexpected slots
data modify storage stardust:temp Items set from block ~ ~ ~ Items
function stardust:quarry/gui/passive_slot {"slot":9}
function stardust:quarry/gui/passive_slot {"slot":10}
function stardust:quarry/gui/passive_slot {"slot":11}
function stardust:quarry/gui/passive_slot {"slot":12}
function stardust:quarry/gui/passive_slot {"slot":13}
function stardust:quarry/gui/passive_slot {"slot":14}
function stardust:quarry/gui/passive_slot {"slot":15}
function stardust:quarry/gui/passive_slot {"slot":16}
function stardust:quarry/gui/passive_slot {"slot":17}
function stardust:quarry/gui/passive_slot {"slot":18}
function stardust:quarry/gui/passive_slot {"slot":19}
function stardust:quarry/gui/passive_slot {"slot":20}
function stardust:quarry/gui/passive_slot {"slot":21}
function stardust:quarry/gui/passive_slot {"slot":22}
function stardust:quarry/gui/passive_slot {"slot":26}

# Update gui
item replace block ~ ~ ~ container.26 with minecraft:command_block[item_model="stardust:gui/quarry",tooltip_display={"hide_tooltip":true},custom_data={"common_signals":{"temp":true}}]
execute unless items block ~ ~ ~ container.25 * run item replace block ~ ~ ~ container.25 with minecraft:command_block[item_model="stardust:quarry_placeholder_configurator",item_name={"translate": "stardust.configurator_placeholder"},lore=[{"translate": "stardust.place_a_configured_quarry_configurator_here","color":"gray","italic":false},{"translate": "stardust.to_apply_its_settings_to_the_quarry","color":"gray","italic":false}],custom_data={"common_signals":{"temp":true}}]
execute unless items block ~ ~ ~ container.24 * run item replace block ~ ~ ~ container.24 with minecraft:command_block[item_model="stardust:quarry_placeholder_module",item_name={"translate": "stardust.module_placeholder"},lore=[{"translate": "stardust.place_a_quarry_module_here","color":"gray","italic":false},{"translate": "stardust.to_apply_its_effects_to_the_quarry","color":"gray","italic":false}],custom_data={"common_signals":{"temp":true}}]
execute unless items block ~ ~ ~ container.23 * run item replace block ~ ~ ~ container.23 with minecraft:command_block[item_model="stardust:quarry_information",item_name={"translate": "stardust.quarry_information"},lore=[{"translate": "stardust.todo","color":"gray","italic":false}],custom_data={"common_signals":{"temp":true}}]

# If player nearby, update information
execute if entity @p[distance=..6] run function stardust:quarry/update_info

# Work if enough energy and slots available
execute if score @s stardust.quarry_status matches 1 if score @s energy.storage >= @s stardust.energy_rate unless data storage stardust:temp Items[26] run function stardust:quarry/work

