
# Imports
from beet import LootTable
from stewbeet.core import Mem, set_json_encoder, write_function


# Setup custom mobs for the Dungeon dimension
def main() -> None:
	ns: str = Mem.ctx.project_id

	# Mob conversion function
	write_function(f"{ns}:mobs/convert/dungeon", f"""
# Set attributes (x3 health, x4 damage, x1.35 speed)
attribute @s minecraft:max_health modifier add {ns}:health_scale 2 add_multiplied_base
attribute @s minecraft:attack_damage modifier add {ns}:damage_scale 3 add_multiplied_base
attribute @s minecraft:movement_speed modifier add {ns}:speed_scale 0.35 add_multiplied_base
data modify entity @s Health set value 2048.0f

# Set loot table & tags
data modify entity @s DeathLootTable set value "{ns}:entities/dungeon_dimension"
tag @s add smithed.entity

# Join mob team
team join {ns}.mob @s
""")

	# Loot table
	Mem.ctx.data[ns].loot_tables["entities/dungeon_dimension"] = set_json_encoder(LootTable({
		"type": "minecraft:entity",
		"pools": [
			{
				"rolls": {
					"type": "minecraft:uniform",
					"min": 1,
					"max": 8
				},
				"bonus_rolls": 0,
				"entries": [
					{
						"type": "minecraft:loot_table",
						"value": f"{ns}:i/awakened_stardust",
						"functions": [
							{
								"function": "minecraft:set_count",
								"count": {
									"min": 1,
									"max": 2
								},
							}
						]
					},
					{
						"type": "minecraft:loot_table",
						"value": f"{ns}:i/stardust_essence",
						"functions": [
							{
								"function": "minecraft:set_count",
								"count": {
									"min": 1,
									"max": 2
								}
							}
						]
					}
				]
			}
		]
	}), max_level=-1)

