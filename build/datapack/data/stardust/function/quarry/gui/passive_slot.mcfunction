
#> stardust:quarry/gui/passive_slot
#
# @executed	as @e[tag=stardust.second] & at @s
#
# @within	stardust:quarry/second {"slot":9}
#			stardust:quarry/second {"slot":10}
#			stardust:quarry/second {"slot":11}
#			stardust:quarry/second {"slot":12}
#			stardust:quarry/second {"slot":13}
#			stardust:quarry/second {"slot":14}
#			stardust:quarry/second {"slot":15}
#			stardust:quarry/second {"slot":16}
#			stardust:quarry/second {"slot":17}
#			stardust:quarry/second {"slot":18}
#			stardust:quarry/second {"slot":19}
#			stardust:quarry/second {"slot":20}
#			stardust:quarry/second {"slot":21}
#			stardust:quarry/second {"slot":22}
#			stardust:quarry/second {"slot":26}
#
# @args		slot (int)
#

# Get the item
$data modify storage stardust:temp intruder set from storage stardust:temp Items[{Slot:$(slot)b}]

# If item is not a GUI, launch function to handle it
$execute if data storage stardust:temp intruder unless data storage stardust:temp intruder.components."minecraft:custom_data".common_signals.temp run function stardust:quarry/gui/handle_item {"slot":$(slot)}

# Set item gui
$scoreboard players set #slot stardust.data $(slot)
$execute unless score #slot stardust.data matches 19..21 run item replace block ~ ~ ~ container.$(slot) with minecraft:command_block[item_model="minecraft:air",tooltip_display={"hide_tooltip": true},custom_data={"common_signals":{"temp":true}}]
$execute if score #slot stardust.data matches 19 run item replace block ~ ~ ~ container.$(slot) with minecraft:command_block[item_model="minecraft:air",custom_data={"common_signals":{"temp":true}},item_name={"translate": "stardust.start","color":"green"}]
$execute if score #slot stardust.data matches 20 run item replace block ~ ~ ~ container.$(slot) with minecraft:command_block[item_model="minecraft:air",custom_data={"common_signals":{"temp":true}},item_name={"translate": "stardust.pause_resume","color":"yellow"}]
$execute if score #slot stardust.data matches 21 run item replace block ~ ~ ~ container.$(slot) with minecraft:command_block[item_model="minecraft:air",custom_data={"common_signals":{"temp":true}},item_name={"translate": "stardust.stop","color":"red"}]

