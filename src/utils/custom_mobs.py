
# ruff: noqa: E501
# Imports
import os

from beet import Advancement
from stewbeet.core import Conventions, Mem, set_json_encoder, write_function, write_load_file, write_versioned_function


# Setup custom mobs
def setup_custom_mobs() -> None:
	COMMON_SIGNAL: str = r'custom_data={"common_signals":{"temp":true}}'
	ns: str = Mem.ctx.project_id
	textures_folder: str = Mem.ctx.meta["stewbeet"]["textures_folder"]

	# Add tints to existing mob models
	for mob in os.listdir(f"{textures_folder}/mobs"):
		mob_name: str = os.path.splitext(mob)[0]
		if Mem.ctx.assets[ns].item_models.get(mob_name) is not None:
			Mem.ctx.assets[ns].item_models[mob_name].data["model"]["tints"] = [{"type":"minecraft:dye","default":[1.0,1.0,1.0]}]

	# New scoreboard for hurt time
	write_load_file(f"""
# Scoreboard for mob hurt time tracking\nscoreboard objectives add {ns}.hurt_time dummy
""", prepend=True)

	# Check for new mobs in the dimensions
	write_versioned_function("second", f"""
# Check for vanilla mobs in dimensions to convert to custom mobs
execute as @e[type=#{ns}:mob_grinder,tag=!{ns}.dim_checked] at @s run function {ns}:mobs/check_dimension

# Loop through custom mobs displays entities (Skip if already ticking in a scheduled function)
execute unless score #mobs_loop_ticking {ns}.data matches 1.. run function {ns}:mobs/ticking
""")
	write_function(f"{ns}:mobs/ticking", f"execute as @e[type=item_display,tag={ns}.mob_model,tag=!{ns}.dying_model] at @s run function {ns}:mobs/loop_display")
	write_function(f"{ns}:mobs/check_dimension", f"""
# Mark as checked
tag @s add {ns}.dim_checked

# Switch case on dimension
{"\n".join([f"execute if dimension {ns}:{dim} run return run function {ns}:mobs/convert/{dim}""" for dim in ["cavern", "celestial", "stardust", "dungeon", "ultimate"]])}
""")

	## Stardust dimension
	# Mob conversion function
	write_function(f"{ns}:mobs/convert/stardust", f"""
# If skeleton, convert to stardust soldier
execute if entity @s[type=minecraft:skeleton] run return run function {ns}:mobs/stardust_soldier/convert

# If evoker, convert to stardust evoker
execute if entity @s[type=minecraft:evoker] run return run function {ns}:mobs/stardust_evoker/convert

# If bat, convert to stardust bat
execute if entity @s[type=minecraft:bat] run return run function {ns}:mobs/stardust_bat/convert
""")
	# Summon functions
	for name, vanilla_mob in [
		("stardust_soldier", "minecraft:skeleton"),
		("stardust_evoker", "minecraft:evoker"),
		("stardust_bat", "minecraft:bat"),
		("stardust_pillar", "minecraft:vex"),
	]:
		write_function(f"{ns}:mobs/{name}/summon", f"""
execute summon {vanilla_mob} run function {ns}:mobs/{name}/convert
""")
	# Stardust soldier/evoker/bat conversion
	for stardust_mob in ["stardust_soldier", "stardust_evoker", "stardust_bat"]:
		name: str = stardust_mob.replace("_", " ").title()
		patrol_leader: str = ""
		if stardust_mob == "stardust_evoker":
			patrol_leader = "\n# Remove Evoker default's nbt\ndata merge entity @s {PatrolLeader:false,Patrolling:false,CanJoinRaid:false}"
		write_function(f"{ns}:mobs/{stardust_mob}/convert", f"""
# Make invisible, reset nbt, set custom name and tags
effect give @s invisibility infinite 255 true

# Add tags
{"\n".join([f"tag @s add {tag}" for tag in Conventions.ENTITY_TAGS])}
tag @s add {ns}.{stardust_mob}
tag @s add {ns}.mob_entity

# Set attributes (x2 health, x3 damage, x1.25 speed)
attribute @s minecraft:max_health modifier add {ns}:health_scale 1 add_multiplied_base
attribute @s minecraft:attack_damage modifier add {ns}:damage_scale 2 add_multiplied_base
attribute @s minecraft:movement_speed modifier add {ns}:speed_scale 0.25 add_multiplied_base
data modify entity @s Health set value 2048.0f

# No equipment and set loot table
item replace entity @s weapon.mainhand with stone[item_model="minecraft:air",{COMMON_SIGNAL}]
item replace entity @s armor.head with air
item replace entity @s armor.chest with air
item replace entity @s armor.legs with air
item replace entity @s armor.feet with air
data modify entity @s DeathLootTable set value "{ns}:entities/{'stardust_dimension' if stardust_mob != 'stardust_bat' else 'stardust_bat'}"

# Set custom name and other properties
data modify entity @s CustomName set value {{"text":"{name}","color":"aqua"}}
data modify entity @s CanPickUpLoot set value false

# Create visual model
execute store result score #base_scale {ns}.data run attribute @s minecraft:scale base get 1000
tag @s add {ns}.new_mob
execute summon item_display run function {ns}:mobs/create_model {{"entity":"{stardust_mob}"}}
tag @s remove {ns}.new_mob
{patrol_leader}
""")

	# Stardust Pillar
	write_function(f"{ns}:mobs/stardust_pillar/convert", f"""
# Make invisible, reset nbt, set custom name and tags
effect give @s invisibility infinite 255 true

# Add tags
{"\n".join([f"tag @s add {tag}" for tag in Conventions.ENTITY_TAGS])}
tag @s add {ns}.stardust_pillar
tag @s add {ns}.mob_entity

# No equipment or loot table
item replace entity @s weapon.mainhand with stone[item_model="minecraft:air",{COMMON_SIGNAL}]
data modify entity @s DeathLootTable set value "none"

# Set attributes (500 health, x2 damage, 5x scale)
attribute @s minecraft:attack_damage modifier add {ns}:damage_scale 2 add_multiplied_base
attribute @s minecraft:max_health base set 500
attribute @s minecraft:scale base set 5.0
data modify entity @s Health set value 2048.0f

# Set custom name and other properties
data modify entity @s CustomName set value {{"text":"Stardust Pillar","color":"aqua"}}
data modify entity @s PersistenceRequired set value true
data modify entity @s Silent set value true

# Create visual model
execute store result score #base_scale {ns}.data run attribute @s minecraft:scale base get 500
tag @s add {ns}.new_mob
execute summon item_display run function {ns}:mobs/create_model {{"entity":"stardust_pillar"}}
tag @s remove {ns}.new_mob
""")

	# Create model function
	write_function(f"{ns}:mobs/create_model", f"""
# Add tags
{"\n".join([f"tag @s add {tag}" for tag in Conventions.ENTITY_TAGS_NO_KILL])}
tag @s add {ns}.mob_model

# Ride the mob
ride @s mount @n[tag={ns}.new_mob]

# Set item display properties
$item replace entity @s contents with stone[item_model="{ns}:$(entity)"]

# Scale and position (based on mob's base scale)
execute store result entity @s transformation.scale[0] double 0.001 run scoreboard players get #base_scale {ns}.data
execute store result entity @s transformation.scale[1] double 0.001 run scoreboard players get #base_scale {ns}.data
execute store result entity @s transformation.scale[2] double 0.001 run scoreboard players get #base_scale {ns}.data
execute store result entity @s transformation.translation[1] double -0.0015 run scoreboard players get #base_scale {ns}.data

# If stardust pillar, adjust Y position for model
execute if data entity @s item.components{{"minecraft:item_model":"{ns}:stardust_pillar"}} store result entity @s transformation.translation[1] double -0.0012 run scoreboard players get #base_scale {ns}.data

# Smooth movement
data modify entity @s teleport_duration set value 2
""")

	## Looping mob display updates
	# Loop display function
	write_function(f"{ns}:mobs/loop_display", f"""
# Get mob's data
data modify storage {ns}:temp entity_data set value {{}}
execute on vehicle run data modify storage {ns}:temp entity_data set from entity @s

# Check if mob entity is still alive (hp >= 0), if not start dying display and stop here
scoreboard players set #mob_health {ns}.data 0
execute on vehicle store result score #mob_health {ns}.data run data get storage {ns}:temp entity_data.Health 1000
execute if score #mob_health {ns}.data matches ..0 run return run function {ns}:mobs/start_dying_display

# Apply rotation (only yaw)
data modify entity @s Rotation[0] set from storage {ns}:temp entity_data.Rotation[0]

# Get HurtTime (for hurt model)
scoreboard players set #hurt_time {ns}.data 0
execute store result score #hurt_time {ns}.data run data get storage {ns}:temp entity_data.HurtTime
scoreboard players operation #hurt_time_minus_one {ns}.data = #hurt_time {ns}.data
scoreboard players remove #hurt_time_minus_one {ns}.data 1

# Apply hurt model if HurtTime updates
execute unless score @s {ns}.hurt_time matches 1.. if score #hurt_time {ns}.data matches 1.. run data modify entity @s item.components."minecraft:dyed_color" set value [1.0,0.5,0.5]
execute unless score @s {ns}.hurt_time matches 1.. if score #hurt_time {ns}.data matches 1.. run scoreboard players operation @s {ns}.hurt_time = #hurt_time_minus_one {ns}.data
execute if score @s {ns}.hurt_time matches 0 run data remove entity @s item.components."minecraft:dyed_color"

# Decrease mob hurt time scoreboard (to track when to remove hurt model)
execute if score @s {ns}.hurt_time matches 0.. run scoreboard players remove @s {ns}.hurt_time 1
""")

	# Start dying function
	write_function(f"{ns}:mobs/start_dying_display", f"""
# Tag as dying model to avoid looping
tag @s add {ns}.dying_model
tag @s remove {ns}.mob_model

# Set dyed color to red
data modify entity @s item.components."minecraft:dyed_color" set value [1.0,0.5,0.5]

# Set transformation data
data modify entity @s transformation.left_rotation set value [0.0f,0.0f,0.7f,0.7f]
data modify entity @s transformation.translation[0] set value -0.7f
data modify entity @s interpolation_duration set value 8
data modify entity @s start_interpolation set value 0
data modify entity @s teleport_duration set value 20

# Schedule removal after 20 ticks
scoreboard players set @s {ns}.data 20
schedule function {ns}:mobs/remove_dying_display 1t append
""")
	# Remove dying display function
	write_function(f"{ns}:mobs/remove_dying_display", f"""
# Try to kill displays
scoreboard players set #remaining_displays {ns}.data 0
execute as @e[type=item_display,tag={ns}.dying_model] run function {ns}:mobs/try_kill_display

# If still displays remaining, reschedule
execute if score #remaining_displays {ns}.data matches 1.. run schedule function {ns}:mobs/remove_dying_display 1t replace
""")
	write_function(f"{ns}:mobs/try_kill_display", f"""
# Decrease timer
scoreboard players remove @s {ns}.data 1

# If timer reached 0, kill display
execute if score @s {ns}.data matches 0 run return run kill @s

# Else, mark as remaining
scoreboard players add #remaining_displays {ns}.data 1
""")

	## TODO: enable ticking when a player deals damage to add stardust mob
	# Detect when player hurts a mob
	Mem.ctx.data[ns].advancements["technical/mob_hurt"] = set_json_encoder(Advancement({
		"criteria": {
			"requirements": {
				"trigger": "minecraft:player_hurt_entity",
				"conditions": {"entity": {"nbt": f"""{{Tags:["{ns}.mob_entity"]}}"""}}
			}
		},
		"rewards": {"function": f"{ns}:advancements/enable_mob_ticking"}
	}), max_level=-1)

	# Detect when a mob hurts a player
	Mem.ctx.data[ns].advancements["technical/mob_attack"] = set_json_encoder(Advancement({
		"criteria": {
			"requirements": {
				"trigger": "minecraft:entity_hurt_player",
				"conditions": {"damage": {"source_entity": {"nbt": f"""{{Tags:["{ns}.mob_entity"]}}"""}}}
			}
		},
		"rewards": {"function": f"{ns}:advancements/enable_mob_ticking"}
	}), max_level=-1)

	# Enable mob ticking function
	write_function(f"{ns}:advancements/enable_mob_ticking", f"""
# Revoke advancements
advancement revoke @s only {ns}:technical/mob_hurt
advancement revoke @s only {ns}:technical/mob_attack

# Set ticking flag (for 10 seconds)
scoreboard players set #mobs_loop_ticking {ns}.data {20*10}

# Schedule ticking function
schedule function {ns}:mobs/fast_ticking 1t append
""")
	# Fast ticking function
	write_function(f"{ns}:mobs/fast_ticking", f"""
# Decrease ticking timer & Tick mob displays
scoreboard players remove #mobs_loop_ticking {ns}.data 1
function {ns}:mobs/ticking

# If still ticking, reschedule
execute if score #mobs_loop_ticking {ns}.data matches 1.. run schedule function {ns}:mobs/fast_ticking 1t replace
""")

	# TODO: Stardust bat summon lightning effect on players nearby
	# Be careful with #mobs_loop_ticking

	# TODO: Stardust Pillar's looping behavior (shoot mobs at players nearby)

