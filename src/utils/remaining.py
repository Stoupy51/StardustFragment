
# ruff: noqa: E501
# Imports
from stewbeet import *  # type: ignore
from stouputils.io import get_root_path

from .common import STARFRAG_TEXT  # type: ignore

# Constants
ROOT: str = get_root_path(__file__)

# Setup energy balancing
def setup_remaining() -> None:
	ns: str = Mem.ctx.project_id

	# Right click detection
	write_load_file(f"\n# Right click detection\nscoreboard objectives add {ns}.right_click minecraft.used:minecraft.warped_fungus_on_a_stick\nscoreboard objectives add {ns}.cooldown dummy\n", prepend=True)
	Mem.ctx.data[ns].advancements["technical/right_click"] = set_json_encoder(Advancement({
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
	}), max_level=-1)
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
	Mem.ctx.data[ns].advancements["technical/use_life_crystal"] = set_json_encoder(Advancement({
		"criteria": {
			"requirements": {
				"trigger": "minecraft:using_item",
				"conditions": {"item": {"predicates": {"minecraft:custom_data": {ns: {"life_crystal": True}}}}}
			}
		},
		"rewards": {"function": f"{ns}:advancements/use_life_crystal"}
	}), max_level=-1)
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
execute if items entity @s weapon.* *[custom_data~{{{ns}:{{home_travel_staff:true}}}}] run function {ns}:utils/home_travel_staff/right_click
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
item modify entity @s weapon {{"function": "minecraft:set_damage","damage": {-1 / max_damage},"add": true}}
execute store result score #current_damage {ns}.data run data get entity @s SelectedItem.components."minecraft:damage"
execute if score #current_damage {ns}.data matches {max_damage}.. anchored eyes run particle item{{item:{{id:"minecraft:stone",components:{{"minecraft:item_model":"{ns}:home_travel_staff"}}}}}} ^ ^ ^0.5 0 0 0 0.1 10
execute if score #current_damage {ns}.data matches {max_damage}.. run playsound minecraft:item.shield.break ambient @a[distance=..16]
execute if score #current_damage {ns}.data matches {max_damage}.. run item replace entity @s weapon with minecraft:air

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

	# TODO: pearls, always dragon egg on death, travel staff, snipers, etc.
	#advancement grant @s only stardust:visible/stuff/travel_staff
	#advancement grant @s only stardust:visible/adventure/shoot/[copper_nugget, iron_nugget, gold_nugget, stardust_essence, awakened_stardust]


