
# ruff: noqa: E501
# Imports
from stewbeet.core import *
from stouputils.print import info

# Constants
STARDUST_ORE_WIKI: TextComponent = [
	{"text":"Mystical ore containing stardust fragments.","color":"yellow"},
	{"text":"\nFound in all dimensions at various levels","color":"gray"},
	{"text":"\nMine to obtain Stardust Fragments","color":"gray"},
	{"text":"\nUsed to create advanced materials and energy systems","color":"gray"}
]
ENERGY_LORE: TextComponent = [
	{"text":"Advanced energy system component.","color":"yellow"},
	{"text":"\nPart of the Stardust Fragment energy network","color":"gray"}
]


def main_additions() -> None:
	ENERGY: str = "energy"
	MATERIALS: str = "materials"
	TOOLS: str = "tools"
	MISC: str = "miscellaneous"

	# Give Additional data for every item
	additions = {

		# Ores
		"stardust_ore": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: MATERIALS,
			VANILLA_BLOCK: VANILLA_BLOCK_FOR_ORES,
			NO_SILK_TOUCH_DROP: "stardust_fragment",
			WIKI_COMPONENT: STARDUST_ORE_WIKI,
		},
		"deepslate_stardust_ore": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: MATERIALS,
			VANILLA_BLOCK: VANILLA_BLOCK_FOR_ORES,
			NO_SILK_TOUCH_DROP: "stardust_fragment",
			WIKI_COMPONENT: [
				{"text":"Deepslate variant of stardust ore.","color":"yellow"},
				{"text":"\nFound in deepslate layers below Y=0","color":"gray"},
				{"text":"\nSame properties as regular stardust ore","color":"gray"},
			],
		},
		"nether_stardust_ore": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: MATERIALS,
			VANILLA_BLOCK: VANILLA_BLOCK_FOR_ORES,
			NO_SILK_TOUCH_DROP: "stardust_ingot",
			WIKI_COMPONENT: [
				{"text":"Nether variant of stardust ore.","color":"yellow"},
				{"text":"\nFound throughout the Nether dimension","color":"gray"},
				{"text":"\nHeat-resistant stardust crystals","color":"gray"},
			],
		},
		"ender_stardust_ore": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: MATERIALS,
			VANILLA_BLOCK: VANILLA_BLOCK_FOR_ORES,
			NO_SILK_TOUCH_DROP: "stardust_essence",
			WIKI_COMPONENT: [
				{"text":"End dimension stardust ore.","color":"yellow"},
				{"text":"\nFound in the End dimension","color":"gray"},
				{"text":"\nContains void-touched stardust","color":"gray"},
			],
		},

		# Basic Materials
		"stardust_fragment": {
			"id": CUSTOM_ITEM_VANILLA, CATEGORY: MATERIALS,
			WIKI_COMPONENT: [
				{"text":"The fundamental building block of stardust technology.","color":"yellow"},
				{"text":"\nMined from Stardust Ore found in all dimensions","color":"gray"},
				{"text":"\nUsed to craft ingots, tools, armor, and machines","color":"gray"},
			],
		},
		"stardust_ingot": {
			"id": CUSTOM_ITEM_VANILLA, CATEGORY: MATERIALS,
			WIKI_COMPONENT: [
				{"text":"Refined stardust material for advanced crafting.","color":"yellow"},
				{"text":"\nCrafted from Stardust Fragments","color":"gray"},
				{"text":"\nUsed in tool, armor, and machine construction","color":"gray"},
			],
		},
		"stardust_block": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: MATERIALS,
			VANILLA_BLOCK: {"id":"minecraft:lapis_block", "apply_facing":False},
			WIKI_COMPONENT: [
				{"text":"Compressed stardust for storage and building.","color":"yellow"},
				{"text":"\nCrafted from 9 Stardust Ingots","color":"gray"},
				{"text":"\nUsed in advanced constructions","color":"gray"},
			],
		},
		"stardust_essence": {
			"id": CUSTOM_ITEM_VANILLA, CATEGORY: MATERIALS,
			WIKI_COMPONENT: [
				{"text":"Concentrated stardust energy in crystalline form.","color":"yellow"},
				{"text":"\nCrafted from Stardust Ingots","color":"gray"},
				{"text":"\nUsed in high-tier crafting recipes","color":"gray"},
			],
		},
		"stardust_core": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: MATERIALS,
			VANILLA_BLOCK: {"id":"minecraft:diamond_block", "apply_facing":False},
			WIKI_COMPONENT: [
				{"text":"Central component of stardust technology.","color":"yellow"},
				{"text":"\nCrafted from Stardust Essences","color":"gray"},
				{"text":"\nUsed in high-tier crafting recipes","color":"gray"},
			]
		},
		"compacted_stardust": {
			"id": CUSTOM_ITEM_VANILLA, CATEGORY: MATERIALS,
			WIKI_COMPONENT: [
				{"text":"Central component of stardust technology.","color":"yellow"},
				{"text":"\nCrafted from Stardust Essences","color":"gray"},
				{"text":"\nUsed in high-tier crafting recipes","color":"gray"},
			]
		},
		"very_compacted_stardust": {
			"id": CUSTOM_ITEM_VANILLA, CATEGORY: MATERIALS,
			WIKI_COMPONENT: [
				{"text":"Central component of stardust technology.","color":"yellow"},
				{"text":"\nCrafted from Stardust Essences","color":"gray"},
				{"text":"\nUsed in high-tier crafting recipes","color":"gray"},
			]
		},
		"awakened_stardust": {
			"id": CUSTOM_ITEM_VANILLA, CATEGORY: MATERIALS,
			WIKI_COMPONENT: [
				{"text":"Enhanced stardust with increased energy potential.","color":"yellow"},
				{"text":"\nCrafted using special awakening processes","color":"gray"},
				{"text":"\nRequired for advanced equipment and machines","color":"gray"},
			],
		},
		"awakened_stardust_block": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: MATERIALS,
			VANILLA_BLOCK: {"id":"minecraft:redstone_block", "apply_facing":False},
			WIKI_COMPONENT: [
				{"text":"Compressed awakened stardust block.","color":"yellow"},
				{"text":"\nCrafted from 9 Awakened Stardust","color":"gray"},
				{"text":"\nUsed in ultimate constructions","color":"gray"},
			],
		},
		"dragon_pearl": {
			"id": CUSTOM_ITEM_VANILLA, CATEGORY: MATERIALS,
			"item_name": {"text":"Dragon Pearl","italic":False,"color":"dark_purple"},
			WIKI_COMPONENT: [
				{"text":"Rare crystalline structure with draconic energy.","color":"yellow"},
				{"text":"\nDropped by defeated dragons","color":"gray"},
				{"text":"\nUsed in ultimate-tier crafting","color":"gray"},
			],
		},
		"ender_dragon_pearl": {
			"id": CUSTOM_ITEM_VANILLA, CATEGORY: MATERIALS,
			"item_name": [{"text":"Ender ","italic":False,"color":"dark_aqua"},{"text":"Dragon Pearl","italic":False,"color":"dark_purple"}],
			WIKI_COMPONENT: [
				{"text":"Rare crystalline structure with draconic energy.","color":"yellow"},
				{"text":"\nDropped by defeated dragons","color":"gray"},
				{"text":"\nUsed in ultimate-tier crafting","color":"gray"},
			],
		},
		"legendarium_fragment": {
			"id": CUSTOM_ITEM_VANILLA, CATEGORY: MATERIALS,
			WIKI_COMPONENT: [
				{"text":"Legendary material fragment with immense power.","color":"yellow"},
				{"text":"\nExtremely rare and valuable","color":"gray"},
				{"text":"\nUsed for legendarium-tier equipment","color":"gray"},
			],
		},
		"legendarium_ingot": {
			"id": CUSTOM_ITEM_VANILLA, CATEGORY: MATERIALS,
			WIKI_COMPONENT: [
				{"text":"Refined legendarium material.","color":"yellow"},
				{"text":"\nSmelted from Legendarium Fragments","color":"gray"},
				{"text":"\nUsed for legendarium equipment","color":"gray"},
			],
		},
		"legendarium_block": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: MATERIALS,
			VANILLA_BLOCK: {"id":"minecraft:diamond_block", "apply_facing":False},
			WIKI_COMPONENT: [
				{"text":"Compressed legendarium storage block.","color":"yellow"},
				{"text":"\nCrafted from 9 Legendarium Ingots","color":"gray"},
				{"text":"\nExtremely durable construction material","color":"gray"},
			],
		},
		"solarium_fragment": {
			"id": CUSTOM_ITEM_VANILLA, CATEGORY: MATERIALS,
			WIKI_COMPONENT: [
				{"text":"Solarium material fragment with immense power.","color":"yellow"},
				{"text":"\nExtremely rare and valuable","color":"gray"},
				{"text":"\nUsed for solarium-tier equipment","color":"gray"},
			],
		},
		"solarium_ingot": {
			"id": CUSTOM_ITEM_VANILLA, CATEGORY: MATERIALS,
			WIKI_COMPONENT: [
				{"text":"Refined solarium material.","color":"yellow"},
				{"text":"\nSmelted from Solarium Fragments","color":"gray"},
				{"text":"\nUsed for solarium equipment","color":"gray"},
			],
		},
		"solarium_block": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: MATERIALS,
			VANILLA_BLOCK: {"id":"minecraft:diamond_block", "apply_facing":False},
			WIKI_COMPONENT: [
				{"text":"Compressed solarium storage block.","color":"yellow"},
				{"text":"\nCrafted from 9 Solarium Ingots","color":"gray"},
				{"text":"\nExtremely durable construction material","color":"gray"},
			],
		},
		"darkium_fragment": {
			"id": CUSTOM_ITEM_VANILLA, CATEGORY: MATERIALS,
			WIKI_COMPONENT: [
				{"text":"Darkium material fragment with immense power.","color":"yellow"},
				{"text":"\nExtremely rare and valuable","color":"gray"},
				{"text":"\nUsed for darkium-tier equipment","color":"gray"},
			],
		},
		"darkium_ingot": {
			"id": CUSTOM_ITEM_VANILLA, CATEGORY: MATERIALS,
			WIKI_COMPONENT: [
				{"text":"Refined darkium material.","color":"yellow"},
				{"text":"\nSmelted from Darkium Fragments","color":"gray"},
				{"text":"\nUsed for darkium equipment","color":"gray"},
			],
		},
		"darkium_block": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: MATERIALS,
			VANILLA_BLOCK: {"id":"minecraft:diamond_block", "apply_facing":False},
			WIKI_COMPONENT: [
				{"text":"Compressed darkium storage block.","color":"yellow"},
				{"text":"\nCrafted from 9 Darkium Ingots","color":"gray"},
				{"text":"\nExtremely durable construction material","color":"gray"},
			],
		},
		"ultimate_fragment": {
			"id": CUSTOM_ITEM_VANILLA, CATEGORY: MATERIALS,
			WIKI_COMPONENT: [
				{"text":"The pinnacle of material science and energy.","color":"yellow"},
				{"text":"\nCombines all advanced materials","color":"gray"},
				{"text":"\nUsed for ultimate-tier equipment and machines","color":"gray"},
			],
		},
		"ultimate_ingot": {
			"id": CUSTOM_ITEM_VANILLA, CATEGORY: MATERIALS,
			WIKI_COMPONENT: [
				{"text":"The ultimate refined material.","color":"yellow"},
				{"text":"\nSmelted from Ultimate Fragments","color":"gray"},
				{"text":"\nUsed for ultimate equipment","color":"gray"},
			],
		},
		"ultimate_core": {
			"id": CUSTOM_ITEM_VANILLA, CATEGORY: MATERIALS,
			WIKI_COMPONENT: [
				{"text":"The ultimate refined material.","color":"yellow"},
				{"text":"\nSmelted from Ultimate Fragments","color":"gray"},
				{"text":"\nUsed for ultimate equipment","color":"gray"},
			],
		},
		"dog_excrement": {
			"id": CUSTOM_ITEM_VANILLA, CATEGORY: MISC,
			"item_name": {"text":"Dog Excrement","italic":False,"color":"#582900"},
			WIKI_COMPONENT: [
				{"text":"A smelly piece of dog excrement.","color":"brown"},
				{"text":"\nUsed for comedic purposes","color":"gray"},
				{"text":"\nNot useful for crafting","color":"gray"},
			],
		},
		**{
			f"{tier}_cobblestone": {
				"id": CUSTOM_BLOCK_VANILLA, CATEGORY: MATERIALS,
				VANILLA_BLOCK: {"id":"minecraft:deepslate" if i < 4 else "minecraft:obsidian", "apply_facing":False},
				WIKI_COMPONENT: [
					{"text":f"{tier.capitalize()} compressed cobblestone.","color":"yellow"},
					{"text":f"\nEquals to {9**(i+1)} cobblestones","color":"gray"},
				],
			}
			for i, tier in enumerate([
				"compressed", "double_compressed", "triple_compressed", "quadruple_compressed",
				"quintuple_compressed", "sextuple_compressed", "septuple_compressed", "octuple_compressed",
			])
		},
		"stardust_frame": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: MATERIALS,
			VANILLA_BLOCK: {"id":"minecraft:lapis_block", "apply_facing":False},
			WIKI_COMPONENT: [
				{"text":"Enhanced frame made with stardust.","color":"yellow"},
				{"text":"\nUpgraded version of machine frame","color":"gray"},
				{"text":"\nUsed for advanced machines","color":"gray"},
			],
		},
		"awakened_stardust_frame": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: MATERIALS,
			VANILLA_BLOCK: {"id":"minecraft:redstone_block", "apply_facing":False},
			WIKI_COMPONENT: [
				{"text":"Awakened frame made with stardust.","color":"yellow"},
				{"text":"\nFurther upgraded version of machine frame","color":"gray"},
				{"text":"\nUsed for top-tier machines","color":"gray"},
			],
		},
		"ultimate_frame": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: MATERIALS,
			VANILLA_BLOCK: {"id":"minecraft:obsidian", "apply_facing":False},
			WIKI_COMPONENT: [
				{"text":"Ultimate frame made with advanced materials.","color":"yellow"},
				{"text":"\nCrafted from Ultimate Ingots","color":"gray"},
				{"text":"\nUsed for ultimate machines","color":"gray"},
			],
		},
		"mirror": {
			"id": CUSTOM_ITEM_VANILLA, CATEGORY: MATERIALS,
			WIKI_COMPONENT: [
				{"text":"Reflective surface for advanced optics.","color":"yellow"},
				{"text":"\nUsed in energy systems and machines","color":"gray"},
				{"text":"\nCrafted from stardust materials","color":"gray"},
			],
		},
		"stardust_photovoltaic_cell": {
			"id": CUSTOM_ITEM_VANILLA, CATEGORY: MATERIALS,
			WIKI_COMPONENT: [
				{"text":"Photovoltaic cell made from stardust.","color":"yellow"},
				{"text":"\nUsed to convert sunlight into energy","color":"gray"},
				{"text":"\nCrafted from advanced materials","color":"gray"},
			],
		},
		"awakened_photovoltaic_cell": {
			"id": CUSTOM_ITEM_VANILLA, CATEGORY: MATERIALS,
			WIKI_COMPONENT: [
				{"text":"Awakened photovoltaic cell made from stardust.","color":"yellow"},
				{"text":"\nUsed to convert sunlight into energy more efficiently","color":"gray"},
				{"text":"\nCrafted from advanced materials","color":"gray"},
			],
		},
		"legendarium_photovoltaic_cell": {
			"id": CUSTOM_ITEM_VANILLA, CATEGORY: MATERIALS,
			WIKI_COMPONENT: [
				{"text":"Legendarium photovoltaic cell made from stardust.","color":"yellow"},
				{"text":"\nUsed to convert sunlight into energy with legendary efficiency","color":"gray"},
				{"text":"\nCrafted from advanced materials","color":"gray"},
			],
		},
		"solarium_photovoltaic_cell": {
			"id": CUSTOM_ITEM_VANILLA, CATEGORY: MATERIALS,
			WIKI_COMPONENT: [
				{"text":"Solarium photovoltaic cell made from stardust.","color":"yellow"},
				{"text":"\nUsed to convert sunlight into energy with solarium efficiency","color":"gray"},
				{"text":"\nCrafted from advanced materials","color":"gray"},
			],
		},
		"darkium_photovoltaic_cell": {
			"id": CUSTOM_ITEM_VANILLA, CATEGORY: MATERIALS,
			WIKI_COMPONENT: [
				{"text":"Darkium photovoltaic cell made from stardust.","color":"yellow"},
				{"text":"\nUsed to convert sunlight into energy with darkium efficiency","color":"gray"},
				{"text":"\nCrafted from advanced materials","color":"gray"},
			],
		},
		"ultimate_photovoltaic_cell": {
			"id": CUSTOM_ITEM_VANILLA, CATEGORY: MATERIALS,
			WIKI_COMPONENT: [
				{"text":"Ultimate photovoltaic cell made from stardust.","color":"yellow"},
				{"text":"\nUsed to convert sunlight into energy with ultimate efficiency","color":"gray"},
				{"text":"\nCrafted from ultimate materials","color":"gray"},
			],
		},
		"empty_module": {
			"id": CUSTOM_ITEM_VANILLA, CATEGORY: MATERIALS,
			WIKI_COMPONENT: [
				{"text":"Empty module for advanced machinery.","color":"yellow"},
				{"text":"\nCan be filled with various materials","color":"gray"},
				{"text":"\nUsed in crafting and upgrades","color":"gray"},
			],
		},

		# Energy Systems - Cables
		"stardust_cable": {
			"id": CUSTOM_BLOCK_HEAD, CATEGORY: ENERGY,
			"lore": [
				{"text":"[Transfer: 600 kW]","italic":False,"color":"gray"},
			],
			"profile": {
				"id": [-709098200,1001541428,-2043264882,-430220135],
				"properties":[{"name":"textures", "value":"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvM2Y4NDVlMzBlNmVjOGI0N2RmZWUxMzI5NmQzYjQ3NzY5YzVjMGE5Nzc3YzNkNTk2ZWJiNDA3ZmY3OTcwNDE1ZCJ9fX0="}],
			},
			WIKI_COMPONENT: [
				{"text":"High-capacity energy transmission cable.","color":"yellow"},
				{"text":"\nTransfers up to 600 kW","color":"gray"},
				{"text":"\nConnects generators to machines and batteries","color":"gray"},
			],
		},
		"awakened_stardust_cable": {
			"id": CUSTOM_BLOCK_HEAD, CATEGORY: ENERGY,
			"lore": [
				{"text":"[Transfer: 1800 kW]","italic":False,"color":"gray"},
			],
			"profile": {
				"id": [-709098200,1001541428,-2043264882,-430220135],
				"properties":[{"name":"textures", "value":"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvOWQ5ZmE4MTE1Y2MyY2FhNDE2MzA4N2Y1MzU5YTIzZjNmYzAxZjIxZTliMWRjOTE0ZDJkMzBkYTk4ZTZjMDUxYiJ9fX0="}],
			},
			WIKI_COMPONENT: [
				{"text":"Enhanced energy transmission cable.","color":"yellow"},
				{"text":"\nTransfers up to 1800 kW","color":"gray"},
				{"text":"\nUpgraded version of stardust cable","color":"gray"},
			],
		},

		# Energy Systems - Batteries
		"stardust_battery": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: ENERGY,
			VANILLA_BLOCK: {"id":"minecraft:diamond_block", "apply_facing":False},
			"lore": [
				{"text":"[Energy Storage: 200 MJ]","italic":False,"color":"gray"},
			],
			WIKI_COMPONENT: [
				{"text":"Large-capacity energy storage device.","color":"yellow"},
				{"text":"\nStores up to 200 MJ of energy","color":"gray"},
				{"text":"\nConnects to energy networks","color":"gray"},
			],
		},
		"awakened_stardust_battery": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: ENERGY,
			VANILLA_BLOCK: {"id":"minecraft:diamond_block", "apply_facing":False},
			"lore": [
				{"text":"[Energy Storage: 500 MJ]","italic":False,"color":"gray"},
			],
			WIKI_COMPONENT: [
				{"text":"Enhanced energy storage with awakened stardust.","color":"yellow"},
				{"text":"\nStores up to 500 MJ of energy","color":"gray"},
				{"text":"\nFaster charge/discharge rates","color":"gray"},
			],
		},

		# Energy Systems - Solar Panels
		"stardust_solar_panel": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: ENERGY,
			VANILLA_BLOCK: {"id":"minecraft:diamond_block", "apply_facing":False},
			"lore": [
				{"text":"[Generate: 8 kW]","italic":False,"color":"gray"},
				{"text":"[Energy Buffer: 800 kJ]","italic":False,"color":"gray"},
			],
			WIKI_COMPONENT: [
				{"text":"Stardust-enhanced solar energy collector.","color":"yellow"},
				{"text":"\nGenerates 8 kW during daylight","color":"gray"},
				{"text":"\nRequires direct sunlight","color":"gray"},
			],
		},
		"awakened_solar_panel": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: ENERGY,
			VANILLA_BLOCK: {"id":"minecraft:diamond_block", "apply_facing":False},
			"lore": [
				{"text":"[Generate: 16 kW]","italic":False,"color":"gray"},
				{"text":"[Energy Buffer: 1600 kJ]","italic":False,"color":"gray"},
			],
			WIKI_COMPONENT: [
				{"text":"Advanced solar panel with awakened stardust.","color":"yellow"},
				{"text":"\nDouble the power of basic solar panels","color":"gray"},
				{"text":"\nGenerates 16 kW during daylight","color":"gray"},
			],
		},

		# Tools
		"damaged_stardust_sword": {
			"id": "minecraft:stone_sword", CATEGORY: TOOLS,
			"max_damage": 250,
			WIKI_COMPONENT: [
				{"text":"Basic stardust sword with limited durability.","color":"yellow"},
				{"text":"\nEntry-level stardust weapon","color":"gray"},
				{"text":"\nCan be upgraded to reinforced tier","color":"gray"},
			],
		},
		"original_stardust_sword": {
			"id": "minecraft:diamond_sword", CATEGORY: TOOLS,
			"enchantments": {"minecraft:looting": 2},
			WIKI_COMPONENT: [
				{"text":"High-quality stardust sword.","color":"yellow"},
				{"text":"\nEnhanced with Looting II","color":"gray"},
				{"text":"\nBalanced power and durability","color":"gray"},
			],
		},

		# Special Machines
		"growth_accelerator": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: ENERGY,
			VANILLA_BLOCK: {"id":"minecraft:diamond_block", "apply_facing":False},
			"item_name": '{"text":"Growth Accelerator","italic":false,"color":"green"}',
			"lore": [
				{"text":"Only growth seeds in a radius","italic":False,"color":"white"},
				{"text":"of 10 blocks every minute","italic":False,"color":"white"},
				"",
				{"text":"[Power Usage: 100 kW]","italic":False,"color":"gray"},
				{"text":"[Energy Buffer: 12 MJ]","italic":False,"color":"gray"},
			],
			WIKI_COMPONENT: [
				{"text":"Accelerates crop and plant growth.","color":"yellow"},
				{"text":"\nAccelerates growth in 10-block radius","color":"gray"},
				{"text":"\nOperates once per minute when powered","color":"gray"},
				{"text":"\nConsumes 100 kW of power","color":"gray"},
			],
		},

		# Manual
		"manual": {
			"id": "minecraft:written_book", CATEGORY: MISC,
			WIKI_COMPONENT: [
				{"text":"Complete guide to Stardust Fragment technology.","color":"yellow"},
				{"text":"\nContains all recipes and information","color":"gray"},
				{"text":"\nYour comprehensive reference manual","color":"gray"},
			],
		},
	}

	# Update the definitions with new data
	for k, v in additions.items():
		if k in Mem.definitions:
			Mem.definitions[k].update(v)
		else:
			Mem.definitions[k] = v

	# Log success message
	info("Applied StardustFragment item additions successfully!")

