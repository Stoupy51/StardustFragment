
# Imports
from beet import LootTable
from stewbeet.core import Mem, set_json_encoder, write_function


# Setup custom mobs for the Cavern dimension
def main() -> None:
	ns: str = Mem.ctx.project_id

	# Mob conversion function
	write_function(f"{ns}:mobs/convert/cavern", f"""
# Set attributes (x0.75 scale)
attribute @s minecraft:scale modifier add {ns}:scale -0.25 add_multiplied_base

# Set loot table & tags
data modify entity @s DeathLootTable set value "{ns}:entities/cavern_dimension"
tag @s add smithed.entity
""")

	# Loot table
	Mem.ctx.data[ns].loot_tables["entities/cavern_dimension"] = set_json_encoder(LootTable({
		"type": "minecraft:chest",
		"pools": [
			{
				"entries": [
					{
						"type": "minecraft:item",
						"name": name,
						"weight": weight
					}
					for name, weight in [
						("minecraft:flint", 10),
						("minecraft:coal", 25),
						("minecraft:raw_copper", 25),
						("minecraft:raw_iron", 25),
						("minecraft:raw_gold", 25),
						("minecraft:lapis_lazuli", 10),
						("minecraft:redstone", 10),
						("minecraft:emerald", 1),
						("minecraft:diamond", 1)
					]
				],
				"rolls": {
					"type": "minecraft:uniform",
					"min": 1,
					"max": 2
				}
			}
		]
	}), max_level=-1)

