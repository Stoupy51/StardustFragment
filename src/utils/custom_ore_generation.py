
# Imports
from stewbeet.core import CustomOreGeneration
from stouputils.print import info


# Main function
def setup_custom_ore_generation():

	# Custom Ore generation
	CustomOreGeneration.all_with_config(ore_configs = {
		"stardust_ore": [
			CustomOreGeneration(
				dimensions = ["minecraft:overworld"],
				maximum_height = 50,
				minimum_height = 0,
				veins_per_region = 1,
				vein_size_logic = 0.2,
			)
		],
		"deepslate_stardust_ore": [
			CustomOreGeneration(
				dimensions = ["minecraft:overworld"],
				maximum_height = 0,
				veins_per_region = 1,
				vein_size_logic = 0.2,
			)
		],
	})
	info("All customs ores now generates in the world!")

