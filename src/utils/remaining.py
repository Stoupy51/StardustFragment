
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

	# TODO: pearls, always dragon egg on death, travel staff, snipers, Dog Excrements, etc.

