
# ruff: noqa: E501
# Imports
import json

from beet import Predicate
from beet.core.utils import JsonDict, TextComponent
from stewbeet.core import CUSTOM_ITEM_VANILLA, Conventions, Mem, set_json_encoder, write_function, write_load_file


# Setup quarry work and visuals
def quarry(gui: dict[str, str]) -> None:

	## Constants
	ns: str = Mem.ctx.project_id
	GUI_DATA: str = r'tooltip_display={"hide_tooltip": true},custom_data={"common_signals":{"temp":true}}'
	GUI_DATA_TOOLTIP: str = r'custom_data={"common_signals":{"temp":true}}'
	QUARRY_SLOTS: list[int] = list(range(9, 23)) # Slots 9 to 22 inclusive
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
			write_function(f"{ns}:custom_blocks/{item}/second", f"function {ns}:quarry/second")
			write_function(f"{ns}:custom_blocks/{item}/place_secondary", f"""
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
execute if entity @p[distance=..3] run function {ns}:quarry/update_info

# Work if enough energy and slots available
execute if score @s energy.storage >= @s {ns}.energy_rate unless data storage {ns}:temp Items[26] run function {ns}:quarry/work
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

# Display first and last coordinates
function {ns}:quarry/display/main

# Compute quarry size
function {ns}:quarry/update_size

# Clear temp items
clear @a[distance=..3] *[minecraft:custom_data={{"common_signals":{{"temp":true}}}}]

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
schedule function {ns}:quarry/display/kill_shulkers 10t append

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

	## Working parts
	# Quarry work function
	write_function(f"{ns}:quarry/work", f"""
# TODO: Implement quarry working logic
""")

	return

	## Passive parts
	# Loop function
	content: str = f"""
# Copy slots to storage
data modify storage {ns}:temp slots set value [{{}},{','.join(['{"blocked":true}'] * (QUARRY_SLOTS - 1))}]
data modify storage {ns}:temp slots set from entity @s item.components."minecraft:custom_data".{ns}.quarry_slots
data modify storage {ns}:temp Items set from block ~ ~ ~ Items

# Launch work function if enough power
scoreboard players set #working {ns}.data 0
execute if score @s energy.storage matches {energy["usage"]}.. run function {ns}:custom_blocks/quarry/work

# Update gui for each slot
function {ns}:custom_blocks/quarry/gui_for_each_slot

# Playsound if working
execute if score #working {ns}.data matches 1.. if score #second {ns}.data matches 0 run playsound {ns}:quarry block @a[distance=..12] ~ ~ ~ 0.25

# Save slots to entity
data modify entity @s item.components."minecraft:custom_data".{ns}.quarry_slots set from storage {ns}:temp slots

"""
	write_function(f"{ns}:custom_blocks/quarry/second", content)

	# Gui for each slot
	slots: str = "\n".join(f"function {ns}:custom_blocks/quarry/gui_passive_slot {{\"index\":{i},\"slot\":{i+9}}}" for i in range(QUARRY_SLOTS))
	write_function(f"{ns}:custom_blocks/quarry/gui_for_each_slot", f"""
# For each slot, execute function to update gui
{slots}
""")

	# Set the item gui (blocked if not unlocked, progression otherwise)
	blocked_model: str = gui["gui/progress_blocked.png"]
	progressions_cmd: list[str] = [x for x in gui if "progress_unblocked_" in x]
	write_function(f"{ns}:custom_blocks/quarry/gui_passive_slot", f"""
# Get slot and progression, and the item
scoreboard players set #progression {ns}.data 0
$data modify storage {ns}:temp slot set from storage {ns}:temp slots[$(index)]
execute store result score #progression {ns}.data run data get storage {ns}:temp slot.progression
$data modify storage {ns}:temp intruder set from storage {ns}:temp Items[{{Slot:$(slot)b}}]

# If item is not a GUI, launch function to handle it
$execute unless data storage {ns}:temp intruder.components."minecraft:custom_data".common_signals.temp run function {ns}:custom_blocks/quarry/handle_item_on_gui {{"index":$(index),"slot":$(slot)}}

# Set item gui (blocked if not unlocked, progression otherwise)
$execute if data storage {ns}:temp slot.blocked run item replace block ~ ~ ~ container.$(slot) with {CUSTOM_ITEM_VANILLA}[item_model="{blocked_model}",{GUI_DATA_TOOLTIP},item_name={{"text":"Blocked","italic":false}},lore=[{{"text":"Place a Slot Unlocker to unlock","color":"gray","italic":false}}]]
$execute unless data storage {ns}:temp slot.blocked run function {ns}:custom_blocks/quarry/gui_progression {{"index":$(index),"slot":$(slot)}}
""")

	# Gui progression function
	progressions_gui: list[str] = []
	nb_gui = len(progressions_cmd)
	nb_gui_2 = nb_gui - 2	# nb_gui-2 because we don't count the 0 and last
	previous_max: int = 0
	for i, progression in enumerate(progressions_cmd):
		if i == 0:
			progressions_gui.append(f"""$execute if score #progression {ns}.data matches ..0 run item replace block ~ ~ ~ container.$(slot) with {CUSTOM_ITEM_VANILLA}[item_model="{gui[progression]}",{GUI_DATA}]""")
		elif i == (nb_gui - 1):
			progressions_gui.append(f"""$execute if score #progression {ns}.data matches {previous_max + 1}.. run item replace block ~ ~ ~ container.$(slot) with {CUSTOM_ITEM_VANILLA}[item_model="{gui[progression]}",{GUI_DATA}]""")
		else:
			gui_min: int = previous_max + 1
			previous_max = (i * QUARRY_TIME // nb_gui_2) - 1
			progressions_gui.append(f"""$execute if score #progression {ns}.data matches {gui_min}..{previous_max} run item replace block ~ ~ ~ container.$(slot) with {CUSTOM_ITEM_VANILLA}[item_model="{gui[progression]}",{GUI_DATA}]""")
	write_function(f"{ns}:custom_blocks/quarry/gui_progression", "\n".join(progressions_gui))


	# Handle intruder item on gui
	write_function(f"{ns}:custom_blocks/quarry/handle_item_on_gui", f"""
# If slot is locked and it's not a Slot Unlocker, drop the item
scoreboard players set #drop_item {ns}.data 0
execute unless data storage {ns}:temp slot.blocked run scoreboard players set #drop_item {ns}.data 1
execute if score #drop_item {ns}.data matches 0 unless data storage {ns}:temp intruder.components."minecraft:custom_data".{ns}.slot_unlocker run scoreboard players set #drop_item {ns}.data 1
execute if score #drop_item {ns}.data matches 1 run summon item ~ ~ ~ {{Item:{{id:"minecraft:stone",count:1b,components:{{"minecraft:custom_data":{{"temp":true}}}}}}}}
execute if score #drop_item {ns}.data matches 1 run data modify entity @n[type=item,nbt={{Item:{{components:{{"minecraft:custom_data":{{"temp":true}}}}}}}}] Item set from storage {ns}:temp intruder

# If slot is locked and item didn't drop, unlock the slot, playsound, and drop the item with count decreased by 1
execute if score #drop_item {ns}.data matches 0 if data storage {ns}:temp slot.blocked run playsound block.anvil.destroy block @a[distance=..12]
execute if score #drop_item {ns}.data matches 0 if data storage {ns}:temp slot.blocked run clear @a *[minecraft:custom_data={{"common_signals":{{"temp":true}}}}]
$execute if score #drop_item {ns}.data matches 0 if data storage {ns}:temp slot.blocked run data remove storage {ns}:temp slots[$(index)].blocked
execute if score #drop_item {ns}.data matches 0 if data storage {ns}:temp slot.blocked store result score #count {ns}.data run data get storage {ns}:temp intruder.count
execute if score #drop_item {ns}.data matches 0 if data storage {ns}:temp slot.blocked run scoreboard players remove #count {ns}.data 1
execute if score #drop_item {ns}.data matches 0 if data storage {ns}:temp slot.blocked if score #count {ns}.data matches 1.. store result storage {ns}:temp intruder.count byte 1 run scoreboard players get #count {ns}.data
execute if score #drop_item {ns}.data matches 0 if data storage {ns}:temp slot.blocked if score #count {ns}.data matches 1.. run summon item ~ ~ ~ {{Item:{{id:"minecraft:stone",count:1b,components:{{"minecraft:custom_data":{{"temp":true}}}}}}}}
execute if score #drop_item {ns}.data matches 0 if data storage {ns}:temp slot.blocked if score #count {ns}.data matches 1.. run data modify entity @n[type=item,nbt={{Item:{{components:{{"minecraft:custom_data":{{"temp":true}}}}}}}}] Item set from storage {ns}:temp intruder
""")


	## Work parts
	# Work function
	for_each_slots: str = "\n".join(f"""execute unless data storage {ns}:temp slots[{i}].blocked run function {ns}:custom_blocks/quarry/gui_active_slot {{"index":{i},"slot":{i+9},"result":{i+9*2}}}""" for i in range(QUARRY_SLOTS))
	write_function(f"{ns}:custom_blocks/quarry/work", f"""
# Monitor if any slot is working
{for_each_slots}

# Consume energy if any slot is working
execute if score #working {ns}.data matches 1.. run scoreboard players remove @s energy.storage {energy["usage"] // 20}
""")

	# Reset progress function
	write_function(f"{ns}:custom_blocks/quarry/reset_progress", f"""
scoreboard players set #progression {ns}.data 0
$data modify storage {ns}:temp slots[$(index)].progression set value 0
$function {ns}:custom_blocks/quarry/gui_progression {{"index":$(index),"slot":$(slot)}}
return fail
""")

	# Gui for each active slot
	write_function(f"{ns}:custom_blocks/quarry/gui_active_slot", f"""
# Get progression
scoreboard players set #progression {ns}.data 0
$execute store result score #progression {ns}.data run data get storage {ns}:temp slots[$(index)].progression

# Isolate ingredient and try to get result
scoreboard players set #found {ns}.data 0
data modify storage {ns}:main quarry.input set value {{}}
data modify storage {ns}:main quarry.output set value {{}}
$data modify storage {ns}:main quarry.input set from storage {ns}:temp Items[{{Slot:$(index)b}}]
$execute unless data storage {ns}:main quarry.input run return run function {ns}:custom_blocks/quarry/reset_progress {{"index":$(index),"slot":$(slot)}}
execute summon item_display run function {ns}:custom_blocks/quarry/get_quarry_recipe

# If no recipe found, stop
$execute if score #found {ns}.data matches 0 run return run function {ns}:custom_blocks/quarry/reset_progress {{"index":$(index),"slot":$(slot)}}

# Else, if output do not match current output slot, stop
scoreboard players set #output_occupied {ns}.data 0
$execute if data storage {ns}:temp Items[{{Slot:$(result)b}}] run scoreboard players set #output_occupied {ns}.data 1
execute if score #output_occupied {ns}.data matches 1 run scoreboard players set #is_not_same_output {ns}.data 0
$execute if score #output_occupied {ns}.data matches 1 run data modify storage {ns}:temp copy set from storage {ns}:temp Items[{{Slot:$(result)b}}]
execute if score #output_occupied {ns}.data matches 1 store success score #is_not_same_output {ns}.data run data modify storage {ns}:temp copy.id set from storage {ns}:main quarry.output.id
execute if score #output_occupied {ns}.data matches 1 if score #is_not_same_output {ns}.data matches 0 store success score #is_not_same_output {ns}.data run data modify storage {ns}:temp copy.components set from storage {ns}:main quarry.output.components
$execute if score #output_occupied {ns}.data matches 1 if score #is_not_same_output {ns}.data matches 1 run return run function simplenergy:custom_blocks/quarry/reset_progress {{"index":$(index),"slot":$(slot)}}

# Progress the slot
scoreboard players add #progression {ns}.data 1
$execute if score #progression {ns}.data matches ..{QUARRY_TIME - 1} store result storage {ns}:temp slots[$(index)].progression int 1 run scoreboard players get #progression {ns}.data
scoreboard players add #working {ns}.data 1

# Calculate the output count
execute store result score #count {ns}.data run data get storage {ns}:temp copy.count
execute store result score #to_add {ns}.data run data get storage {ns}:main quarry.output.count
scoreboard players operation #count {ns}.data += #to_add {ns}.data
$execute if score #output_occupied {ns}.data matches 1 run function {ns}:custom_blocks/quarry/get_max_stack_size {{"result":$(result)}}
$execute if score #output_occupied {ns}.data matches 1 if score #count {ns}.data > #max_stack_size {ns}.data run return run function simplenergy:custom_blocks/quarry/reset_progress {{"index":$(index),"slot":$(slot)}}

# Add the item to the result slot if progression is done
execute if score #progression {ns}.data matches ..{QUARRY_TIME - 1} run return 1
$execute if score #output_occupied {ns}.data matches 1 store result block ~ ~ ~ Items[{{Slot:$(result)b}}].count int 1 run scoreboard players get #count {ns}.data
$execute if score #output_occupied {ns}.data matches 0 run data modify storage {ns}:main quarry.output.Slot set value $(result)b
execute if score #output_occupied {ns}.data matches 0 run data modify block ~ ~ ~ Items append from storage {ns}:main quarry.output

# Reset progression and remove 1 count to ingredient
$function simplenergy:custom_blocks/quarry/reset_progress {{"index":$(index),"slot":$(slot)}}
execute store result score #count {ns}.data run data get storage {ns}:main quarry.input.count
scoreboard players remove #count {ns}.data 1
$execute if score #count {ns}.data matches 1.. store result block ~ ~ ~ Items[{{Slot:$(index)b}}].count int 1 run scoreboard players get #count {ns}.data
$execute if score #count {ns}.data matches 0 run data remove block ~ ~ ~ Items[{{Slot:$(index)b}}]
""")

	# Get quarry recipe function
	write_function(f"{ns}:custom_blocks/quarry/get_quarry_recipe", f"""
# Get the recipe
function #{ns}:calls/quarry_recipes

# Place in storage the given output (if any)
execute if score #found {ns}.data matches 1 run data modify storage {ns}:main quarry.output set from entity @s item

# Kill temporary entity
kill @s
""")

	# Get max stack size function
	content: str = ""
	numbers: list[int] = [64, 16, 1, 99]
	numbers += [i for i in range(1, 100) if i not in numbers]
	for i in numbers:
		content += f"$execute if items entity @s container.$(result) *[minecraft:max_stack_size={i}] run return {i}\n"
	write_function(f"{ns}:custom_blocks/quarry/get_max_stack_size", content)

	# Keep track of unlocked slots when destroying and placing
	write_function(f"{ns}:custom_blocks/quarry/destroy", f"""# Copy slots to storage
data remove storage {ns}:temp slots
data modify storage {ns}:temp slots set from entity @s item.components."minecraft:custom_data".{ns}.quarry_slots
\n""", prepend = True)
	write_function(f"{ns}:custom_blocks/quarry/replace_item", f"""
# Save slots to the item components
execute if data storage {ns}:temp slots run data modify entity @s Item.components."minecraft:custom_data".{ns}.quarry_slots set from storage {ns}:temp slots
execute if data storage {ns}:temp slots run data modify entity @s Item.components."minecraft:lore" prepend value {{"text":"Unlocked slots saved.","color":"dark_gray","italic":false}}
""")
	write_function(f"{ns}:custom_blocks/quarry/place_secondary", f"""
# Copy slots to the item components
data modify entity @s item.components."minecraft:custom_data".{ns}.quarry_slots set from entity @p[tag={ns}.placer] SelectedItem.components."minecraft:custom_data".{ns}.quarry_slots
""")


	# ItemIO compatibility
	base: str = 'data modify entity @s item.components."minecraft:custom_data".itemio.ioconfig'
	content: str = f"""
# ItemIO compatibility
tag @s add itemio.container
tag @s add itemio.container.hopper
{base} set value []
"""
	for i in range(QUARRY_SLOTS):
		content += f'{base} append value {{"Slot":{i},"mode":"input","allowed_side":{{"north":true,"south":true,"east":true,"west":true,"top":true}}}}\n'
	for i in range(QUARRY_SLOTS):
		content += f'{base} append value {{"Slot":{i+2*9},"mode":"output","allowed_side":{{"bottom":true}}}}\n'
	content += "function #itemio:calls/container/init\n"
	write_function(f"{ns}:custom_blocks/quarry/place_secondary", content)
	write_function(f"{ns}:custom_blocks/quarry/destroy", "# ItemIO compatibility\nfunction #itemio:calls/container/destroy\n\n", prepend = True)

	return

