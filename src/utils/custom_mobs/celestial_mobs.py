
# Imports
from beet import LootTable
from stewbeet.core import Mem, set_json_encoder, write_function


# Setup custom mobs for the Celestial dimension
def main() -> None:
	ns: str = Mem.ctx.project_id

	# Mob conversion function
	write_function(f"{ns}:mobs/convert/celestial", f"""
# Set attributes (x1.5 health, x1.5 damage, x1.1 speed)
attribute @s minecraft:max_health modifier add {ns}:health_scale 0.5 add_multiplied_base
attribute @s minecraft:attack_damage modifier add {ns}:damage_scale 0.5 add_multiplied_base
attribute @s minecraft:movement_speed modifier add {ns}:speed_scale 0.1 add_multiplied_base
data modify entity @s Health set value 2048.0f

# Set loot table & tags
data modify entity @s DeathLootTable set value "{ns}:entities/celestial_dimension"
tag @s add smithed.entity
""")

	# Loot table
	Mem.ctx.data[ns].loot_tables["entities/celestial_dimension"] = set_json_encoder(LootTable({
		"type": "minecraft:entity",
		"pools": [
			{
				"rolls": {
					"min": 1,
					"max": 2
				},
				"bonus_rolls": 0,
				"entries": [
					{
						"type": "minecraft:item",
						"name": "minecraft:iron_ingot"
					},
					{
						"type": "minecraft:loot_table",
						"value": f"{ns}:i/stardust_fragment",
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
						"type": "minecraft:loot_table",
						"value": "simplenergy:i/simplunium_ingot",
						"conditions": [
							{
								"condition": "minecraft:random_chance",
								"chance": 0.5
							}
						]
					}
				]
			}
		]
	}), max_level=-1)

