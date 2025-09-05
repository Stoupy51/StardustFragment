
# ruff: noqa: E501
# Imports
from stewbeet.core import *


# Setup machines work and visuals
def setup_machines(gui: dict[str, str]) -> None:
	ns: str = Mem.ctx.project_id

	# Solar panels
	for solar_panel in [x for x in Mem.definitions if x.endswith("_solar_panel")]:
		energy: JsonDict = Mem.definitions[solar_panel]["custom_data"]["energy"]
		content: str = f"""# Produce Energy depending on the power of daylight sensor
execute if predicate simplenergy:check_daylight_power run scoreboard players add @s energy.storage {energy["generation"]}
execute if score @s energy.storage > @s energy.max_storage run scoreboard players operation @s energy.storage = @s energy.max_storage
"""
		write_function(f"{ns}:custom_blocks/{solar_panel}/second", content)
		write_function(f"{ns}:custom_blocks/{solar_panel}/place_secondary", """
# Fix scale
data modify entity @s transformation.scale[1] set value 1.005f
data modify entity @s transformation.translation[1] set value 0.002f
""")

