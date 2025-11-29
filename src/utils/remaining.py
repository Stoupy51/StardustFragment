
# ruff: noqa: E501
# Imports
import json

from stewbeet import *  # type: ignore
from stouputils.io import get_root_path

# Constants
ROOT: str = get_root_path(__file__)

# Setup remaining utilities
def setup_remaining() -> None:
	ns: str = Mem.ctx.project_id

	# Get player head loot table
	json_content: JsonDict = {"pools":[{"rolls":1,"entries":[{"type":"minecraft:item","name":"minecraft:player_head","functions":[{"function":"minecraft:fill_player_head","entity":"this"}]}]}]}
	Mem.ctx.data[ns].loot_tables["player_head"] = set_json_encoder(LootTable(json_content), max_level=-1)

	# Right click detection
	write_load_file(f"\n# Right click detection\nscoreboard objectives add {ns}.right_click minecraft.used:minecraft.warped_fungus_on_a_stick\nscoreboard objectives add {ns}.cooldown dummy\n", prepend=True)
	write_advancement(f"{ns}:technical/right_click", {
		"criteria": {
			"requirement": {
				"trigger": "minecraft:tick",
				"conditions": {
					"player": [
						{
							"condition": "minecraft:entity_scores",
							"entity": "this",
							"scores": {f"{ns}.right_click": {"min": 1}}
						}
					]
				}
			}
		},
		"rewards": {
			"function": f"{ns}:advancements/right_click"
		}
	})
	write_function(f"{ns}:advancements/right_click", f"""
# Revoke advancement and reset score
advancement revoke @s only {ns}:technical/right_click
scoreboard players set @s {ns}.right_click 0
""", prepend=True)

	# Global counter
	write_tick_file(f"\n# Global counter for various features\nscoreboard players add #global_tick {ns}.data 1\n", prepend=True)
	write_versioned_function("second", f"\n# Global counter for various features\nscoreboard players add #global_second {ns}.data 1\n", prepend=True)

	# Compute motion towards
	write_function(f"{ns}:utils/compute_motion_towards", """
# Compute motion towards
scoreboard players set @s bs.vel.x 0
scoreboard players set @s bs.vel.y 0
$scoreboard players set @s bs.vel.z $(towards)
function #bs.move:local_to_canonical

# Apply motion
$function #bs.move:set_motion {scale:$(scale)}
""")

	# Use durability
	write_function(f"{ns}:utils/use_durability/main", f"""
# Compute durability usage (6 digits precision)
scoreboard players set #1000000 {ns}.data 1000000
$scoreboard players set #temp_durability {ns}.data -$(amount)
scoreboard players operation #temp_durability {ns}.data *= #1000000 {ns}.data
$scoreboard players set #temp_divider {ns}.data $(max_damage)
scoreboard players operation #temp_durability {ns}.data /= #temp_divider {ns}.data
execute store result storage {ns}:temp use_durability double 0.000001 run scoreboard players get #temp_durability {ns}.data
function {ns}:utils/use_durability/item_modifier with storage {ns}:temp

# If item broke, destroy it
execute store result score #current_damage {ns}.data run data get entity @s SelectedItem.components."minecraft:damage"
$execute if score #current_damage {ns}.data matches $(max_damage).. anchored eyes run particle item{{item:{{id:"minecraft:stone",components:{{"minecraft:item_model":"$(item_model)"}}}}}} ^ ^ ^0.5 0 0 0 0.1 10
$execute if score #current_damage {ns}.data matches $(max_damage).. run playsound minecraft:item.shield.break ambient @a[distance=..16]
$execute if score #current_damage {ns}.data matches $(max_damage).. run item replace entity @s weapon with minecraft:air
""")
	write_function(f"{ns}:utils/use_durability/item_modifier", r"""
$item modify entity @s weapon {"function": "minecraft:set_damage","damage": $(use_durability),"add": true}
""")

	## Life Crystal consuming
	# Add life crystal instrument
	Mem.ctx.data[ns].instruments["life_crystal"] = set_json_encoder(Instrument({
		"description": item_id_to_text_component("life_crystal"),
		"range": 16.0,
		"sound_event": {"sound_id": f"{ns}:life_crystal"},
		"use_duration": 1.0
	}))
	# Detect using life crystal
	write_load_file(f"\n# Life Crystal tracker\nscoreboard objectives add {ns}.life_crystal dummy\n", prepend=True)
	write_advancement(f"{ns}:technical/use_life_crystal", {
		"criteria": {
			"requirements": {
				"trigger": "minecraft:using_item",
				"conditions": {"item": {"predicates": {"minecraft:custom_data": {ns: {"life_crystal": True}}}}}
			}
		},
		"rewards": {"function": f"{ns}:advancements/use_life_crystal"}
	})
	write_function(f"{ns}:advancements/use_life_crystal", f"""
# Revoke advancement
advancement revoke @s only {ns}:technical/use_life_crystal

# Stop if runned a tick ago (to prevent double consuming)
scoreboard players operation #cooldown {ns}.data = @s {ns}.cooldown
execute if score #cooldown {ns}.data > #global_tick {ns}.data run return fail
scoreboard players operation @s {ns}.cooldown = #global_tick {ns}.data
scoreboard players add @s {ns}.cooldown 20

# Stop if already at max life crystals
execute if score @s {ns}.life_crystal matches 20 run return run tellraw @s {{"text":"[Stardust Fragment] You have already reached the maximum number of Life Crystals!","color":"red"}}

# Update life crystal count & attribute
scoreboard players add @s {ns}.life_crystal 1
particle minecraft:heart ~ ~1 ~ .5 .5 .5 1 10 normal
attribute @s minecraft:max_health modifier remove {ns}:life_crystal
{'\n'.join([f'execute if score @s {ns}.life_crystal matches {i+1} run attribute @s minecraft:max_health modifier add {ns}:life_crystal {i+1} add_value' for i in range(20)])}

# Clear one life crystal
clear @s *[custom_data~{{{ns}:{{"life_crystal":true}}}}] 1

# Grant life crystal advancement(s)
advancement grant @s only {ns}:visible/stuff/life_crystal
execute if score @s {ns}.life_crystal matches 20 run advancement grant @s only {ns}:visible/stuff/life_crystal_max
""")

	# Dog excrement production
	Mem.ctx.data[ns].predicates["random/0.05"] = set_json_encoder(Predicate({"condition":"minecraft:random_chance","chance": 0.05}))
	write_versioned_function("minute", f"""
# Dog Excrement production (about 1 every 20 minutes per wolf)
execute at @e[type=minecraft:wolf,{Conventions.AVOID_ENTITY_TAGS},predicate={ns}:random/0.05] run loot spawn ~ ~ ~ loot {ns}:i/dog_excrement
""")

	# Travel Staff
	max_damage: int = Mem.definitions["home_travel_staff"]["max_damage"]
	write_load_file(f"""
# Travel Staff Logic
scoreboard objectives add {ns}.travel_staff_cooldown dummy
scoreboard objectives add {ns}.travel_x dummy
scoreboard objectives add {ns}.travel_y dummy
scoreboard objectives add {ns}.travel_z dummy
""", prepend=True)
	write_function(f"{ns}:advancements/right_click", f"""
# If holding a home travel staff, handle it
execute if items entity @s weapon.mainhand *[custom_data~{{{ns}:{{home_travel_staff:true}}}}] run function {ns}:utils/home_travel_staff/right_click
""")
	write_function(f"{ns}:utils/home_travel_staff/right_click", f"""
# Stop if already clicked recently
execute if score @s {ns}.travel_staff_cooldown > #global_tick {ns}.data run return fail

# Time to teleport (100 ticks)
scoreboard players operation @s {ns}.travel_staff_cooldown = #global_tick {ns}.data
scoreboard players add @s {ns}.travel_staff_cooldown 100
schedule function {ns}:utils/home_travel_staff/schedule_teleport 100t append
schedule function {ns}:utils/home_travel_staff/schedule_particles 50t append

# Copy current position (to detect if moved)
execute store result score @s {ns}.travel_x run data get entity @s Pos[0] 100
execute store result score @s {ns}.travel_y run data get entity @s Pos[1] 100
execute store result score @s {ns}.travel_z run data get entity @s Pos[2] 100

# Use 1 durability
function {ns}:utils/use_durability/main {{"amount":1,"max_damage":{max_damage},"item_model":"{ns}:home_travel_staff"}}

# Feedback
playsound minecraft:block.portal.trigger ambient @s ~ ~ ~ 0.5
effect give @s minecraft:nausea 8 255 true
""")
	write_function(f"{ns}:utils/home_travel_staff/schedule_teleport", f"execute as @a if score @s {ns}.travel_staff_cooldown = #global_tick {ns}.data at @s run function {ns}:utils/home_travel_staff/check")
	write_function(f"{ns}:utils/home_travel_staff/schedule_particles", f"""
# Particle effect when 50 ticks left
scoreboard players operation #plus_50 {ns}.data = #global_tick {ns}.data
scoreboard players add #plus_50 {ns}.data 50
execute as @a if score @s {ns}.travel_staff_cooldown = #plus_50 {ns}.data at @s run particle minecraft:portal ~ ~1 ~ 1 1 1 3 2500
""")
	write_function(f"{ns}:utils/home_travel_staff/check", f"""
# Check if player has moved
scoreboard players reset @s {ns}.travel_staff_cooldown
execute store result score #new_x {ns}.data run data get entity @s Pos[0] 100
execute store result score #new_y {ns}.data run data get entity @s Pos[1] 100
execute store result score #new_z {ns}.data run data get entity @s Pos[2] 100
execute unless score @s {ns}.travel_x = #new_x {ns}.data run return run function {ns}:utils/home_travel_staff/fail
execute unless score @s {ns}.travel_y = #new_y {ns}.data run return run function {ns}:utils/home_travel_staff/fail
execute unless score @s {ns}.travel_z = #new_z {ns}.data run return run function {ns}:utils/home_travel_staff/fail

# Teleport
advancement grant @s only {ns}:visible/stuff/home_travel_staff
function {ns}:dimensions/teleport_home
""")
	write_function(f"{ns}:utils/home_travel_staff/fail", """tellraw @s {"text":"[Stardust Fragment] Teleportation cancelled because you moved!","color":"red"}\nplaysound entity.villager.no ambient @s""")

	# Wormhole Potion
	title: str = json.dumps(item_id_to_text_component("wormhole_potion"))
	write_function(f"{ns}:advancements/right_click", f"""
# If holding a wormhole potion, handle it
execute if items entity @s weapon.* *[custom_data~{{{ns}:{{wormhole_potion:true}}}}] run function {ns}:utils/wormhole_potion/right_click
""")
	write_function(f"{ns}:utils/wormhole_potion/right_click", f"""
# Prepare dialog for which player to teleport to
tag @s add {ns}.temp
data modify storage {ns}:temp dialog set value {{"actions":[],"title":{title}}}
execute as @a[tag=!{ns}.temp] run function {ns}:utils/wormhole_potion/add_to_actions
tag @s remove {ns}.temp

# Message if no other players connected
execute unless data storage {ns}:temp dialog.actions[1] run playsound minecraft:entity.villager.no ambient @s
execute unless data storage {ns}:temp dialog.actions[1] run return run tellraw @s {{"text":"[Stardust Fragment] No other players are currently connected to teleport to.","color":"red"}}

# Show dialog
function {ns}:utils/wormhole_potion/show_dialog with storage {ns}:temp dialog
""")
	write_function(f"{ns}:utils/wormhole_potion/add_to_actions", f"""
# Get player username for macro
tag @e[type=item] add {ns}.temp
execute at @s run loot spawn ~ ~ ~ loot {ns}:player_head
data modify storage {ns}:temp player_name set from entity @e[type=item,tag=!{ns}.temp,limit=1] Item.components."minecraft:profile".name
kill @e[type=item,tag=!{ns}.temp]
tag @e[type=item,tag={ns}.temp] remove {ns}.temp

# Prepare action
data modify storage {ns}:temp element set value {{"label":[],"action":{{}}}}
data modify storage {ns}:temp element.label append value {{"player":{{"name":""}},"hat":true}}
data modify storage {ns}:temp element.label[-1].player.name set from storage {ns}:temp player_name
data modify storage {ns}:temp element.label append value " "
data modify storage {ns}:temp element.label append from storage {ns}:temp player_name
data modify storage {ns}:temp element.label append value " "
data modify storage {ns}:temp element.label append from storage {ns}:temp element.label[0]
data modify storage {ns}:temp element.action set value {{"type":"minecraft:run_command","command":""}}
function {ns}:utils/wormhole_potion/set_teleport_command with storage {ns}:temp

# Add action to dialog
data modify storage {ns}:temp dialog.actions append from storage {ns}:temp element
""")
	write_function(f"{ns}:utils/wormhole_potion/set_teleport_command", f"""
$data modify storage {ns}:temp element.action.command set value 'function {ns}:utils/wormhole_potion/teleport_to {{"name":"$(player_name)"}}'
""")
	write_function(f"{ns}:utils/wormhole_potion/show_dialog", r"""
$dialog show @s {"type":"minecraft:multi_action","columns":3,"exit_action":{"label":{"translate":"gui.back"},"width":200},"title":$(title),"actions":$(actions)}
""")
	write_function(f"{ns}:utils/wormhole_potion/teleport_to", f"""
# Slow falling effect to avoid fall damage
effect give @s minecraft:slow_falling 3 255 true

# Teleport to selected player
$tp @s $(name)

# Feedback
execute at @s run particle minecraft:portal ~ ~1 ~ 1 1 1 0 2500
execute at @s run playsound {ns}:wormhole_potion ambient @a[distance=..16]

# Consume one wormhole potion
clear @s *[custom_data~{{{ns}:{{"wormhole_potion":true}}}}] 1
""")

	## Dragon & Ender Dragon pearls
	write_load_file(f"\n# Ender Pearl detection\nscoreboard objectives add {ns}.ender_pearl minecraft.used:minecraft.ender_pearl\n", prepend=True)
	write_advancement(f"{ns}:technical/ender_pearl", {
		"criteria": {
			"requirement": {
				"trigger": "minecraft:tick",
				"conditions": {
					"player": [
						{
							"condition": "minecraft:entity_scores",
							"entity": "this",
							"scores": {f"{ns}.ender_pearl": {"min": 1}}
						}
					]
				}
			}
		},
		"rewards": {
			"function": f"{ns}:advancements/ender_pearl"
		}
	})
	dragon_data: str = f"""{{{ns}:{{"dragon_pearl":true}}}}"""
	ender_dragon_data: str = f"""{{{ns}:{{"ender_dragon_pearl":true}}}}"""
	def line_pearl(data: str, scale: int) -> str:
		return f"""execute if items entity @s weapon.mainhand *[custom_data~{data}] as @n[type=ender_pearl,tag=!{ns}.motion_applied,nbt={{Item:{{components:{{"minecraft:custom_data":{data}}}}}}}] run function {ns}:utils/multiply_motion {{scale:{scale}}}"""
	write_function(f"{ns}:advancements/ender_pearl", f"""
# Revoke advancement and reset score
advancement revoke @s only {ns}:technical/ender_pearl
scoreboard players set @s {ns}.ender_pearl 0

# If Dragon Pearl (Motion x1.5), if Ender Dragon pearl (Motion x2)
{line_pearl(dragon_data, 1500)}
{line_pearl(ender_dragon_data, 2000)}
""", prepend=True)
	write_function(f"{ns}:utils/multiply_motion", f"""
# Can't directly multiply motion (Minecraft bug), so store in scoreboards first
$execute store result score #motion_x {ns}.data run data get entity @s Motion[0] $(scale)
$execute store result score #motion_y {ns}.data run data get entity @s Motion[1] $(scale)
$execute store result score #motion_z {ns}.data run data get entity @s Motion[2] $(scale)
execute store result entity @s Motion[0] double 0.001 run scoreboard players get #motion_x {ns}.data
execute store result entity @s Motion[1] double 0.001 run scoreboard players get #motion_y {ns}.data
execute store result entity @s Motion[2] double 0.001 run scoreboard players get #motion_z {ns}.data
tag @s add {ns}.motion_applied
""")

	# Bows damage multiplier
	write_load_file(f"\n# Bow shooting detection\nscoreboard objectives add {ns}.bow_shoot minecraft.used:minecraft.bow\n", prepend=True)
	write_advancement(f"{ns}:technical/bow_shoot", {
		"criteria": {
			"requirement": {
				"trigger": "minecraft:tick",
				"conditions": {
					"player": [
						{
							"condition": "minecraft:entity_scores",
							"entity": "this",
							"scores": {f"{ns}.bow_shoot": {"min": 1}}
						}
					]
				}
			}
		},
		"rewards": {
			"function": f"{ns}:advancements/bow_shoot"
		}
	})

	# Create predicate for sneaking
	Mem.ctx.data[ns].predicates["player/sneaking"] = set_json_encoder(Predicate({"condition":"minecraft:entity_properties","entity":"this","predicate":{"flags":{"is_sneaking":True}}}))

	sb_data: str = f"""{{{ns}:{{"stardust_bow":true}}}}"""
	asb_data: str = f"""{{{ns}:{{"awakened_stardust_bow":true}}}}"""
	ub_data: str = f"""{{{ns}:{{"ultimate_bow":true}}}}"""
	def line_bow(data: str, scale: float) -> str:
		return f"""execute if items entity @s weapon.mainhand *[custom_data~{data}] as @n[type=arrow,tag=!{ns}.damage_multiplied,nbt={{weapon:{{components:{{"minecraft:custom_data":{data}}}}}}}] run function {ns}:utils/modify_arrow {{scale:{scale}}}"""
	write_function(f"{ns}:advancements/bow_shoot", f"""
# Revoke advancement and reset score
advancement revoke @s only {ns}:technical/bow_shoot
scoreboard players set @s {ns}.bow_shoot 0

# Set sneaking flag if player is sneaking
scoreboard players set #is_sneaking {ns}.data 0
execute if predicate {ns}:player/sneaking run scoreboard players set #is_sneaking {ns}.data 1

# If Stardust Bow (x2.0), if Awakened Stardust Bow (x3.0), if Ultimate Bow (x4.0)
{line_bow(sb_data, 2.0)}
{line_bow(asb_data, 3.0)}
{line_bow(ub_data, 4.0)}
""", prepend=True)
	write_function(f"{ns}:utils/modify_arrow", f"""
# Multiply arrow damage
$execute store result entity @s damage double $(scale) run data get entity @s damage 1.0

# Set NoGravity if sneaking
execute if score #is_sneaking {ns}.data matches 1 run data modify entity @s NoGravity set value 1b

# Mark as modified
tag @s add {ns}.damage_multiplied
""")

	# Always dragon egg on death
	write_versioned_function("second_5", f"""
# Always drop dragon egg on death
execute unless score #dragon_in_end {ns}.data matches 1.. in minecraft:the_end if entity @e[type=minecraft:ender_dragon,x=0,y=0,z=0,distance=..320,nbt={{Brain:{{}}}}] run function {ns}:utils/dragon_egg_on_death/has_dragon
""")
	write_function(f"{ns}:utils/dragon_egg_on_death/has_dragon", f"""
# We know there is a dragon, set the flag
scoreboard players set #dragon_in_end {ns}.data 1

# Start monitoring dragon's death
schedule function {ns}:utils/dragon_egg_on_death/monitor 1s append
""")
	write_function(f"{ns}:utils/dragon_egg_on_death/monitor", f"""
# Check if dragon is dead
execute in minecraft:the_end unless entity @e[type=minecraft:ender_dragon,x=0,y=0,z=0,distance=..320,nbt={{Brain:{{}}}}] run function {ns}:utils/dragon_egg_on_death/schedule_place_egg

# Reschedule check
execute if score #dragon_in_end {ns}.data matches 1.. run schedule function {ns}:utils/dragon_egg_on_death/monitor 1s replace
""")
	write_function(f"{ns}:utils/dragon_egg_on_death/schedule_place_egg", f"""
# Schedule dragon egg drop after 10 seconds (to ensure dragon death sequence is over)
schedule function {ns}:utils/dragon_egg_on_death/place_egg_start 10s append
scoreboard players reset #dragon_in_end {ns}.data
""")
	write_function(f"{ns}:utils/dragon_egg_on_death/place_egg_start", f"""
# Drop dragon egg at center of the end
execute in minecraft:the_end positioned 0 100 0 run function {ns}:utils/dragon_egg_on_death/place_egg_loop
""")
	write_function(f"{ns}:utils/dragon_egg_on_death/place_egg_loop", f"""
# If current block is bedrock, stop and place egg
execute unless loaded ~ ~ ~ run return fail
execute if block ~ ~ ~ bedrock run return run setblock ~ ~1 ~ minecraft:dragon_egg

# Else, move down and repeat until bedrock found or bottom reached
execute positioned ~ ~-1 ~ run function {ns}:utils/dragon_egg_on_death/place_egg_loop
""")

