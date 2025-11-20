
# ruff: noqa: E501
# Imports
from stewbeet import *  # type: ignore
from stouputils.io import get_root_path

# Constants
ROOT: str = get_root_path(__file__)

# Setup energy balancing
def setup_remaining() -> None:
	ns: str = Mem.ctx.project_id

	# Right click detection
	write_load_file(f"\n# Right click detection\nscoreboard objectives add {ns}.right_click minecraft.used:minecraft.warped_fungus_on_a_stick\n", prepend=True)
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

	# Advancement for each seed placed
	for seed in [item for item, data in Mem.definitions.items() if GROWING_SEED in data]:
		write_function(f"{ns}:custom_blocks/{seed}/search", f"""
# Grant advancement for placing seed
advancement grant @s only {ns}:visible/adventure/seeds/{seed}
""")

	# Enchantment for ticking mobs
	# Mem.ctx.data[ns].enchantments["ticking"] = set_json_encoder(Enchantment({
	# 	"description": "DEVELOPMENT ONLY: Ticking entity enchantment",
	# 	"supported_items": "minecraft:stone",
	# 	"weight": 1,
	# 	"max_level": 1,
	# 	"min_cost": {"base": 0,"per_level_above_first": 0},
	# 	"max_cost": {"base": 0,"per_level_above_first": 0},
	# 	"anvil_cost": 0,
	# 	"slots": ["any"],
	# 	"effects": {"minecraft:tick": [{"effect": {"type": "minecraft:run_function","function": f"{ns}:utils/enchant_tick"}}]}
	# }), max_level=-1)

	# TODO: pearls, always dragon egg on death, travel staff, snipers, Dog Excrements, etc.
	#advancement grant @s only stardust:visible/stuff/travel_staff
	#advancement grant @s only stardust:visible/adventure/shoot/[copper_nugget, iron_nugget, gold_nugget, stardust_essence, awakened_stardust]
	# stardust:visible/stuff/life_crystal & stardust:visible/stuff/life_crystal_max

