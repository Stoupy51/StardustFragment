
# Imports
from stewbeet.core import CustomOreGeneration
from stouputils.print import info


# Main function
def setup_custom_ore_generation():

	# Custom Ore generation
	CustomOreGeneration.all_with_config(ore_configs = {
		"stardust_ore": [
			CustomOreGeneration(
				dimensions = ["minecraft:overworld", "stardust:cavern", "stardust:celestial"],
				maximum_height = 50,
				minimum_height = 0,
				veins_per_region = 1,
				vein_size_logic = 0.2,
			)
		],
		"deepslate_stardust_ore": [
			CustomOreGeneration(
				dimensions = ["minecraft:overworld", "stardust:cavern", "stardust:celestial"],
				maximum_height = 0,
				veins_per_region = 1,
				vein_size_logic = 0.2,
			)
		],
		"nether_stardust_ore": [
			CustomOreGeneration(
				dimensions = ["minecraft:the_nether"],
				maximum_height = 120,
				minimum_height = 25,
				veins_per_region = 1,
				vein_size_logic = 0.2,
				provider="#minecraft:nether_carver_replaceables",
			)
		],
		"awakened_stardust_ore": [
			CustomOreGeneration(
				dimensions = ["minecraft:the_nether"],
				maximum_height = 120,
				minimum_height = 25,
				veins_per_region = 1,
				vein_size_logic = 0.2,
				provider="#minecraft:nether_carver_replaceables",
			)
		],
		"ender_stardust_ore": [
			CustomOreGeneration(
				dimensions = ["minecraft:the_end"],
				maximum_height = 80,
				minimum_height = 25,
				veins_per_region = 1,
				vein_size_logic = 0.4,
				provider="minecraft:end_stone",
			)
		],
	})
	info("All customs ores now generates in the world!")

