
# ruff: noqa: E501
# Imports
import os

from beet import Predicate
from stewbeet.core import Conventions, JsonDict, Mem, set_json_encoder, write_function, write_load_file, write_versioned_function
from stouputils.io import relative_path


# Setup custom mobs
def setup_custom_mobs() -> None:
	COMMON_SIGNAL: str = r'custom_data={"common_signals":{"temp":true}}'
	ns: str = Mem.ctx.project_id
	textures_folder: str = Mem.ctx.meta["stewbeet"]["textures_folder"]
	mobs_textures_folder: str = f"{textures_folder}/mobs"
	mobs_models: list[str] = [x for x in os.listdir(mobs_textures_folder) if x.endswith("_model.png") and not x.endswith("_hurt_model.png")]
	"""
	{
		"model": {
			"type": "minecraft:model",
			"model": "survisland:item/parchemin",
			"tints": [
				{"type": "minecraft:dye","default": [0.78,0.737,0.647]}
			]
		}
	}
	"""

	# Create custom mobs models
	print(textures_folder)
	## TODO: LOOP SECOND FOR THE ITEM DISPLAY
	## TODO: IF A PLAYER HURT A MOB, TICK LOOP TO CHANGE THE TEXTURE TO HURT MODEL FOR A FEW TICKS

	# Check for new mobs in the dimensions
	write_versioned_function("second", f"""
# Check for vanilla mobs in dimensions to convert to custom mobs
execute as @e[type=#{ns}:mob_grinder,tag=!{ns}.dim_checked] at @s run function {ns}:mobs/check_dimension
""")
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
	]:
		write_function(f"{ns}:mobs/{name}/summon", f"""
execute summon {vanilla_mob} run function {ns}:mobs/{name}/convert
""")
	# Stardust soldier conversion
	write_function(f"{ns}:mobs/stardust_soldier/convert", f"""
# Make invisible, reset nbt, set custom name and tags
effect give @s invisibility infinite 255 true

# Add tags
{"\n".join([f"tag @s add {tag}" for tag in Conventions.ENTITY_TAGS])}
tag @s add {ns}.stardust_soldier
tag @s add {ns}.mob

# Set attributes (x2 health, x3 damage, x1.25 speed)
attribute @s minecraft:max_health modifier add {ns}:health_scale 1 add_multiplied_base
attribute @s minecraft:attack_damage modifier add {ns}:damage_scale 2 add_multiplied_base
attribute @s minecraft:movement_speed modifier add {ns}:speed_scale 0.25 add_multiplied_base
data modify entity @s Health set value 100.0f

# No equipment and set loot table
item replace entity @s weapon.mainhand with stone[item_model="minecraft:air",{COMMON_SIGNAL}]
item replace entity @s armor.head with stone[item_model="minecraft:air",{COMMON_SIGNAL}]
item replace entity @s armor.chest with stone[item_model="minecraft:air",{COMMON_SIGNAL}]
item replace entity @s armor.legs with stone[item_model="minecraft:air",{COMMON_SIGNAL}]
item replace entity @s armor.feet with stone[item_model="minecraft:air",{COMMON_SIGNAL}]
data modify entity @s DeathLootTable set value "{ns}:entities/stardust_dimension"

# Set custom name
data modify entity @s CustomName set value {{"text":"Stardust Soldier","color":"aqua"}}

# Create visual model
execute store result score #base_scale {ns}.data run attribute @s minecraft:scale base get 1000
tag @s add {ns}.new_mob
execute summon item_display run function {ns}:mobs/stardust_soldier/create_model
tag @s remove {ns}.new_mob
""")
	write_function(f"{ns}:mobs/stardust_soldier/create_model", f"""
# Add tags
{"\n".join([f"tag @s add {tag}" for tag in Conventions.ENTITY_TAGS_NO_KILL])}

# Ride the mob
ride @s mount @n[tag={ns}.new_mob]

# Set item display's item to the mob model
loot replace entity @s contents loot {ns}:i/stardust_soldier

# Scale and position (based on mob's base scale)
execute store result entity @s transformation.scale[0] double 0.001 run scoreboard players get #base_scale {ns}.data
execute store result entity @s transformation.scale[1] double 0.001 run scoreboard players get #base_scale {ns}.data
execute store result entity @s transformation.scale[2] double 0.001 run scoreboard players get #base_scale {ns}.data
execute store result entity @s transformation.translation[1] double -0.0015 run scoreboard players get #base_scale {ns}.data

# Smooth movement
data modify entity @s teleport_duration set value 1
""")

