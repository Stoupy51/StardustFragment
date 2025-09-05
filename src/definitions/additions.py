
# ruff: noqa: E501
# Imports
from stewbeet import (
	CATEGORY,
	CUSTOM_BLOCK_HEAD,
	CUSTOM_BLOCK_VANILLA,
	CUSTOM_ITEM_VANILLA,
	NO_SILK_TOUCH_DROP,
	OVERRIDE_MODEL,
	RESULT_OF_CRAFTING,
	VANILLA_BLOCK,
	VANILLA_BLOCK_FOR_ORES,
	WIKI_COMPONENT,
	JsonDict,
	Mem,
	ingr_repr,
)
from stouputils.print import info


def main_additions() -> None:
	ENERGY: str = "energy"
	MATERIALS: str = "materials"
	MISC: str = "miscellaneous"
	ns: str = Mem.ctx.project_id

	# Give Additional data for every item
	additions: dict[str, JsonDict] = {

		# Ores
		"stardust_ore": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: MATERIALS,
			VANILLA_BLOCK: VANILLA_BLOCK_FOR_ORES,
			NO_SILK_TOUCH_DROP: {"id": "stardust_fragment", "count": {"min": 1, "max": 4}},
			WIKI_COMPONENT: [
				{"text":"Primary ore for the datapack.","color":"yellow"},
				{"text":"\nFound in the Overworld between Y=0 and Y=50","color":"gray"},
				{"text":"\nDeepslate variant generates below Y=0","color":"gray"},
				{"text":"\nDrops between 1 and 4 stardust fragments when mined","color":"gray"},
			],
		},
		"deepslate_stardust_ore": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: MATERIALS,
			VANILLA_BLOCK: VANILLA_BLOCK_FOR_ORES,
			NO_SILK_TOUCH_DROP: {"id": "stardust_fragment", "count": {"min": 2, "max": 6}},
			WIKI_COMPONENT: [
				{"text":"Deepslate variant of stardust ore.","color":"yellow"},
				{"text":"\nFound in deepslate layers below Y=0","color":"gray"},
				{"text":"\nDrops between 2 and 6 stardust fragments when mined","color":"gray"},
			],
		},
		"nether_stardust_ore": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: MATERIALS,
			VANILLA_BLOCK: VANILLA_BLOCK_FOR_ORES,
			NO_SILK_TOUCH_DROP: {"id": "stardust_ingot", "count": {"min": 1, "max": 3}},
			WIKI_COMPONENT: [
				{"text":"Nether variant of stardust ore.","color":"yellow"},
				{"text":"\nFound throughout the Nether dimension","color":"gray"},
				{"text":"\nDrops between 1 and 3 stardust ingots when mined","color":"gray"},
			],
		},
		"ender_stardust_ore": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: MATERIALS,
			VANILLA_BLOCK: VANILLA_BLOCK_FOR_ORES,
			NO_SILK_TOUCH_DROP: {"id": "stardust_essence", "count": {"min": 1, "max": 2}},
			WIKI_COMPONENT: [
				{"text":"End dimension stardust ore.","color":"yellow"},
				{"text":"\nFound in the End dimension","color":"gray"},
				{"text":"\nDrops between 1 and 2 stardust essences when mined","color":"gray"},
			],
		},
		"awakened_stardust_ore": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: MATERIALS,
			VANILLA_BLOCK: VANILLA_BLOCK_FOR_ORES,
			NO_SILK_TOUCH_DROP: {"id": "awakened_stardust", "count": {"min": 2, "max": 8}},	# TODO: Add in the manual that mining this ore drops this item
			WIKI_COMPONENT: [
				{"text":"Variant of the nether stardust ore.","color":"yellow"},
				{"text":"\nFound throughout the Nether dimension","color":"gray"},
				{"text":"\nDrops between 2 and 8 awakened stardust when mined","color":"gray"},
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
			# TODO: Recipes (smelting ores, uncrafting ingots, etc.)
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
				{"text":"Compressed stardust for storage and crafting.","color":"yellow"},
				{"text":"\nCrafted from 9 Stardust Ingots","color":"gray"},
			],
			RESULT_OF_CRAFTING:[
				{"type":"crafting_shapeless","result_count":1,"category":"misc","ingredients": 9 * [ingr_repr("stardust_ingot", ns)]},
			],
		},
		"stardust_essence": {
			"id": CUSTOM_ITEM_VANILLA, CATEGORY: MATERIALS,
			WIKI_COMPONENT: [
				{"text":"Concentrated stardust energy.","color":"yellow"},
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
				{"text":"\nUsed in top-tier crafting recipes","color":"gray"},
			]
		},
		"compacted_stardust": {
			"id": CUSTOM_ITEM_VANILLA, CATEGORY: MATERIALS,
			WIKI_COMPONENT: [
				{"text":"Component of stardust technology.","color":"yellow"},
				{"text":"\nCrafted from Stardust Essences","color":"gray"},
				{"text":"\nUsed in high-tier crafting recipes","color":"gray"},
			]
		},
		"very_compacted_stardust": {
			"id": CUSTOM_ITEM_VANILLA, CATEGORY: MATERIALS,
			WIKI_COMPONENT: [
				{"text":"Component of stardust technology.","color":"yellow"},
				{"text":"\nCrafted from Stardust Essences","color":"gray"},
				{"text":"\nUsed in high-tier crafting recipes","color":"gray"},
			]
		},
		"awakened_stardust": {
			"id": CUSTOM_ITEM_VANILLA, CATEGORY: MATERIALS,
			WIKI_COMPONENT: [
				{"text":"Enhanced stardust with increased energy potential.","color":"yellow"},
				{"text":"\nObtained through mining or some special mobs","color":"gray"},
				{"text":"\nRequired for advanced equipment and machines","color":"gray"},
			],
		},
		"awakened_stardust_block": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: MATERIALS,
			VANILLA_BLOCK: {"id":"minecraft:redstone_block", "apply_facing":False},
			WIKI_COMPONENT: [
				{"text":"Compressed awakened stardust block.","color":"yellow"},
				{"text":"\nCrafted from 9 Awakened Stardust","color":"gray"},
				{"text":"\nRequired for advanced equipment and machines","color":"gray"},
			],
		},
		"dragon_pearl": {
			"id": "minecraft:ender_pearl", CATEGORY: MATERIALS,
			"item_name": {"text":"Dragon Pearl","italic":False,"color":"dark_purple"},
			WIKI_COMPONENT: [
				{"text":"Upgraded ender pearl variant","color":"yellow"},
				{"text":"\nThrows x1.5 farther than regular ender pearls","color":"gray"},	# TODO: Implement this behavior
			],
		},
		"ender_dragon_pearl": {
			"id": "minecraft:ender_pearl", CATEGORY: MATERIALS,
			"item_name": [{"text":"Ender ","italic":False,"color":"dark_aqua"},{"text":"Dragon Pearl","italic":False,"color":"dark_purple"}],
			WIKI_COMPONENT: [
				{"text":"Upgraded dragon pearl variant","color":"yellow"},
				{"text":"\nThrows x2 farther than regular ender pearls","color":"gray"},	# TODO: Implement this behavior
				{"text":"\nUsed in high-tier crafting","color":"gray"},
			],
		},
		"legendarium_fragment": {
			"id": CUSTOM_ITEM_VANILLA, CATEGORY: MATERIALS,
			WIKI_COMPONENT: [
				{"text":"Legendary material fragment with wind power.","color":"yellow"},
				{"text":"\nExtremely rare and valuable","color":"gray"},
				{"text":"\nUsed for legendarium-tier equipment","color":"gray"},
			],
		},
		"legendarium_ingot": {
			"id": CUSTOM_ITEM_VANILLA, CATEGORY: MATERIALS,
			WIKI_COMPONENT: [
				{"text":"Refined legendary material with wind power.","color":"yellow"},
				{"text":"\nExtremely rare and valuable","color":"gray"},
				{"text":"\nUsed for legendarium-tier equipment","color":"gray"},
			],
		},
		"legendarium_block": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: MATERIALS,
			VANILLA_BLOCK: {"id":"minecraft:emerald_block", "apply_facing":False},
			WIKI_COMPONENT: [
				{"text":"Compressed legendarium storage block.","color":"yellow"},
				{"text":"\nCrafted from 9 Legendarium Ingots","color":"gray"},
			],
		},
		"solarium_fragment": {
			"id": CUSTOM_ITEM_VANILLA, CATEGORY: MATERIALS,
			WIKI_COMPONENT: [
				{"text":"Solarium material fragment with fire power.","color":"yellow"},
				{"text":"\nExtremely rare and valuable","color":"gray"},
				{"text":"\nUsed for solarium-tier equipment","color":"gray"},
			],
		},
		"solarium_ingot": {
			"id": CUSTOM_ITEM_VANILLA, CATEGORY: MATERIALS,
			WIKI_COMPONENT: [
				{"text":"Refined solarium material with fire power.","color":"yellow"},
				{"text":"\nExtremely rare and valuable","color":"gray"},
				{"text":"\nUsed for solarium-tier equipment","color":"gray"},
			],
		},
		"solarium_block": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: MATERIALS,
			VANILLA_BLOCK: {"id":"minecraft:waxed_copper_block", "apply_facing":False},
			WIKI_COMPONENT: [
				{"text":"Compressed solarium storage block.","color":"yellow"},
				{"text":"\nCrafted from 9 Solarium Ingots","color":"gray"},
			],
		},
		"darkium_fragment": {
			"id": CUSTOM_ITEM_VANILLA, CATEGORY: MATERIALS,
			WIKI_COMPONENT: [
				{"text":"Darkium material fragment with darkness power.","color":"yellow"},
				{"text":"\nExtremely rare and valuable","color":"gray"},
				{"text":"\nUsed for darkium-tier equipment","color":"gray"},
			],
		},
		"darkium_ingot": {
			"id": CUSTOM_ITEM_VANILLA, CATEGORY: MATERIALS,
			WIKI_COMPONENT: [
				{"text":"Refined darkium material with darkness power.","color":"yellow"},
				{"text":"\nExtremely rare and valuable","color":"gray"},
				{"text":"\nUsed for darkium-tier equipment","color":"gray"},
			],
		},
		"darkium_block": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: MATERIALS,
			VANILLA_BLOCK: {"id":"minecraft:netherite_block", "apply_facing":False},
			WIKI_COMPONENT: [
				{"text":"Compressed darkium storage block.","color":"yellow"},
				{"text":"\nCrafted from 9 Darkium Ingots","color":"gray"},
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
				{"text":"A smelly piece of dog excrement.","color":"#582900"},
				{"text":"\nUsed for comedic purposes and boss summoning","color":"gray"},
			],
		},
		**{
			f"{tier}_cobblestone": {
				"id": CUSTOM_BLOCK_VANILLA, CATEGORY: MATERIALS,
				VANILLA_BLOCK: {"id":"minecraft:deepslate" if i < 4 else "minecraft:obsidian", "apply_facing":False},
				WIKI_COMPONENT: [
					{"text":f"{tier.capitalize()} compressed cobblestone.","color":"yellow"},
					{"text":f"\nEquals to {9**(i+1):,} cobblestones","color":"gray"},
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
				{"text":"\nUpgraded version of machine block","color":"gray"},
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
			VANILLA_BLOCK: {"id":"minecraft:crying_obsidian", "apply_facing":False},
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
			"id": CUSTOM_BLOCK_HEAD, CATEGORY: ENERGY, "custom_data": {"energy": {"transfer":480}},
			"profile": {
				"id": [-709098200,1001541428,-2043264882,-430220135],
				"properties":[{"name":"textures", "value":"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvM2Y4NDVlMzBlNmVjOGI0N2RmZWUxMzI5NmQzYjQ3NzY5YzVjMGE5Nzc3YzNkNTk2ZWJiNDA3ZmY3OTcwNDE1ZCJ9fX0="}],
			},
			WIKI_COMPONENT: [
				{"text":"High-capacity energy transmission cable.","color":"yellow"},
				{"text":"\nTransfers up to 480 kW","color":"gray"},
				{"text":"\nConnects generators to machines and batteries","color":"gray"},
			],
		},
		"awakened_stardust_cable": {
			"id": CUSTOM_BLOCK_HEAD, CATEGORY: ENERGY, "custom_data": {"energy": {"transfer":960}},
			"profile": {
				"id": [-709098200,1001541428,-2043264882,-430220135],
				"properties":[{"name":"textures", "value":"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvOWQ5ZmE4MTE1Y2MyY2FhNDE2MzA4N2Y1MzU5YTIzZjNmYzAxZjIxZTliMWRjOTE0ZDJkMzBkYTk4ZTZjMDUxYiJ9fX0="}],
			},
			WIKI_COMPONENT: [
				{"text":"Enhanced energy transmission cable.","color":"yellow"},
				{"text":"\nTransfers up to 960 kW","color":"gray"},
				{"text":"\nUpgraded version of stardust cable","color":"gray"},
			],
		},
		"ultimate_cable": {
			"id": CUSTOM_BLOCK_HEAD, CATEGORY: ENERGY, "custom_data": {"energy": {"transfer":1920}},
			"profile": {
				"id": [-709098200,1001541428,-2043264882,-430220135],
				"properties":[{"name":"textures", "value":"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvYzQ4NGE3OGU4YTY5YjZhYWUwNmQ3ZTI2OWM3NWJjZjkxM2U4ZWY3ZDU1Y2Q3ZjY2MjZiZTZjOWIwZjQ2OGQ5MyJ9fX0="}],
			},
			WIKI_COMPONENT: [
				{"text":"Ultimate energy transmission cable.","color":"yellow"},
				{"text":"\nTransfers up to 1920 kW","color":"gray"},
				{"text":"\nUpgraded version of awakened stardust cable","color":"gray"},
			],
		},

		# Energy Systems - Batteries
		"stardust_battery": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: ENERGY, "custom_data": {"energy": {"storage":0, "max_storage": 200000}},
			VANILLA_BLOCK: {"id":"minecraft:warped_hyphae", "apply_facing":False},
			WIKI_COMPONENT: [
				{"text":"Large-capacity energy storage device.","color":"yellow"},
				{"text":"\nStores up to 200 MJ of energy","color":"gray"},
			],
		},
		"awakened_stardust_battery": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: ENERGY, "custom_data": {"energy": {"storage":0, "max_storage": 500000}},
			VANILLA_BLOCK: {"id":"minecraft:crimson_hyphae", "apply_facing":False},
			WIKI_COMPONENT: [
				{"text":"Enhanced energy storage with awakened stardust.","color":"yellow"},
				{"text":"\nStores up to 500 MJ of energy","color":"gray"},
			],
		},
		"ultimate_battery": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: ENERGY, "custom_data": {"energy": {"storage":0, "max_storage": 1000000}},
			VANILLA_BLOCK: {"id":"minecraft:crying_obsidian", "apply_facing":False},
			WIKI_COMPONENT: [
				{"text":"Ultimate energy storage device.","color":"yellow"},
				{"text":"\nStores up to 1000 MJ of energy","color":"gray"},
			],
		},

		# Energy Systems - Solar Panels
		"stardust_solar_panel": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: ENERGY, "custom_data": {"energy": {"generation":8, "max_storage": 1200}},
			VANILLA_BLOCK: {"id":"minecraft:daylight_detector", "apply_facing":False},
			OVERRIDE_MODEL: {"parent":"block/daylight_detector", "textures": {"side": f"{ns}:item/stardust_solar_panel_side", "top": f"{ns}:item/stardust_solar_panel_top"}},
			WIKI_COMPONENT: [
				{"text":"Stardust-enhanced solar energy collector.","color":"yellow"},
				{"text":"\nGenerates 8 kW during daylight","color":"gray"},
				{"text":"\nRequires direct sunlight","color":"gray"},
			],
		},
		"awakened_solar_panel": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: ENERGY, "custom_data": {"energy": {"generation":16, "max_storage": 2400}},
			VANILLA_BLOCK: {"id":"minecraft:daylight_detector", "apply_facing":False},
			OVERRIDE_MODEL: {"parent":"block/daylight_detector", "textures": {"side": f"{ns}:item/awakened_solar_panel_side", "top": f"{ns}:item/awakened_solar_panel_top"}},
			WIKI_COMPONENT: [
				{"text":"Advanced solar panel with awakened stardust.","color":"yellow"},
				{"text":"\nDouble the power of basic solar panels","color":"gray"},
				{"text":"\nGenerates 16 kW during daylight","color":"gray"},
			],
		},
		"legendarium_solar_panel": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: ENERGY, "custom_data": {"energy": {"generation":32, "max_storage": 4800}},
			VANILLA_BLOCK: {"id":"minecraft:daylight_detector", "apply_facing":False},
			OVERRIDE_MODEL: {"parent":"block/daylight_detector", "textures": {"side": f"{ns}:item/legendarium_solar_panel_side", "top": f"{ns}:item/legendarium_solar_panel_top"}},
			WIKI_COMPONENT: [
				{"text":"Advanced solar panel with legendarium material.","color":"yellow"},
				{"text":"\nDouble the power of awakened solar panels","color":"gray"},
				{"text":"\nGenerates 32 kW during daylight","color":"gray"},
			],
		},
		"solarium_solar_panel": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: ENERGY, "custom_data": {"energy": {"generation":32, "max_storage": 4800}},
			VANILLA_BLOCK: {"id":"minecraft:daylight_detector", "apply_facing":False},
			OVERRIDE_MODEL: {"parent":"block/daylight_detector", "textures": {"side": f"{ns}:item/solarium_solar_panel_side", "top": f"{ns}:item/solarium_solar_panel_top"}},
			WIKI_COMPONENT: [
				{"text":"Advanced solar panel with solarium material.","color":"yellow"},
				{"text":"\nDouble the power of awakened solar panels","color":"gray"},
				{"text":"\nGenerates 32 kW during daylight","color":"gray"},
			],
		},
		"darkium_solar_panel": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: ENERGY, "custom_data": {"energy": {"generation":32, "max_storage": 4800}},
			VANILLA_BLOCK: {"id":"minecraft:daylight_detector", "apply_facing":False},
			OVERRIDE_MODEL: {"parent":"block/daylight_detector", "textures": {"side": f"{ns}:item/darkium_solar_panel_side", "top": f"{ns}:item/darkium_solar_panel_top"}},
			WIKI_COMPONENT: [
				{"text":"Advanced solar panel with darkium material.","color":"yellow"},
				{"text":"\nDouble the power of awakened solar panels","color":"gray"},
				{"text":"\nGenerates 32 kW during nighttime instead of daylight","color":"gray"},
			],
		},
		"ultimate_solar_panel": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: ENERGY, "custom_data": {"energy": {"generation":128, "max_storage": 19200}},
			VANILLA_BLOCK: {"id":"minecraft:daylight_detector", "apply_facing":False},
			OVERRIDE_MODEL: {"parent":"block/daylight_detector", "textures": {"side": f"{ns}:item/ultimate_solar_panel_side", "top": f"{ns}:item/ultimate_solar_panel_top"}},
			WIKI_COMPONENT: [
				{"text":"Ultimate solar panel combining all three elements.","color":"yellow"},
				{"text":"\nGenerates 128 kW during daylight only","color":"gray"},
			],
		},

		# Special Machines
		"growth_accelerator": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: ENERGY,
			VANILLA_BLOCK: {"id":"minecraft:diamond_block", "apply_facing":False},
			"item_name": {"text":"Growth Accelerator","italic":False,"color":"green"},
			"lore": [
				{"text":"Only growth seeds in a radius","italic":False,"color":"white"},
				{"text":"of 10 blocks every minute","italic":False,"color":"white"},
			],
			WIKI_COMPONENT: [
				{"text":"Accelerates crop and plant growth.","color":"yellow"},
				{"text":"\nAccelerates growth in 10-block radius","color":"gray"},
				{"text":"\nOperates once per minute when powered","color":"gray"},
			],
		},
	}
	additions["stardust_cable"][VANILLA_BLOCK] = {"apply_facing": False, "id": "minecraft:player_head{profile:" + str(additions["stardust_cable"]["profile"]) + "}"}
	additions["awakened_stardust_cable"][VANILLA_BLOCK] = {"apply_facing": False, "id": "minecraft:player_head{profile:" + str(additions["awakened_stardust_cable"]["profile"]) + "}"}
	additions["ultimate_cable"][VANILLA_BLOCK] = {"apply_facing": False, "id": "minecraft:player_head{profile:" + str(additions["ultimate_cable"]["profile"]) + "}"}

	additions["manual"] = {
		"id": "minecraft:written_book", "category": MISC,
		RESULT_OF_CRAFTING: [
			# Put a book and a steel ingot in the crafting grid to get the manual
			{"type":"crafting_shapeless","result_count":1,"group":"manual","category":MISC,"ingredients": [ingr_repr("minecraft:book"), ingr_repr("simplunium_ingot", ns)]},

			# Put the manual in the crafting grid to get the manual back (update the manual)
			{"type":"crafting_shapeless","result_count":1,"group":"manual","category":MISC,"ingredients": [ingr_repr("manual", ns)]},
		],
		WIKI_COMPONENT: [
			{"text":"Complete guide to Stardust Fragment technology.","color":"yellow"},
			{"text":"\nContains all recipes and information","color":"gray"},
			{"text":"\nYour comprehensive reference manual","color":"gray"},
		],
	}

	# Update the definitions with new data
	for k, v in additions.items():
		if k in Mem.definitions:
			Mem.definitions[k].update(v)
		else:
			Mem.definitions[k] = v

	# Log success message
	info("Applied StardustFragment item additions successfully!")

