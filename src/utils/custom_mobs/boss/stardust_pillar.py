
# Imports
from stewbeet.core import Conventions, Mem, write_function


# Setup boss mob: Stardust Pillar
def main() -> None:
	COMMON_SIGNAL: str = r'custom_data={"common_signals":{"temp":true}}'
	ns: str = Mem.ctx.project_id

	# Stardust Pillar conversion
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

	# Mob looping behavior
	write_function(f"{ns}:mobs/loop/mob_second", f"execute if entity @s[tag={ns}.stardust_pillar] run return run function {ns}:mobs/stardust_pillar/second")

	# TODO: Stardust Pillar's looping behavior (summon mobs nearby players with a spawn animation)
	write_function(f"{ns}:mobs/stardust_pillar/second", """
# TODO: think about behavior
""")

