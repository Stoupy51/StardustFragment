
# Imports
from stewbeet import CustomOreGeneration, Mem, write_function
from stouputils.print import info


# Main function
def setup_custom_ore_generation():
	ns: str = Mem.ctx.project_id

	# Custom Ore generation
	CustomOreGeneration.all_with_config(ore_configs = {

		# Life Crystals
		"life_crystal_block": [
			CustomOreGeneration(
				dimensions = ["minecraft:overworld", "minecraft:nether", "stardust:cavern"],
				maximum_height = 64,
				minimum_height = -32,
				veins_per_region = 1.5,
				vein_size_logic = 0.0,	# Single block veins
				provider=["#minecraft:overworld_carver_replaceables", "#minecraft:nether_carver_replaceables"],
				placer_command=f"positioned ~ ~1 ~ if block ~ ~ ~ #minecraft:air unless block ~ ~-1 ~ lava run function {ns}:custom_blocks/life_crystal_block/place_main"
			)
		],

		# Ores
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

	# Life Crystal Block position retry if not placed
	write_function(f"{ns}:calls/smart_ore_generation/veins/life_crystal_block", f"""
# Try to find a random position below air but not below lava in the region to generate the ore
scoreboard players set #attempts {ns}.data 50
function {ns}:calls/smart_ore_generation/veins/retry/life_crystal_block

# Placing Life Crystal Block patch
execute at @s if block ~ ~ ~ #{ns}:smart_ore_generation/life_crystal_block_provider positioned ~ ~1 ~ if block ~ ~ ~ #minecraft:air unless block ~ ~-1 ~ lava run function {ns}:custom_blocks/life_crystal_block/place_main
""", overwrite=True)  # noqa: E501
	write_function(f"{ns}:calls/smart_ore_generation/veins/retry/life_crystal_block", f"""
# Find a random position in the region and decrease attempts
scoreboard players remove #attempts {ns}.data 1
function #smart_ore_generation:v1/slots/random_position

# Retry if not placed and attempts remaining
execute if score #attempts {ns}.data matches 1.. at @s unless block ~ ~1 ~ air run return run function {ns}:calls/smart_ore_generation/veins/retry/life_crystal_block
execute if score #attempts {ns}.data matches 1.. at @s if block ~ ~-1 ~ lava run return run function {ns}:calls/smart_ore_generation/veins/retry/life_crystal_block
""")

