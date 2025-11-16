
# Imports
from beet import LootTable, Predicate
from stewbeet.core import COMMON_SIGNAL, Conventions, Mem, set_json_encoder, write_function


# Setup custom mobs for the Stardust dimension
def main() -> None:
	ns: str = Mem.ctx.project_id

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
		write_function(f"{ns}:mobs/{name}/summon", f"execute summon {vanilla_mob} run function {ns}:mobs/{name}/convert")

	# Stardust soldier/evoker/bat conversion
	for stardust_mob in ["stardust_soldier", "stardust_evoker", "stardust_bat"]:
		name: str = stardust_mob.replace("_", " ").title()
		patrol_leader: str = ""
		if stardust_mob == "stardust_evoker":
			patrol_leader = "\n# Remove Evoker default's nbt\ndata merge entity @s {PatrolLeader:false,Patrolling:false,CanJoinRaid:false}"
		loot_table: str = "stardust_dimension" if stardust_mob != "stardust_bat" else "stardust_bat"
		write_function(f"{ns}:mobs/{stardust_mob}/convert", f"""
# Make invisible, reset nbt, set custom name and tags
effect give @s invisibility infinite 255 true

# Add tags & join team
{"\n".join([f"tag @s add {tag}" for tag in Conventions.ENTITY_TAGS])}
tag @s add {ns}.{stardust_mob}
tag @s add {ns}.stardust_mob
tag @s add {ns}.mob_entity
team join {ns}.mob @s

# Set attributes (x2 health, x3 damage, x1.25 speed)
attribute @s minecraft:max_health modifier add {ns}:health_scale 1 add_multiplied_base
attribute @s minecraft:attack_damage modifier add {ns}:damage_scale 2 add_multiplied_base
attribute @s[type=!minecraft:evoker] minecraft:movement_speed modifier add {ns}:speed_scale 0.25 add_multiplied_base
data modify entity @s Health set value 2048.0f

# No equipment and set loot table
item replace entity @s weapon.mainhand with stone[item_model="minecraft:air",{COMMON_SIGNAL}]
item replace entity @s armor.head with air
item replace entity @s armor.chest with air
item replace entity @s armor.legs with air
item replace entity @s armor.feet with air
data modify entity @s DeathLootTable set value "{ns}:entities/{loot_table}"

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

	# Stardust bat summon lightning effect on players nearby
	write_function(f"{ns}:mobs/loop/mob_second", f"execute if entity @s[tag={ns}.stardust_bat] run return run function {ns}:mobs/stardust_bat/second")
	Mem.ctx.data[ns].predicates["random/0.1"] = set_json_encoder(Predicate({"condition":"minecraft:random_chance","chance":0.1}))
	write_function(f"{ns}:mobs/stardust_bat/second", f"""
# Every second, 10% chance to summon lightning at nearest player within 10 blocks
execute if predicate {ns}:random/0.1 at @r[gamemode=!spectator,gamemode=!creative,distance=..10] run summon minecraft:lightning_bolt
""")

	# Loot tables
	Mem.ctx.data[ns].loot_tables["entities/stardust_dimension"] = set_json_encoder(LootTable({
		"type": "minecraft:entity",
		"pools": [
			{
				"rolls": 1,
				"bonus_rolls": 0,
				"entries": [
					{
						"weight": 9,
						"type": "minecraft:loot_table",
						"value": f"{ns}:i/stardust_ingot",
						"functions": [
							{
								"function": "minecraft:set_count",
								"count": {
									"min": 1,
									"max": 8
								}
							}
						]
					},
					{
						"weight": 1,
						"type": "minecraft:loot_table",
						"value": f"{ns}:i/stardust_essence"
					}
				]
			}
		]
	}), max_level=-1)
	Mem.ctx.data[ns].loot_tables["entities/stardust_bat"] = set_json_encoder(LootTable({
		"type": "minecraft:entity",
		"pools": [
			{
				"rolls": 1,
				"bonus_rolls": 0,
				"entries": [
					{
						"type": "minecraft:item",
						"weight": 10,
						"name": "minecraft:netherite_scrap",
						"functions": [
							{
								"function": "minecraft:set_count",
								"count": {
									"type": "minecraft:uniform",
									"min": 1,
									"max": 2
								}
							}
						]
					},
					{
						"weight": 9,
						"type": "minecraft:loot_table",
						"value": f"{ns}:i/stardust_ingot",
						"functions": [
							{
								"function": "minecraft:set_count",
								"count": {
									"min": 1,
									"max": 8
								}
							}
						]
					},
					{
						"weight": 1,
						"type": "minecraft:loot_table",
						"value": f"{ns}:i/stardust_essence"
					}
				]
			}
		]
	}
	), max_level=-1)

