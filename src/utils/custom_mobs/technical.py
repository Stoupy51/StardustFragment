
# Imports
import os

from stewbeet.core import Conventions, Mem, write_advancement, write_function, write_load_file, write_versioned_function


# Setup all technical features for custom mobs
def main() -> None:
	ns: str = Mem.ctx.project_id
	textures_folder: str = Mem.ctx.meta["stewbeet"]["textures_folder"]
	all_mobs: list[str] = [os.path.splitext(mob)[0] for mob in os.listdir(f"{textures_folder}/mobs")]

	# Add tints to existing mob models
	for mob in all_mobs:
		if Mem.ctx.assets[ns].item_models.get(mob) is not None:
			Mem.ctx.assets[ns].item_models[mob].data["model"]["tints"] = [{"type":"minecraft:dye","default":[1.0,1.0,1.0]}]

	# New scoreboards
	write_load_file(f"""
# Scoreboards for custom mobs and team
scoreboard objectives add {ns}.hurt_time dummy
scoreboard objectives add {ns}.spawn_delay dummy
team add {ns}.mob {{"text":"Stardust Mob","color":"aqua"}}
team modify {ns}.mob collisionRule always
team modify {ns}.mob friendlyFire false
""", prepend=True)
	write_versioned_function("minute", f"""
# Remove bossbars
function {ns}:mobs/remove_bossbars
""")

	# Check for new mobs in the dimensions
	write_versioned_function("second", f"""
# Check for vanilla mobs in dimensions to convert to custom mobs
execute as @e[type=#{ns}:mob_grinder,tag=!{ns}.dim_checked] at @s run function {ns}:mobs/check_dimension

# Loop through custom mobs displays entities (Skip if already ticking in a scheduled function)
execute unless score #mobs_loop_ticking {ns}.data matches 1.. run function {ns}:mobs/ticking
""")
	write_function(f"{ns}:mobs/ticking", f"execute as @e[type=item_display,tag={ns}.mob_model,tag=!{ns}.dying_model] at @s run function {ns}:mobs/loop/main")
	write_function(f"{ns}:mobs/loop/main", f"""
# Always run display update first
function {ns}:mobs/loop/display

# Then run mob-specific behavior unless dying
execute if score #second {ns}.data matches 0 unless entity @s[tag={ns}.dying_model] on vehicle at @s run function {ns}:mobs/loop/mob_second
""")
	write_function(f"{ns}:mobs/check_dimension", f"""
# Mark as checked
tag @s add {ns}.dim_checked

# Switch case on dimension
{"\n".join([f"execute if dimension {ns}:{dim} run return run function {ns}:mobs/convert/{dim}" for dim in ["cavern", "celestial", "stardust", "dungeon", "ultimate"]])}
""")

	# Create model function
	write_function(f"{ns}:mobs/create_model", f"""
# Add tags
{"\n".join([f"tag @s add {tag}" for tag in Conventions.ENTITY_TAGS_NO_KILL])}
$tag @s add {ns}.$(entity)
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

# If Stardust Pillar, adjust Y position for model
execute if data entity @s item.components{{"minecraft:item_model":"{ns}:stardust_pillar"}} store result entity @s transformation.translation[1] double -0.0012 run scoreboard players get #base_scale {ns}.data

# Smooth movement
data modify entity @s teleport_duration set value 2
""")  # noqa: E501

	## Looping mob display updates
	# Loop display function
	write_function(f"{ns}:mobs/loop/display", f"""
# Get mob's data
data modify storage {ns}:temp entity_data set value {{}}
execute on vehicle run data modify storage {ns}:temp entity_data set from entity @s

# Check if mob entity is still alive (hp >= 0), if not start dying display and stop here
scoreboard players set #mob_health {ns}.data 0
execute on vehicle store result score #mob_health {ns}.data run data get storage {ns}:temp entity_data.Health 1000
execute if score #mob_health {ns}.data matches ..0 run return run function {ns}:mobs/display/start_dying

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
	write_function(f"{ns}:mobs/display/start_dying", f"""
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
schedule function {ns}:mobs/display/remove_dying_entity 1t append
""")

	# Remove dying display function
	write_function(f"{ns}:mobs/display/remove_dying_entity", f"""
# Try to kill displays
scoreboard players set #remaining_displays {ns}.data 0
execute as @e[type=item_display,tag={ns}.dying_model] run function {ns}:mobs/display/try_kill

# If still displays remaining, reschedule
execute if score #remaining_displays {ns}.data matches 1.. run schedule function {ns}:mobs/display/remove_dying_entity 1t replace
""")
	write_function(f"{ns}:mobs/display/try_kill", f"""
# Decrease timer
scoreboard players remove @s {ns}.data 1

# If timer reached 0, kill display
execute if score @s {ns}.data matches 0 run return run kill @s

# Else, mark as remaining
scoreboard players add #remaining_displays {ns}.data 1
""")

	## Enable ticking when a player deals damage to add stardust mob
	# Detect when player hurts a mob
	write_advancement(f"{ns}:technical/mob_hurt", {
		"criteria": {
			"requirements": {
				"trigger": "minecraft:player_hurt_entity",
				"conditions": {"entity": {"nbt": f"""{{Tags:["{ns}.mob_entity"]}}"""}}
			}
		},
		"rewards": {"function": f"{ns}:advancements/enable_mob_ticking"}
	})

	# Detect when a mob hurts a player
	write_advancement(f"{ns}:technical/mob_attack", {
		"criteria": {
			"requirements": {
				"trigger": "minecraft:entity_hurt_player",
				"conditions": {"damage": {"source_entity": {"nbt": f"""{{Tags:["{ns}.mob_entity"]}}"""}}}
			}
		},
		"rewards": {"function": f"{ns}:advancements/enable_mob_ticking"}
	})

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

	## Delay convert functions for each mob (Spawn animation)
	write_function(f"{ns}:mobs/delay/convert", f"""
# Convert now
$function {ns}:mobs/$(entity)/convert

# Delay spawn
function {ns}:mobs/delay/spawn

# Incompatibility with RandomMobSizes (due to how it modifies entity size on summon)
tag @s add random_mob_sizes.checked
""")
	write_function(f"{ns}:mobs/delay/spawn", f"""
# Remove entity AI and set it Invulnerable during animation
data modify entity @s NoAI set value true
data modify entity @s Invulnerable set value true

# Tag as delayed entity
tag @s add {ns}.delayed_convert

# Make the entity ascend for 50 ticks (2.5 seconds)
scoreboard players operation @s {ns}.spawn_delay = #global_tick {ns}.data
scoreboard players add @s {ns}.spawn_delay 50

# Schedule end delay convert check
schedule function {ns}:mobs/delay/schedule 1t append
""")
	# Schedule delay convert check function
	write_function(f"{ns}:mobs/delay/schedule", f"""
# Check if delay is over
scoreboard players set #remaining_delays {ns}.data 0
execute as @e[tag={ns}.delayed_convert] at @s run function {ns}:mobs/delay/tick

# If still delays remaining, reschedule
execute if score #remaining_delays {ns}.data matches 1.. run schedule function {ns}:mobs/delay/schedule 1t replace
""")
	# Schedule delay convert check function
	write_function(f"{ns}:mobs/delay/tick", f"""
# Teleport entity upwards (2.0 blocks / 50 = 0.04 per tick)
tp @s ~ ~0.04 ~

# Check if delay is over
execute if score #global_tick {ns}.data >= @s {ns}.spawn_delay run data modify entity @s NoAI set value false
execute if score #global_tick {ns}.data >= @s {ns}.spawn_delay run data modify entity @s Invulnerable set value false
execute if score #global_tick {ns}.data >= @s {ns}.spawn_delay run return run tag @s remove {ns}.delayed_convert

# Else, mark as remaining
scoreboard players add #remaining_delays {ns}.data 1
""")

