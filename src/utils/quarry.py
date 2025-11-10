
# ruff: noqa: E501
# Imports
import json

from beet import Predicate
from beet.core.utils import TextComponent
from stewbeet.core import CUSTOM_ITEM_VANILLA, Conventions, Mem, set_json_encoder, write_function, write_load_file


# Setup quarry work and visuals
def quarry(gui: dict[str, str]) -> None:

	## TODO: FORCELOAD
	## Constants
	ns: str = Mem.ctx.project_id
	GUI_DATA: str = r'tooltip_display={"hide_tooltip": true},custom_data={"common_signals":{"temp":true}}'
	GUI_DATA_TOOLTIP: str = r'custom_data={"common_signals":{"temp":true}}'
	QUARRY_SLOTS: list[int] = [*range(9, 23), 26] # Slots 9 to 22 inclusive and gui slot
	main_gui: str = "gui/quarry.png"
	main_gui_slot: int = 26
	config_placeholder_gui_slot: int = 25
	module_placeholder_gui_slot: int = 24
	info_gui_slot: int = 23
	stop_gui_slot: int = 21
	pause_gui_slot: int = 20
	start_gui_slot: int = 19

	# Prepare info gui lore
	selected_area_lore: list[TextComponent] = [
		[{"text":"Selected Area: ","color":"aqua","italic":False}],
		[{"text":"- X: ","color":"dark_red","italic":False},{"score":{"name":"#config_x1","objective":f"{ns}.data"}},{"text":" to "},{"score":{"name":"#config_x2","objective":f"{ns}.data"}}],
		[{"text":"- Y: ","color":"green","italic":False},{"score":{"name":"#config_y1","objective":f"{ns}.data"}},{"text":" to "},{"score":{"name":"#config_y2","objective":f"{ns}.data"}}],
		[{"text":"- Z: ","color":"blue","italic":False},{"score":{"name":"#config_z1","objective":f"{ns}.data"}},{"text":" to "},{"score":{"name":"#config_z2","objective":f"{ns}.data"}}],
	]
	info_gui_lore: list[TextComponent] = [
		[{"text":"Energy Stored: ","color":"aqua","italic":False},{"score":{"name":"@s","objective":"energy.storage"},"color":"yellow"},{"text":"/"},{"score":{"name":"@s","objective":"energy.max_storage"},"color":"yellow"}],
		[{"text":"Quarry Status: ","color":"aqua","italic":False},{"nbt":"quarry_status","storage":f"{ns}:temp","interpret":True}],
		[{"text":"Quarry Speed: ","color":"aqua","italic":False},{"score":{"name":"@s","objective":f"{ns}.quarry_speed"},"color":"yellow"},{"text":" blocks/s"}],
		[{"text":"Selected Area: ","color":"aqua","italic":False},{"score":{"name":"@s","objective":f"{ns}.quarry_size"},"color":"yellow"},{"text":" blocks"}],
		[{"text":"- X: ","color":"dark_red","italic":False},{"score":{"name":"@s","objective":f"{ns}.quarry_x1"}},{"text":" to "},{"score":{"name":"@s","objective":f"{ns}.quarry_x2"}}],
		[{"text":"- Y: ","color":"green","italic":False},{"score":{"name":"@s","objective":f"{ns}.quarry_y1"}},{"text":" to "},{"score":{"name":"@s","objective":f"{ns}.quarry_y2"}}],
		[{"text":"- Z: ","color":"blue","italic":False},{"score":{"name":"@s","objective":f"{ns}.quarry_z1"}},{"text":" to "},{"score":{"name":"@s","objective":f"{ns}.quarry_z2"}}],
	]

	# Create scoreboard objectives and teams
	write_load_file(f"""
# Quarry scoreboards & teams
scoreboard objectives add {ns}.quarry_curr_x dummy
scoreboard objectives add {ns}.quarry_curr_y dummy
scoreboard objectives add {ns}.quarry_curr_z dummy
scoreboard objectives add {ns}.quarry_x1 dummy
scoreboard objectives add {ns}.quarry_x2 dummy
scoreboard objectives add {ns}.quarry_y1 dummy
scoreboard objectives add {ns}.quarry_y2 dummy
scoreboard objectives add {ns}.quarry_z1 dummy
scoreboard objectives add {ns}.quarry_z2 dummy
scoreboard objectives add {ns}.quarry_status dummy
scoreboard objectives add {ns}.quarry_speed dummy
scoreboard objectives add {ns}.quarry_size dummy
team add {ns}.red
team add {ns}.blue
team modify {ns}.red color red
team modify {ns}.blue color blue
""", prepend=True)

	# For each quarry lvl, call the general quarry second loop, and add data when placing
	for item, data in Mem.definitions.items():
		if item.startswith("quarry_lv") or item == "quarry_creative":
			bps: int = data["custom_data"][ns]["quarry"]["block_per_second"]

			# ItemIO compatibility
			base: str = 'data modify entity @s item.components."minecraft:custom_data".itemio.ioconfig'
			itemio_content: str = f"""
# ItemIO compatibility
tag @s add itemio.container
tag @s add itemio.container.hopper
{base} set value []
"""
			for i in range(9):
				itemio_content += f'{base} append value {{"Slot":{i},"mode":"both","allowed_side":{{"north":true,"south":true,"east":true,"west":true,"top":true,"bottom":true}}}}\n'
			itemio_content += "function #itemio:calls/container/init\n"
			write_function(f"{ns}:custom_blocks/{item}/destroy", "# ItemIO compatibility\nfunction #itemio:calls/container/destroy\n\n", prepend=True)
			write_function(f"{ns}:custom_blocks/{item}/second", f"function {ns}:quarry/second")
			write_function(f"{ns}:custom_blocks/{item}/place_secondary", f"""{itemio_content}

# Set quarry speed, and default coordinates
scoreboard players set @s {ns}.quarry_speed {bps}
execute store result score @s {ns}.quarry_x1 run data get entity @s Pos[0]
execute store result score @s {ns}.quarry_y1 run data get entity @s Pos[1]
execute store result score @s {ns}.quarry_z1 run data get entity @s Pos[2]
execute store result score @s {ns}.quarry_x2 run data get entity @s Pos[0]
execute store result score @s {ns}.quarry_y2 run data get entity @s Pos[1]
execute store result score @s {ns}.quarry_z2 run data get entity @s Pos[2]
scoreboard players add @s {ns}.quarry_y1 3
scoreboard players add @s {ns}.quarry_y2 6
tag @s add {ns}.quarry
""")

	## Quarry configurator
	# Be smart and reuse the right click detection from manual
	write_function(f"{ns}:advancements/right_click", f"""
# If holding a quarry configurator, handle it
execute if items entity @s weapon.* *[custom_data~{{{ns}:{{quarry_configurator:true}}}}] run function {ns}:quarry/configurator/right_click
""")
	Mem.ctx.data[ns].predicates["is_sneaking"] = set_json_encoder(Predicate({"condition":"minecraft:entity_properties","entity":"this","predicate":{"flags":{"is_sneaking":True}}}))
	write_function(f"{ns}:quarry/configurator/right_click", f"""
# Retrieve current configuration
execute store result score #config_x1 {ns}.data run data get entity @s SelectedItem.components."minecraft:custom_data".{ns}.quarry_x1
execute store result score #config_y1 {ns}.data run data get entity @s SelectedItem.components."minecraft:custom_data".{ns}.quarry_y1
execute store result score #config_z1 {ns}.data run data get entity @s SelectedItem.components."minecraft:custom_data".{ns}.quarry_z1
execute store result score #config_x2 {ns}.data run data get entity @s SelectedItem.components."minecraft:custom_data".{ns}.quarry_x2
execute store result score #config_y2 {ns}.data run data get entity @s SelectedItem.components."minecraft:custom_data".{ns}.quarry_y2
execute store result score #config_z2 {ns}.data run data get entity @s SelectedItem.components."minecraft:custom_data".{ns}.quarry_z2

# Remember if the player is sneaking
execute store success score #is_sneaking {ns}.data if predicate {ns}:is_sneaking

# Raycast to the block being looked at
tag @s add {ns}.temp
function #bs.view:at_aimed_block {{run:"function {ns}:quarry/configurator/at_aimed_block",with:{{}}}}

# Update player's item with new configuration
execute summon item_display run function {ns}:quarry/configurator/update_custom_data
tag @s remove {ns}.temp
""")
	write_function(f"{ns}:quarry/configurator/at_aimed_block", f"""
# If targeted a quarry, update its configuration and stop particles
execute as @e[tag={ns}.quarry,dx=0,dy=0,dz=0] run return run function {ns}:quarry/configurator/apply_to_quarry

# Particles and sound
particle firework ~.5 ~.5 ~.5 0.5 0.5 0.5 0.01 100
playsound block.note_block.bell ambient @s

# If sneaking, set 2nd coordinates, else set 1st coordinates
execute unless score #is_sneaking {ns}.data matches 1 store result score #config_x1 {ns}.data run data get storage bs:lambda raycast.targeted_block[0]
execute unless score #is_sneaking {ns}.data matches 1 store result score #config_y1 {ns}.data run data get storage bs:lambda raycast.targeted_block[1]
execute unless score #is_sneaking {ns}.data matches 1 store result score #config_z1 {ns}.data run data get storage bs:lambda raycast.targeted_block[2]
execute if score #is_sneaking {ns}.data matches 1 store result score #config_x2 {ns}.data run data get storage bs:lambda raycast.targeted_block[0]
execute if score #is_sneaking {ns}.data matches 1 store result score #config_y2 {ns}.data run data get storage bs:lambda raycast.targeted_block[1]
execute if score #is_sneaking {ns}.data matches 1 store result score #config_z2 {ns}.data run data get storage bs:lambda raycast.targeted_block[2]

# Update message
execute unless score #is_sneaking {ns}.data matches 1 run tellraw @s [{{"text":"First coordinates set to: ","color":"green"}},{{"score":{{"name":"#config_x1","objective":"{ns}.data"}},"color":"dark_green"}},{{"text":", "}},{{"score":{{"name":"#config_y1","objective":"{ns}.data"}},"color":"dark_green"}},{{"text":", "}},{{"score":{{"name":"#config_z1","objective":"{ns}.data"}},"color":"dark_green"}}]
execute if score #is_sneaking {ns}.data matches 1 run tellraw @s [{{"text":"Second coordinates set to: ","color":"green"}},{{"score":{{"name":"#config_x2","objective":"{ns}.data"}},"color":"dark_green"}},{{"text":", "}},{{"score":{{"name":"#config_y2","objective":"{ns}.data"}},"color":"dark_green"}},{{"text":", "}},{{"score":{{"name":"#config_z2","objective":"{ns}.data"}},"color":"dark_green"}}]
""")
	write_function(f"{ns}:quarry/configurator/apply_to_quarry", f"""
# Update quarry scores
scoreboard players operation @s {ns}.quarry_x1 = #config_x1 {ns}.data
scoreboard players operation @s {ns}.quarry_y1 = #config_y1 {ns}.data
scoreboard players operation @s {ns}.quarry_z1 = #config_z1 {ns}.data
scoreboard players operation @s {ns}.quarry_x2 = #config_x2 {ns}.data
scoreboard players operation @s {ns}.quarry_y2 = #config_y2 {ns}.data
scoreboard players operation @s {ns}.quarry_z2 = #config_z2 {ns}.data

# Tellraw message
tellraw @p[tag={ns}.temp] [{{"text":"Quarry configuration updated.","color":"green"}}]
playsound block.note_block.pling ambient @p[tag={ns}.temp]
""")
	advanced_lore: list[TextComponent] = [*Mem.definitions["quarry_configurator"]["lore"], "", *selected_area_lore]
	write_function(f"{ns}:quarry/configurator/update_custom_data", f"""
# Copy item, update it, and send it back
item replace entity @s contents from entity @p[tag={ns}.temp] weapon.mainhand
execute store result entity @s item.components."minecraft:custom_data".{ns}.quarry_x1 int 1 run scoreboard players get #config_x1 {ns}.data
execute store result entity @s item.components."minecraft:custom_data".{ns}.quarry_y1 int 1 run scoreboard players get #config_y1 {ns}.data
execute store result entity @s item.components."minecraft:custom_data".{ns}.quarry_z1 int 1 run scoreboard players get #config_z1 {ns}.data
execute store result entity @s item.components."minecraft:custom_data".{ns}.quarry_x2 int 1 run scoreboard players get #config_x2 {ns}.data
execute store result entity @s item.components."minecraft:custom_data".{ns}.quarry_y2 int 1 run scoreboard players get #config_y2 {ns}.data
execute store result entity @s item.components."minecraft:custom_data".{ns}.quarry_z2 int 1 run scoreboard players get #config_z2 {ns}.data
item modify entity @s contents {{"function":"minecraft:set_lore","entity":"this","lore":{json.dumps(advanced_lore)},"mode":"replace_all"}}
item replace entity @p[tag={ns}.temp] weapon.mainhand from entity @s contents
kill @s
""")

	## Quarry functions
	# Second loop
	slots: str = "\n".join(f"function {ns}:quarry/gui/passive_slot {{\"slot\":{i}}}" for i in QUARRY_SLOTS)
	write_function(f"{ns}:quarry/second", f"""
# Prevent items in unexpected slots
data modify storage {ns}:temp Items set from block ~ ~ ~ Items
{slots}

# Update gui
item replace block ~ ~ ~ container.{main_gui_slot} with {CUSTOM_ITEM_VANILLA}[item_model="{gui[main_gui]}",{GUI_DATA}]
execute unless items block ~ ~ ~ container.{config_placeholder_gui_slot} * run item replace block ~ ~ ~ container.{config_placeholder_gui_slot} with {CUSTOM_ITEM_VANILLA}[item_model="{ns}:quarry_placeholder_configurator",item_name={{"text":"Configurator Placeholder"}},lore=[{{"text":"Place a configured Quarry Configurator here","color":"gray","italic":false}},{{"text":"to apply its settings to the quarry","color":"gray","italic":false}}],{GUI_DATA_TOOLTIP}]
execute unless items block ~ ~ ~ container.{module_placeholder_gui_slot} * run item replace block ~ ~ ~ container.{module_placeholder_gui_slot} with {CUSTOM_ITEM_VANILLA}[item_model="{ns}:quarry_placeholder_module",item_name={{"text":"Module Placeholder"}},lore=[{{"text":"Place a quarry module here","color":"gray","italic":false}},{{"text":"to apply its effects to the quarry","color":"gray","italic":false}}],{GUI_DATA_TOOLTIP}]
execute unless items block ~ ~ ~ container.{info_gui_slot} * run item replace block ~ ~ ~ container.{info_gui_slot} with {CUSTOM_ITEM_VANILLA}[item_model="{ns}:quarry_information",item_name={{"text":"Quarry Information"}},lore=[{{"text":"TODO","color":"gray","italic":false}}],{GUI_DATA_TOOLTIP}]

# If player nearby, update information
execute if entity @p[distance=..6] run function {ns}:quarry/update_info

# Work if enough energy and slots available
execute if score @s {ns}.quarry_status matches 1 if score @s energy.storage >= @s {ns}.energy_rate unless data storage {ns}:temp Items[26] run function {ns}:quarry/work
""")
	# Set the item gui
	write_function(f"{ns}:quarry/gui/passive_slot", f"""
# Get the item
$data modify storage {ns}:temp intruder set from storage {ns}:temp Items[{{Slot:$(slot)b}}]

# If item is not a GUI, launch function to handle it
$execute if data storage {ns}:temp intruder unless data storage {ns}:temp intruder.components."minecraft:custom_data".common_signals.temp run function {ns}:quarry/gui/handle_item {{"slot":$(slot)}}

# Set item gui
$scoreboard players set #slot {ns}.data $(slot)
$execute unless score #slot {ns}.data matches {start_gui_slot}..{stop_gui_slot} run item replace block ~ ~ ~ container.$(slot) with {CUSTOM_ITEM_VANILLA}[item_model="minecraft:air",{GUI_DATA}]
$execute if score #slot {ns}.data matches {start_gui_slot} run item replace block ~ ~ ~ container.$(slot) with {CUSTOM_ITEM_VANILLA}[item_model="minecraft:air",{GUI_DATA_TOOLTIP},item_name={{"text":"Start","color":"green"}}]
$execute if score #slot {ns}.data matches {pause_gui_slot} run item replace block ~ ~ ~ container.$(slot) with {CUSTOM_ITEM_VANILLA}[item_model="minecraft:air",{GUI_DATA_TOOLTIP},item_name={{"text":"Pause / Resume","color":"yellow"}}]
$execute if score #slot {ns}.data matches {stop_gui_slot} run item replace block ~ ~ ~ container.$(slot) with {CUSTOM_ITEM_VANILLA}[item_model="minecraft:air",{GUI_DATA_TOOLTIP},item_name={{"text":"Stop","color":"red"}}]
""")

	# Handle intruder item on gui
	write_function(f"{ns}:quarry/gui/handle_item", f"""
summon item ~ ~ ~ {{Item:{{id:"minecraft:stone",count:1b,components:{{"minecraft:custom_data":{{"temp":true}}}}}}}}
data modify entity @n[type=item,nbt={{Item:{{components:{{"minecraft:custom_data":{{"temp":true}}}}}}}}] Item set from storage {ns}:temp intruder
""")

	# Update information function
	write_function(f"{ns}:quarry/update_info", f"""
# If quarry configurator, apply its settings
execute if items block ~ ~ ~ container.{config_placeholder_gui_slot} *[custom_data~{{{ns}:{{quarry_configurator:true}}}}] run function {ns}:quarry/configurator/apply_from_placeholder

# Check if buttons pressed
function {ns}:quarry/gui/check_buttons

# Display first and last coordinates
function {ns}:quarry/display/main

# Compute quarry size
function {ns}:quarry/update_size

# Clear temp items
clear @a[distance=..6] *[minecraft:custom_data={{"common_signals":{{"temp":true}}}}]

# Set quarry status
data modify storage {ns}:temp quarry_status set value {{"text":"Idle","color":"red"}}
execute if score @s {ns}.quarry_status matches 1 run data modify storage {ns}:temp quarry_status set value {{"text":"Working","color":"green"}}
execute if score @s {ns}.quarry_status matches 2 run data modify storage {ns}:temp quarry_status set value {{"text":"Paused","color":"yellow"}}

# Update info gui
item modify block ~ ~ ~ container.{info_gui_slot} {{"function":"minecraft:set_lore","entity":"this","lore":{json.dumps(info_gui_lore)},"mode":"replace_all"}}
""")
	write_function(f"{ns}:quarry/configurator/apply_from_placeholder", f"""
# Retrieve configuration from placeholder
data modify storage {ns}:temp config set from block ~ ~ ~ Items[{{Slot:{config_placeholder_gui_slot}b}}].components."minecraft:custom_data".{ns}
execute store result score @s {ns}.quarry_x1 run data get storage {ns}:temp config.quarry_x1
execute store result score @s {ns}.quarry_y1 run data get storage {ns}:temp config.quarry_y1
execute store result score @s {ns}.quarry_z1 run data get storage {ns}:temp config.quarry_z1
execute store result score @s {ns}.quarry_x2 run data get storage {ns}:temp config.quarry_x2
execute store result score @s {ns}.quarry_y2 run data get storage {ns}:temp config.quarry_y2
execute store result score @s {ns}.quarry_z2 run data get storage {ns}:temp config.quarry_z2
""")
	write_function(f"{ns}:quarry/update_size", f"""
# Length, Width, Depth
scoreboard players operation #rX {ns}.data = @s {ns}.quarry_x1
scoreboard players operation #rX {ns}.data -= @s {ns}.quarry_x2
scoreboard players operation #rY {ns}.data = @s {ns}.quarry_y1
scoreboard players operation #rY {ns}.data -= @s {ns}.quarry_y2
scoreboard players operation #rZ {ns}.data = @s {ns}.quarry_z1
scoreboard players operation #rZ {ns}.data -= @s {ns}.quarry_z2

# Avoid multiply by 0
execute if score #rX {ns}.data matches 0 run scoreboard players set #rX {ns}.data 1
execute if score #rY {ns}.data matches 0 run scoreboard players set #rY {ns}.data 1
execute if score #rZ {ns}.data matches 0 run scoreboard players set #rZ {ns}.data 1

# Calculating Size
scoreboard players set #-1 {ns}.data -1
scoreboard players operation @s {ns}.quarry_size = #rX {ns}.data
scoreboard players operation @s {ns}.quarry_size *= #rY {ns}.data
scoreboard players operation @s {ns}.quarry_size *= #rZ {ns}.data
execute if score @s {ns}.quarry_size matches ..-1 run scoreboard players operation @s {ns}.quarry_size *= #-1 {ns}.data
""")

	## Display functions
	# Display main function
	write_function(f"{ns}:quarry/display/main", f"""
# Get coordinates
scoreboard players operation #config_x1 {ns}.data = @s {ns}.quarry_x1
scoreboard players operation #config_y1 {ns}.data = @s {ns}.quarry_y1
scoreboard players operation #config_z1 {ns}.data = @s {ns}.quarry_z1
scoreboard players operation #config_x2 {ns}.data = @s {ns}.quarry_x2
scoreboard players operation #config_y2 {ns}.data = @s {ns}.quarry_y2
scoreboard players operation #config_z2 {ns}.data = @s {ns}.quarry_z2

# Summon shulkers
execute summon marker run function {ns}:quarry/display/summon_shulkers
""")
	tags: str = json.dumps([f"{ns}.quarry_displaying", *Conventions.ENTITY_TAGS_NO_KILL])
	write_function(f"{ns}:quarry/display/summon_shulkers", f"""
# First shulker (red)
execute store result entity @s Pos[0] double 1 run scoreboard players get #config_x1 {ns}.data
execute store result entity @s Pos[1] double 1 run scoreboard players get #config_y1 {ns}.data
execute store result entity @s Pos[2] double 1 run scoreboard players get #config_z1 {ns}.data
execute at @s positioned ~0.5 ~ ~0.5 run summon shulker ~ ~ ~ {{Tags:{tags},DeathLootTable:"none",AttachFace:0,Color:14b,Invulnerable:1b,NoAI:1b,Silent:1b,Glowing:1b,Team:"{ns}.red"}}

# Second shulker (blue)
execute store result entity @s Pos[0] double 1 run scoreboard players get #config_x2 {ns}.data
execute store result entity @s Pos[1] double 1 run scoreboard players get #config_y2 {ns}.data
execute store result entity @s Pos[2] double 1 run scoreboard players get #config_z2 {ns}.data
execute at @s positioned ~0.5 ~ ~0.5 run summon shulker ~ ~ ~ {{Tags:{tags},DeathLootTable:"none",AttachFace:0,Color:3b,Invulnerable:1b,NoAI:1b,Silent:1b,Glowing:1b,Team:"{ns}.blue"}}

# Schedule loop to kill them after some time
schedule function {ns}:quarry/display/kill_shulkers 1t append

# Kill marker
kill @s
""")
	write_function(f"{ns}:quarry/display/kill_shulkers", f"""
# Increment score of all shulkers, and kill them if score >= 2 seconds
scoreboard players set #shulkers_remaining {ns}.data 0
execute as @e[tag={ns}.quarry_displaying] run function {ns}:quarry/display/shulkers_loop

# Reschedule if any shulker remains
execute if score #shulkers_remaining {ns}.data matches 1.. run schedule function {ns}:quarry/display/kill_shulkers 1s replace
""")
	write_function(f"{ns}:quarry/display/shulkers_loop", f"""
# Increment score
scoreboard players add @s {ns}.data 1

# Kill shulker
execute if score @s {ns}.data matches ..1 run scoreboard players add #shulkers_remaining {ns}.data 1
execute if score @s {ns}.data matches 2.. run tp @s 0 -10000 0
execute if score @s {ns}.data matches 2.. run kill @s
""")

	# Check buttons
	write_function(f"{ns}:quarry/gui/check_buttons", f"""
# Start button
execute unless score @s {ns}.quarry_status matches 1.. unless data storage {ns}:temp Items[{{Slot:{start_gui_slot}b}}] run return run function {ns}:quarry/start
execute unless score @s {ns}.quarry_status matches 2 unless data storage {ns}:temp Items[{{Slot:{start_gui_slot}b}}] run return run scoreboard players set @s {ns}.quarry_status 1

# Pause button
execute if score @s {ns}.quarry_status matches 1 unless data storage {ns}:temp Items[{{Slot:{pause_gui_slot}b}}] run return run scoreboard players set @s {ns}.quarry_status 2
execute if score @s {ns}.quarry_status matches 2 unless data storage {ns}:temp Items[{{Slot:{pause_gui_slot}b}}] run return run scoreboard players set @s {ns}.quarry_status 1

# Stop button
execute if score @s {ns}.quarry_status matches 1.. unless data storage {ns}:temp Items[{{Slot:{stop_gui_slot}b}}] run return run scoreboard players set @s {ns}.quarry_status 0
""")
	write_function(f"{ns}:quarry/start", f"""
# Initialize current coordinates, and set status to working
scoreboard players operation @s {ns}.quarry_curr_x = @s {ns}.quarry_x1
scoreboard players operation @s {ns}.quarry_curr_y = @s {ns}.quarry_y1
scoreboard players operation @s {ns}.quarry_curr_z = @s {ns}.quarry_z1
scoreboard players set @s {ns}.quarry_status 1
""")

	## Working parts
	# Quarry work function
	write_function(f"{ns}:quarry/work", f"""
## Check if the selected region is valid (Less than 500 million blocks)
#execute if score @s {ns}.quarry_size matches 500000001.. run tellraw @a[distance=..5] {{"text":"Stardust Fragment Error: Quarry region size cannot be larger than 500 million blocks.","color":"red"}}
#execute if score @s {ns}.quarry_size matches 500000001.. run return run scoreboard players set @s {ns}.quarry_status 0

# Get module data
scoreboard players set #fortune_level {ns}.data 0
scoreboard players set #silk_touch_level {ns}.data 0
execute store result score #fortune_level {ns}.data if data storage {ns}:temp Items[{{Slot:{module_placeholder_gui_slot}b}}].components."minecraft:custom_data".{ns}.fortune_module run data get storage {ns}:temp Items[{{Slot:{module_placeholder_gui_slot}b}}].count
execute store success score #silk_touch_level {ns}.data if data storage {ns}:temp Items[{{Slot:{module_placeholder_gui_slot}b}}].components."minecraft:custom_data".{ns}.silk_touch_module

# Consume energy
scoreboard players operation @s energy.storage -= @s {ns}.energy_rate

# Compute how many block-checks the quarry should attempt.
# A "quarry_multiplier" > 1 reduces the impact of empty space so air blocks don't
# slow the quarry as much (default multiplier = 25). Setting multiplier = 1
# treats air and solid blocks equally.
scoreboard players set #quarry_multiplier {ns}.data 25
scoreboard players operation #blocks_to_break {ns}.data = @s {ns}.quarry_speed
scoreboard players operation #blocks_to_break {ns}.data *= #quarry_multiplier {ns}.data

# Start loop to break blocks
function {ns}:quarry/working/loop

# Kill temporary shulkers displaying current position
schedule function {ns}:quarry/display/kill_shulkers 1t append
""")
	# Quarry working loop
	write_function(f"{ns}:quarry/working/loop", f"""
# Break at position
scoreboard players operation #quarry_x {ns}.data = @s {ns}.quarry_curr_x
scoreboard players operation #quarry_y {ns}.data = @s {ns}.quarry_curr_y
scoreboard players operation #quarry_z {ns}.data = @s {ns}.quarry_curr_z
execute summon marker run function {ns}:quarry/working/break_at_position
function {ns}:quarry/working/update_coordinates

# Continue loop if blocks remain to break
execute if score #blocks_to_break {ns}.data matches 1.. run function {ns}:quarry/working/loop
""")
	# Break at current position
	write_function(f"{ns}:quarry/working/break_at_position", f"""
# Get block at position
execute store result entity @s Pos[0] double 1 run scoreboard players get #quarry_x {ns}.data
execute store result entity @s Pos[1] double 1 run scoreboard players get #quarry_y {ns}.data
execute store result entity @s Pos[2] double 1 run scoreboard players get #quarry_z {ns}.data

# If a player is nearby or it's last block, summon a shulker for visualization
execute at @s store success score #player_nearby {ns}.data if entity @p[distance=..25]
execute if score #blocks_to_break {ns}.data <= #quarry_multiplier {ns}.data at @s unless block ~ ~ ~ #minecraft:air run scoreboard players set #player_nearby {ns}.data 1
execute if score #blocks_to_break {ns}.data matches 1 run scoreboard players set #player_nearby {ns}.data 1
execute if score #player_nearby {ns}.data matches 1 at @s run function {ns}:quarry/display/current_position

# Mine block
function {ns}:quarry/working/mine_block

# Clear marker
kill @s
""")
	write_function(f"{ns}:quarry/display/current_position", f"""
# Summon shulker and schedule loop to kill them after some time
execute positioned ~0.5 ~ ~0.5 run summon shulker ~ ~ ~ {{Tags:{tags},DeathLootTable:"none",AttachFace:0,Color:0b,Invulnerable:1b,NoAI:1b,Silent:1b,Glowing:1b}}
""")
	# Mine block function
	write_function(f"{ns}:quarry/working/mine_block", f"""
# If block is air, skip (remove one block to check), else continue and remove quarry_multiplier blocks to check
execute at @s if block ~ ~ ~ #minecraft:air run return run scoreboard players remove #blocks_to_break {ns}.data 1
scoreboard players operation #blocks_to_break {ns}.data -= #quarry_multiplier {ns}.data

# Destroy mechanization custom blocks
execute at @s align xyz as @e[tag=mechanization,dx=0,dy=0,dz=0,limit=1] at @s run function #mechanization:wrench_break

# Check if block is a container with items or not
execute at @s store success score #is_container {ns}.data if block ~ ~ ~ #itemio:container
execute if score #is_container {ns}.data matches 0 if score #fortune_level {ns}.data matches 0 if score #silk_touch_level {ns}.data matches 0 run scoreboard players set #is_container {ns}.data 1

# Mining the block at the current position
execute if score #is_container {ns}.data matches 0 if score #fortune_level {ns}.data matches 1 at @s run loot spawn ~ ~ ~ mine ~ ~ ~ netherite_pickaxe[enchantments={{fortune:1}}]
execute if score #is_container {ns}.data matches 0 if score #fortune_level {ns}.data matches 2 at @s run loot spawn ~ ~ ~ mine ~ ~ ~ netherite_pickaxe[enchantments={{fortune:2}}]
execute if score #is_container {ns}.data matches 0 if score #fortune_level {ns}.data matches 3 at @s run loot spawn ~ ~ ~ mine ~ ~ ~ netherite_pickaxe[enchantments={{fortune:3}}]
execute if score #is_container {ns}.data matches 0 if score #fortune_level {ns}.data matches 4 at @s run loot spawn ~ ~ ~ mine ~ ~ ~ netherite_pickaxe[enchantments={{fortune:4}}]
execute if score #is_container {ns}.data matches 0 if score #fortune_level {ns}.data matches 5.. at @s run loot spawn ~ ~ ~ mine ~ ~ ~ netherite_pickaxe[enchantments={{fortune:5}}]
execute if score #is_container {ns}.data matches 0 if score #silk_touch_level {ns}.data matches 1 at @s run loot spawn ~ ~ ~ mine ~ ~ ~ netherite_pickaxe[enchantments={{silk_touch:1}}]
execute if score #is_container {ns}.data matches 0 at @s run clone ~ ~ ~ ~ ~ ~ -30000000 51 1610
execute if score #is_container {ns}.data matches 0 at @s run setblock ~ ~ ~ minecraft:air
execute if score #is_container {ns}.data matches 1 at @s run setblock ~ ~ ~ minecraft:air destroy

# Destroy some custom blocks
execute at @s align xyz run function #common_signals:calls/destroyed_block

# Pickup items
execute at @s run kill @e[type=experience_orb,distance=..2,{Conventions.AVOID_ENTITY_TAGS}]
execute at @s run tag @e[type=item,dx=0,dy=0,dz=0,{Conventions.AVOID_ENTITY_TAGS}] add {ns}.quarry_item
execute as @e[tag={ns}.quarry_item] run function {ns}:quarry/working/pickup_item

# Destroy the block in a special way if not container
execute if score #is_container {ns}.data matches 0 at @s run clone -30000000 51 1610 -30000000 51 1610 ~ ~ ~
execute if score #is_container {ns}.data matches 0 at @s run setblock ~ ~ ~ air destroy
execute if score #is_container {ns}.data matches 0 at @s run kill @e[type=item,dx=0,dy=0,dz=0,{Conventions.AVOID_ENTITY_TAGS}]
""")
	# Pickup item function
	write_function(f"{ns}:quarry/working/pickup_item", f"""
# Try to insert in container
data modify storage itemio:io input set from entity @s Item
data modify storage itemio:io input_side set value "wireless"
function #itemio:calls/input

# If inserted, remove count or kill item
execute if score #success_input itemio.io matches 1 store result score #output_count {ns}.data run data get storage itemio:io output.count
execute if score #success_input itemio.io matches 1 if score #output_count {ns}.data matches 0 run kill @s
execute if score #success_input itemio.io matches 1 if score #output_count {ns}.data matches 1.. store result entity @s Item.count int 1 run scoreboard players get #output_count {ns}.data
execute if score #success_input itemio.io matches 1 if score #output_count {ns}.data matches 1.. run scoreboard players set #success_input itemio.io 0

# If not fully inserted, drop item at quarry position and stop working
execute if score #success_input itemio.io matches 0 run tp @s ~ ~ ~
execute if score #success_input itemio.io matches 0 run scoreboard players set #blocks_to_break {ns}.data 0

# Remove quarry item tag
tag @s remove {ns}.quarry_item
""")

	# Update coordinates function
	write_function(f"{ns}:quarry/working/update_coordinates", f"""
# Move in X direction first
execute if score @s {ns}.quarry_x1 < @s {ns}.quarry_x2 run scoreboard players add @s {ns}.quarry_curr_x 1
execute if score @s {ns}.quarry_x1 > @s {ns}.quarry_x2 run scoreboard players remove @s {ns}.quarry_curr_x 1

# If passed X limit, reset X and move in Z direction
execute if score @s {ns}.quarry_x1 < @s {ns}.quarry_x2 if score @s {ns}.quarry_curr_x > @s {ns}.quarry_x2 if score @s {ns}.quarry_z1 < @s {ns}.quarry_z2 run scoreboard players add @s {ns}.quarry_curr_z 1
execute if score @s {ns}.quarry_x1 < @s {ns}.quarry_x2 if score @s {ns}.quarry_curr_x > @s {ns}.quarry_x2 if score @s {ns}.quarry_z1 > @s {ns}.quarry_z2 run scoreboard players remove @s {ns}.quarry_curr_z 1
execute if score @s {ns}.quarry_x1 < @s {ns}.quarry_x2 if score @s {ns}.quarry_curr_x > @s {ns}.quarry_x2 run scoreboard players operation @s {ns}.quarry_curr_x = @s {ns}.quarry_x1
execute if score @s {ns}.quarry_x1 > @s {ns}.quarry_x2 if score @s {ns}.quarry_curr_x < @s {ns}.quarry_x2 if score @s {ns}.quarry_z1 < @s {ns}.quarry_z2 run scoreboard players add @s {ns}.quarry_curr_z 1
execute if score @s {ns}.quarry_x1 > @s {ns}.quarry_x2 if score @s {ns}.quarry_curr_x < @s {ns}.quarry_x2 if score @s {ns}.quarry_z1 > @s {ns}.quarry_z2 run scoreboard players remove @s {ns}.quarry_curr_z 1
execute if score @s {ns}.quarry_x1 > @s {ns}.quarry_x2 if score @s {ns}.quarry_curr_x < @s {ns}.quarry_x2 run scoreboard players operation @s {ns}.quarry_curr_x = @s {ns}.quarry_x1

# If passed Z limit, reset Z and move in Y direction
execute if score @s {ns}.quarry_z1 < @s {ns}.quarry_z2 if score @s {ns}.quarry_curr_z > @s {ns}.quarry_z2 if score @s {ns}.quarry_y1 < @s {ns}.quarry_y2 run scoreboard players add @s {ns}.quarry_curr_y 1
execute if score @s {ns}.quarry_z1 < @s {ns}.quarry_z2 if score @s {ns}.quarry_curr_z > @s {ns}.quarry_z2 if score @s {ns}.quarry_y1 > @s {ns}.quarry_y2 run scoreboard players remove @s {ns}.quarry_curr_y 1
execute if score @s {ns}.quarry_z1 < @s {ns}.quarry_z2 if score @s {ns}.quarry_curr_z > @s {ns}.quarry_z2 run scoreboard players operation @s {ns}.quarry_curr_z = @s {ns}.quarry_z1
execute if score @s {ns}.quarry_z1 > @s {ns}.quarry_z2 if score @s {ns}.quarry_curr_z < @s {ns}.quarry_z2 if score @s {ns}.quarry_y1 < @s {ns}.quarry_y2 run scoreboard players add @s {ns}.quarry_curr_y 1
execute if score @s {ns}.quarry_z1 > @s {ns}.quarry_z2 if score @s {ns}.quarry_curr_z < @s {ns}.quarry_z2 if score @s {ns}.quarry_y1 > @s {ns}.quarry_y2 run scoreboard players remove @s {ns}.quarry_curr_y 1
execute if score @s {ns}.quarry_z1 > @s {ns}.quarry_z2 if score @s {ns}.quarry_curr_z < @s {ns}.quarry_z2 run scoreboard players operation @s {ns}.quarry_curr_z = @s {ns}.quarry_z1

# If passed Y limit, stop quarry
execute if score @s {ns}.quarry_y1 < @s {ns}.quarry_y2 if score @s {ns}.quarry_curr_y > @s {ns}.quarry_y2 run scoreboard players set #blocks_to_break {ns}.data 0
execute if score @s {ns}.quarry_y1 < @s {ns}.quarry_y2 if score @s {ns}.quarry_curr_y > @s {ns}.quarry_y2 run return run scoreboard players set @s {ns}.quarry_status 0
execute if score @s {ns}.quarry_y1 > @s {ns}.quarry_y2 if score @s {ns}.quarry_curr_y < @s {ns}.quarry_y2 run scoreboard players set #blocks_to_break {ns}.data 0
execute if score @s {ns}.quarry_y1 > @s {ns}.quarry_y2 if score @s {ns}.quarry_curr_y < @s {ns}.quarry_y2 run return run scoreboard players set @s {ns}.quarry_status 0
""")

	return

