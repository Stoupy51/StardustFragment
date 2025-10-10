
# ruff: noqa: E501
# Imports
from stewbeet import (
	CATEGORY,
	CUSTOM_BLOCK_ALTERNATIVE,
	CUSTOM_BLOCK_HEAD,
	CUSTOM_BLOCK_VANILLA,
	CUSTOM_ITEM_VANILLA,
	GROWING_SEED,
	NO_SILK_TOUCH_DROP,
	OVERRIDE_MODEL,
	RESULT_OF_CRAFTING,
	VANILLA_BLOCK,
	VANILLA_BLOCK_FOR_ORES,
	WIKI_COMPONENT,
	JsonDict,
	Mem,
	TextComponent,
	ingr_repr,
)
from stouputils.print import info

# Constants
SNIPER_BULLETS_WIKI: list[TextComponent] = [
	{"text":"\nPossible bullet types:","color":"gray"},
	{"text":"\n- Copper nugget: +3 damage","color":"gray"},
	{"text":"\n- Iron nugget: +5 damage","color":"gray"},
	{"text":"\n- Gold nugget: +7 damage","color":"gray"},
	{"text":"\n- Stardust Essence: +10 damage","color":"gray"},
	{"text":"\n- Awakened Stardust: +20 damage","color":"gray"},
	{"text":"\n- Ultimate bullet: +35 damage","color":"gray"},
]

def main_additions() -> None:
	ENERGY: str = "energy"
	MATERIALS: str = "materials"
	MISC: str = "miscellaneous"
	EQUIPMENT: str = "equipment"
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
			NO_SILK_TOUCH_DROP: {"id": "awakened_stardust", "count": {"min": 2, "max": 8}},
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
			"use_cooldown": {"seconds": 0.5},
			WIKI_COMPONENT: [
				{"text":"Upgraded ender pearl variant","color":"yellow"},
				{"text":"\nThrows x1.5 farther than regular ender pearls","color":"gray"},	# TODO: Implement this behavior
				{"text":"\nCooldown is 0.5 seconds instead of 1 second","color":"gray"},
			],
		},
		"ender_dragon_pearl": {
			"id": "minecraft:ender_pearl", CATEGORY: MATERIALS,
			"item_name": [{"text":"Ender ","italic":False,"color":"dark_aqua"},{"text":"Dragon Pearl","italic":False,"color":"dark_purple"}],
			"use_cooldown": {"seconds": 0.25},
			WIKI_COMPONENT: [
				{"text":"Upgraded dragon pearl variant","color":"yellow"},
				{"text":"\nThrows x2 farther than regular ender pearls","color":"gray"},	# TODO: Implement this behavior
				{"text":"\nCooldown is 0.25 seconds instead of 1 second","color":"gray"},
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
				"lore": [
					{"text":f"Equivalent to {9**(i+1):,} cobblestones","color":"gray","italic":False},
				],
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
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: ENERGY, "custom_data": {"energy": {"storage":0, "max_storage":200000}},
			VANILLA_BLOCK: {"id":"minecraft:warped_hyphae", "apply_facing":False},
			WIKI_COMPONENT: [
				{"text":"Large-capacity energy storage device.","color":"yellow"},
				{"text":"\nStores up to 200 MJ of energy","color":"gray"},
			],
		},
		"awakened_stardust_battery": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: ENERGY, "custom_data": {"energy": {"storage":0, "max_storage":500000}},
			VANILLA_BLOCK: {"id":"minecraft:crimson_hyphae", "apply_facing":False},
			WIKI_COMPONENT: [
				{"text":"Enhanced energy storage with awakened stardust.","color":"yellow"},
				{"text":"\nStores up to 500 MJ of energy","color":"gray"},
			],
		},
		"ultimate_battery": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: ENERGY, "custom_data": {"energy": {"storage":0, "max_storage":1000000}},
			VANILLA_BLOCK: {"id":"minecraft:crying_obsidian", "apply_facing":False},
			"item_name": {"text":"Ultimate Battery","color":"dark_red"},
			WIKI_COMPONENT: [
				{"text":"Ultimate energy storage device.","color":"yellow"},
				{"text":"\nStores up to 1000 MJ of energy","color":"gray"},
			],
		},

		# Energy Systems - Solar Panels
		"stardust_solar_panel": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: ENERGY, "custom_data": {"energy": {"generation":8, "max_storage":1200}},
			VANILLA_BLOCK: {"id":"minecraft:daylight_detector", "apply_facing":False},
			OVERRIDE_MODEL: {"parent":"block/daylight_detector", "textures": {"side": f"{ns}:item/stardust_solar_panel_side", "top": f"{ns}:item/stardust_solar_panel_top"}},
			WIKI_COMPONENT: [
				{"text":"Stardust-enhanced solar energy collector.","color":"yellow"},
				{"text":"\nGenerates 8 kW during daylight","color":"gray"},
				{"text":"\nRequires direct sunlight","color":"gray"},
			],
		},
		"awakened_solar_panel": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: ENERGY, "custom_data": {"energy": {"generation":16, "max_storage":2400}},
			VANILLA_BLOCK: {"id":"minecraft:daylight_detector", "apply_facing":False},
			OVERRIDE_MODEL: {"parent":"block/daylight_detector", "textures": {"side": f"{ns}:item/awakened_solar_panel_side", "top": f"{ns}:item/awakened_solar_panel_top"}},
			WIKI_COMPONENT: [
				{"text":"Advanced solar panel with awakened stardust.","color":"yellow"},
				{"text":"\nDouble the power of basic solar panels","color":"gray"},
				{"text":"\nGenerates 16 kW during daylight","color":"gray"},
			],
		},
		"legendarium_solar_panel": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: ENERGY, "custom_data": {"energy": {"generation":32, "max_storage":4800}},
			VANILLA_BLOCK: {"id":"minecraft:daylight_detector", "apply_facing":False},
			OVERRIDE_MODEL: {"parent":"block/daylight_detector", "textures": {"side": f"{ns}:item/legendarium_solar_panel_side", "top": f"{ns}:item/legendarium_solar_panel_top"}},
			WIKI_COMPONENT: [
				{"text":"Advanced solar panel with legendarium material.","color":"yellow"},
				{"text":"\nDouble the power of awakened solar panels","color":"gray"},
				{"text":"\nGenerates 32 kW during daylight","color":"gray"},
			],
		},
		"solarium_solar_panel": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: ENERGY, "custom_data": {"energy": {"generation":32, "max_storage":4800}},
			VANILLA_BLOCK: {"id":"minecraft:daylight_detector", "apply_facing":False},
			OVERRIDE_MODEL: {"parent":"block/daylight_detector", "textures": {"side": f"{ns}:item/solarium_solar_panel_side", "top": f"{ns}:item/solarium_solar_panel_top"}},
			WIKI_COMPONENT: [
				{"text":"Advanced solar panel with solarium material.","color":"yellow"},
				{"text":"\nDouble the power of awakened solar panels","color":"gray"},
				{"text":"\nGenerates 32 kW during daylight","color":"gray"},
			],
		},
		"darkium_solar_panel": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: ENERGY, "custom_data": {"energy": {"generation":32, "max_storage":4800}},
			VANILLA_BLOCK: {"id":"minecraft:daylight_detector", "apply_facing":False},
			OVERRIDE_MODEL: {"parent":"block/daylight_detector", "textures": {"side": f"{ns}:item/darkium_solar_panel_side", "top": f"{ns}:item/darkium_solar_panel_top"}},
			WIKI_COMPONENT: [
				{"text":"Advanced solar panel with darkium material.","color":"yellow"},
				{"text":"\nDouble the power of awakened solar panels","color":"gray"},
				{"text":"\nGenerates 32 kW during nighttime instead of daylight","color":"gray"},
			],
		},
		"ultimate_solar_panel": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: ENERGY, "custom_data": {"energy": {"generation":128, "max_storage":20000}},
			VANILLA_BLOCK: {"id":"minecraft:daylight_detector", "apply_facing":False},
			OVERRIDE_MODEL: {"parent":"block/daylight_detector", "textures": {"side": f"{ns}:item/ultimate_solar_panel_side", "top": f"{ns}:item/ultimate_solar_panel_top"}},
			WIKI_COMPONENT: [
				{"text":"Ultimate solar panel combining all three elements.","color":"yellow"},
				{"text":"\nGenerates 128 kW during daylight only","color":"gray"},
			],
		},

		# Quarries
		**{
			f"quarry_lv{i+1}": {
				"id": CUSTOM_BLOCK_VANILLA, CATEGORY: ENERGY,
				"custom_data": {"energy": {"usage":usage, "max_storage":storage}},
				VANILLA_BLOCK: {"id":"minecraft:barrel", "apply_facing":False},
				"item_name": {"text":f"Quarry Lv.{i+1}","italic":False,"color":"white"},
				WIKI_COMPONENT: [
					{"text":f"Level {i+1} quarry for automated mining.","color":"yellow"},
					{"text":f"\nConsumes {usage} kW of power","color":"gray"},
					{"text":f"\nEnergy buffer: {storage//1000} MJ","color":"gray"},
					{"text":"\nMines blocks in a configured area","color":"gray"},
				],
			}
			for i, (usage, storage) in enumerate([(125, 20000), (250, 60000), (375, 100000), (500, 140000), (625, 180000)])
		},
		"quarry_creative": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: ENERGY,
			"custom_data": {"energy": {"usage":0, "max_storage":1}},
			VANILLA_BLOCK: {"id":"minecraft:barrel", "apply_facing":False},
			"item_name": {"text":"Creative Quarry","italic":False,"color":"white"},
			"enchantment_glint_override": True,
			WIKI_COMPONENT: [
				{"text":"Creative quarry with unlimited power.","color":"yellow"},
				{"text":"\nRequires no power to operate","color":"gray"},
				{"text":"\nEquivalent to a Level 1000 quarry","color":"gray"},
				{"text":"\nFor creative/testing purposes only","color":"gray"},
			],
		},

		# Portals
		**{
			portal_name: {
				"id": CUSTOM_BLOCK_VANILLA, CATEGORY: ENERGY,
				"custom_data": {"energy": {"usage":usage, "max_storage":storage}},
				VANILLA_BLOCK: {"id":"minecraft:barrel", "apply_facing":False},
				"item_name": {"text":display_name,"italic":False,"color":color},
				"lore": [
					{"text":description,"italic":False,"color":"white"},
				],
				WIKI_COMPONENT: [
					{"text":f"Portal to {dimension}.","color":"yellow"},
					{"text":f"\n{description}","color":"gray"},
					{"text":f"\nConsumes {usage} kW of power","color":"gray"},
					{"text":f"\nEnergy buffer: {storage//1000 if storage >= 1000 else storage} {'MJ' if storage >= 1000 else 'kJ'}","color":"gray"},
				],
			}
			for portal_name, display_name, color, description, dimension, usage, storage in [
				("cavern_portal", "Cavern Portal", "dark_gray", "This portal allows access to a world full of caverns!", "the Cavern dimension", 20, 800),
				("celestial_portal", "Celestial Portal", "gray", "This portal allows access to a dimension filled with floating islands", "the Celestial dimension", 20, 800),
				("stardust_portal", "Stardust Portal", "blue", "This portal allows access to the Stardust dimension with lots of powerful mobs!", "the Stardust dimension", 100, 6000),
				("stardust_dungeon_portal", "Stardust Dungeon Portal", "red", "This portal allows access to the dimension of the Stardust Dungeon!", "the Stardust Dungeon", 200, 12000),
				# ("legendarium_portal", "Legendarium Portal", "red", "This portal provides access to LEGENDARIUM's dimension", "the Legendarium dimension", 250, 18000),
				# ("solarium_portal", "Solarium Portal", "red", "This portal provides access to SOLARIUM's dimension", "the Solarium dimension", 250, 18000),
				# ("darkium_portal", "Darkium Portal", "red", "This portal provides access to DARKIUM's dimension", "the Darkium dimension", 250, 18000),
			]
		},
		"ultimate_portal": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: ENERGY,
			"custom_data": {"energy": {"usage":500, "max_storage":24000}},
			VANILLA_BLOCK: {"id":"minecraft:barrel", "apply_facing":False},
			"item_name": [
				{"text":"U","italic":False,"color":"dark_purple","bold":True},
				{"text":"l","color":"blue"},
				{"text":"t","color":"dark_aqua"},
				{"text":"i","color":"aqua"},
				{"text":"m","color":"green"},
				{"text":"a","color":"yellow"},
				{"text":"t","color":"gold"},
				{"text":"e","color":"dark_red"},
				{"text":" P","color":"dark_purple"},
				{"text":"o","color":"blue"},
				{"text":"r","color":"dark_aqua"},
				{"text":"t","color":"aqua"},
				{"text":"a","color":"green"},
				{"text":"l","color":"yellow"}
			],
			"lore": [
				{"text":"This portal allows access to the dimension of the Ultimate Boss!","italic":False,"color":"white"},
			],
			WIKI_COMPONENT: [
				{"text":"Portal to the Ultimate Boss dimension.","color":"yellow"},
				{"text":"\nAccess to the most challenging content","color":"gray"},
				{"text":"\nConsumes 500 kW of power","color":"gray"},
				{"text":"\nEnergy buffer: 24 MJ","color":"gray"},
			],
		},

		# Other Machines
		"growth_accelerator": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: ENERGY, "custom_data": {"energy": {"usage":100, "max_storage":12000}},
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
		"mob_grinder": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: ENERGY,
			"custom_data": {"energy": {"usage":100, "max_storage":15000}},
			VANILLA_BLOCK: {"id":"minecraft:barrel", "apply_facing":False},
			"item_name": {"text":"Mob Grinder","italic":False,"color":"white"},
			WIKI_COMPONENT: [
				{"text":"Automated mob killing machine.","color":"yellow"},
				{"text":"\nKills mobs in a large area around it","color":"gray"},
				{"text":"\nConsumes 100 kW of power","color":"gray"},
				{"text":"\nCollects drops automatically","color":"gray"},
			],
		},

		# Generators
		"nether_star_generator": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: ENERGY,
			"custom_data": {"energy": {"generation":1500, "max_storage":30000}},
			VANILLA_BLOCK: {"id":"minecraft:barrel", "apply_facing":False},
			"item_name": {"text":"Nether Star Generator","italic":False,"color":"white"},
			WIKI_COMPONENT: [
				{"text":"High-power generator using nether stars.","color":"yellow"},
				{"text":"\nGenerates 1500 kW when supplied with nether stars","color":"gray"},
				{"text":"\nEnergy buffer: 30 MJ","color":"gray"},
				{"text":"\nConsumes nether stars from inventory","color":"gray"},
			],
		},
		"advanced_furnace_generator": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: ENERGY,
			"custom_data": {"energy": {"generation":20, "max_storage":1600}},
			VANILLA_BLOCK: {"id":"minecraft:barrel", "apply_facing":False},
			"item_name": {"text":"Advanced Furnace Generator","italic":False,"color":"white"},
			WIKI_COMPONENT: [
				{"text":"Enhanced furnace generator.","color":"yellow"},
				{"text":"\nGenerates 20 kW when supplied with fuel","color":"gray"},
				{"text":"\nEnergy buffer: 1600 kJ","color":"gray"},
				{"text":"\nMore efficient than basic furnace generators","color":"gray"},
			],
		},
		"stardust_furnace_generator": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: ENERGY,
			"custom_data": {"energy": {"generation":40, "max_storage":1600}},
			VANILLA_BLOCK: {"id":"minecraft:barrel", "apply_facing":False},
			"item_name": {"text":"Stardust Furnace Generator","italic":False,"color":"white"},
			WIKI_COMPONENT: [
				{"text":"Stardust-enhanced furnace generator.","color":"yellow"},
				{"text":"\nGenerates 40 kW when supplied with fuel","color":"gray"},
				{"text":"\nEnergy buffer: 1600 kJ","color":"gray"},
				{"text":"\nHigher efficiency than advanced generators","color":"gray"},
			],
		},
		"awakened_furnace_generator": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: ENERGY,
			"custom_data": {"energy": {"generation":80, "max_storage":1600}},
			VANILLA_BLOCK: {"id":"minecraft:barrel", "apply_facing":False},
			"item_name": {"text":"Awakened Furnace Generator","italic":False,"color":"white"},
			WIKI_COMPONENT: [
				{"text":"Top-tier furnace generator with awakened stardust.","color":"yellow"},
				{"text":"\nGenerates 80 kW when supplied with fuel","color":"gray"},
				{"text":"\nEnergy buffer: 1600 kJ","color":"gray"},
				{"text":"\nMaximum efficiency furnace generator","color":"gray"},
			],
		},

		# Equipments
		"ultimate_elytra": {
			"id": "minecraft:elytra", CATEGORY: EQUIPMENT,
			"max_damage": 3456,	# x8 the durability of regular elytra (432)
			"attribute_modifiers": [
				{"type":"armor","amount": 10,"operation":"add_value","slot":"chest","id":"stardust:armor.chest"},
				{"type":"armor_toughness","amount": 4,"operation":"add_value","slot":"chest","id":"stardust:armor_toughness.chest"},
				{"type":"knockback_resistance","amount": 0.1,"operation":"add_value","slot":"chest","id":"stardust:knockback_resistance.chest"}
			],
			WIKI_COMPONENT: [
				{"text":"Elytra crafted from ultimate materials.","color":"yellow"},
				{"text":"\nHigher durability (x8) than regular elytra","color":"gray"},
				{"text":"\nProvides armor (10), toughness (4), and knockback resistance (0.1) when worn","color":"gray"},
			],
		},
		"stardust_bow": {
			"id": "minecraft:bow", CATEGORY: EQUIPMENT,
			"max_damage": 768,	# x2 the durability of regular bow (384)
			WIKI_COMPONENT: [
				{"text":"Bow crafted from stardust materials.","color":"yellow"},
				{"text":"\nHigher durability (x2) and power (x1.5) than regular bows","color":"gray"},
				{"text":"\nShooting while sneaking makes no gravity arrows","color":"gray"},	# TODO: Implement this behavior
			],
		},
		"awakened_stardust_bow": {
			"id": "minecraft:bow", CATEGORY: EQUIPMENT,
			"max_damage": 1536,	# x4 the durability of regular bow (384)
			WIKI_COMPONENT: [
				{"text":"Bow crafted from awakened stardust materials.","color":"yellow"},
				{"text":"\nHigher durability (x4) and power (x2) than regular bows","color":"gray"},
				{"text":"\nShooting while sneaking makes no gravity arrows","color":"gray"},
			],
		},
		"ultimate_bow": {
			"id": "minecraft:bow", CATEGORY: EQUIPMENT,
			"max_damage": 3072,	# x8 the durability of regular bow (384)
			WIKI_COMPONENT: [
				{"text":"Bow crafted from ultimate stardust materials.","color":"yellow"},
				{"text":"\nHigher durability (x8) and power (x4) than regular bows","color":"gray"},
				{"text":"\nShooting while sneaking makes no gravity arrows","color":"gray"},
			],
		},
		"stardust_sniper": {
			"id": "minecraft:warped_fungus_on_a_stick", CATEGORY: EQUIPMENT,
			"max_damage": 672,
			WIKI_COMPONENT: [
				{"text":"Sniper crafted from stardust materials.","color":"yellow"},
				{"text":"\nBase damage: 6","color":"gray"},
				{"text":"\nCooldown: 1.00s","color":"gray"},
				*SNIPER_BULLETS_WIKI,
			],
		},
		"awakened_stardust_sniper": {
			"id": "minecraft:warped_fungus_on_a_stick", CATEGORY: EQUIPMENT,
			"max_damage": 1344,
			WIKI_COMPONENT: [
				{"text":"Sniper crafted from awakened stardust materials.","color":"yellow"},
				{"text":"\nBase damage: 12","color":"gray"},
				{"text":"\nCooldown: 0.75s","color":"gray"},
				*SNIPER_BULLETS_WIKI,
			],
		},
		"ultimate_sniper": {
			"id": "minecraft:warped_fungus_on_a_stick", CATEGORY: EQUIPMENT,
			"max_damage": 2688,
			WIKI_COMPONENT: [
				{"text":"Sniper crafted from ultimate stardust materials.","color":"yellow"},
				{"text":"\nBase damage: 24","color":"gray"},
				{"text":"\nCooldown: 0.50s","color":"gray"},
				*SNIPER_BULLETS_WIKI,
			],
		},
		"ultimate_bullet": {
			"id": CUSTOM_ITEM_VANILLA, CATEGORY: EQUIPMENT,
			WIKI_COMPONENT: [
				{"text":"Best ammunition for snipers.","color":"yellow"},
				{"text":"\nCrafted from ultimate materials","color":"gray"},
				{"text":"\n+35 damage when shooting","color":"gray"},
			],
		},
		**{
			f"{artifact}_artifact_lv{i+1 if i < 3 else 'max'}": {
				"id": CUSTOM_ITEM_VANILLA, CATEGORY: EQUIPMENT,
				"item_name": {"text":f"{artifact.capitalize()} Artifact Lv.{i+1 if i < 3 else 'Max'}"},
				"rarity": "epic" if i == 3 else "rare",
				"lore": [
					{"text":f"Hold in any hand to get the {artifact} effect","color":"gray","italic":False},
				],
				"attribute_modifiers": [{"type":attribute,"amount":level/100,"operation":"add_multiplied_total" if artifact != "speed" else "add_multiplied_base","slot":"hand","id":f"stardust:base_{attribute}"}],
				WIKI_COMPONENT: [
					{"text":f"Lv.{i+1 if i < 3 else 'Max'} {artifact} Artifact","color":"yellow"},
					{"text":f"\nHold in any hand to get the {artifact} effect","color":"gray"},
					{"text":f"\n[+{level}% {lore}]","color":"gray"},
				],
			}
			for artifact, lore, attribute, levels in (
				("health", "Health Points", "max_health", (10, 20, 30, 50)),
				("damage", "Damage", "attack_damage", (10, 20, 30, 50)),
				("speed", "Base Speed", "movement_speed", (10, 15, 20, 25))
			)
			for i, level in enumerate(levels)
		},
		"lucky_artifact_bag": {
			"id": CUSTOM_ITEM_VANILLA, CATEGORY: EQUIPMENT,
			"consumable": {"consume_seconds": 1024, "has_consume_particles": False},
			"lore": [
				{"text":"Right-click to open and receive a random artifact.","italic":False,"color":"gray"},
			],
			WIKI_COMPONENT: [
				{"text":"A mysterious bag containing a random artifact.","color":"yellow"},
				{"text":"\nRight-click to open and receive a random artifact","color":"gray"},
				{"text":"\nCan contain Health, Damage, or Speed Artifacts","color":"gray"},
				{"text":"\nThis can be found in various structures","color":"gray"},
			],
		},
		"item_magnet": {
			"id": CUSTOM_ITEM_VANILLA, CATEGORY: EQUIPMENT,
			"lore": [
				{"text":"Hold in offhand to attract items","color":"gray","italic":False},
				{"text":"within a 4 blocks radius","color":"gray","italic":False},
			],
			WIKI_COMPONENT: [
				{"text":"Magnet that attracts nearby items.","color":"yellow"},
				{"text":"\nHold in offhand to attract items within a 4 blocks radius","color":"gray"},
				{"text":"\nUseful for collecting dropped items","color":"gray"},
			],
		},
		"home_travel_staff": {
			"id": CUSTOM_ITEM_VANILLA, CATEGORY: EQUIPMENT,
			"consumable": {"consume_seconds": 1024, "has_consume_particles": False},
			"max_damage": 64,
			WIKI_COMPONENT: [
				{"text":"Staff that teleports you to your spawn point.","color":"yellow"},
				{"text":"\nRight-click to teleport to your bed or world spawn","color":"gray"},
				{"text":"\nHas 64 uses before breaking","color":"gray"},
			],
		},
		"wormhole_potion": {
			"id": CUSTOM_ITEM_VANILLA, CATEGORY: EQUIPMENT,
			"consumable": {"consume_seconds": 1024, "animation": "drink", "has_consume_particles": False},
			"max_stack_size": 16,
		},
		"stardust_apple": {
			"id": CUSTOM_ITEM_VANILLA, CATEGORY: EQUIPMENT,
			"food": {"can_always_eat": True, "nutrition": 4, "saturation": 9.6},	# Golden apple default
			"consumable": {
				"on_consume_effects": [{"type": "minecraft:apply_effects", "effects": [
					{"amplifier": 2, "duration": 100, "id": "minecraft:regeneration", "show_icon": True},	# Regeneration III for 5 seconds
					{"amplifier": 1, "duration": 2400, "id": "minecraft:absorption", "show_icon": True}		# Absorption II for 2 minutes
				]}]
			}
		},
		"life_crystal": {
			"id": CUSTOM_ITEM_VANILLA, CATEGORY: EQUIPMENT,
			"consumable": {
				"consume_seconds": 0.8,
				"animation": "toot_horn",
				"has_consume_particles": False,
				"sound": {"sound_id": f"{ns}:life_crystal", "range": 3}
			},
			"lore": [
				{"text":"Right-click to permanently increase","italic":False,"color":"gray"},
				{"text":"your max health by 1 (0.5 heart)","italic":False,"color":"gray"},
				{"text":"(Max 20 uses: +10 hearts)","italic":False,"color":"gray"},
			],
			WIKI_COMPONENT: [
				{"text":"Crystal that increases your maximum health.","color":"yellow"},
				{"text":"\nFound in underground caves in the overworld","color":"gray"},
				{"text":"\nRight-click to permanently increase max health by 1 (0.5 heart)","color":"gray"},
				{"text":"\nMaximum of 20 uses (+10 hearts)","color":"gray"},
			],
		},
		"life_crystal_block": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: EQUIPMENT,
			VANILLA_BLOCK: {"id":"minecraft:glass", "apply_facing":"entity"},
			NO_SILK_TOUCH_DROP: {"id": "life_crystal", "count": 1},
			WIKI_COMPONENT: [
				{"text":"Decorative block made from life crystals.","color":"yellow"},
				{"text":"\nFound in underground caves in the overworld","color":"gray"},
				{"text":"\nCan be broken to retrieve a life crystal","color":"gray"},
			],
			OVERRIDE_MODEL: {"parent":"block/cube_all","textures":{"all":"minecraft:block/glass","down":f"{ns}:item/life_crystal_block","particle":"minecraft:block/glass"},"elements":[{"name":"crystal","from":[2,2,8],"to":[14,14,8],"faces":{"north":{"uv":[0,0,16,16],"texture":"#down"},"south":{"uv":[16,0,0,16],"texture":"#down"}}},{"name":"glass","from":[0,0,0],"to":[16,16,16],"faces":{"north":{"uv":[0,0,16,16],"texture":"#all"},"east":{"uv":[0,0,16,16],"texture":"#all"},"south":{"uv":[0,0,16,16],"texture":"#all"},"west":{"uv":[0,0,16,16],"texture":"#all"},"up":{"uv":[0,0,16,16],"texture":"#all"},"down":{"uv":[0,0,16,16],"texture":"#all"}}}]}
		},

		# Miscellaneous
		"diamond_seed": {
			"id": CUSTOM_BLOCK_ALTERNATIVE, CATEGORY: MISC,
			VANILLA_BLOCK: {"id":"minecraft:moss_carpet", "apply_facing":False},
			GROWING_SEED: {"texture_basename":"diamond","seconds":1200,"planted_on":"stone","loots":[
				{"id":"minecraft:diamond","rolls":{"type":"minecraft:uniform","min":0,"max":2},"fortune":{"extra":0,"probability":0.1}}
			]},
			"lore": [
				{"text":"Can only be planted on stone.","italic":False,"color":"gray"},
			],
			WIKI_COMPONENT: [
				{"text":"Magical seed that grows diamonds.","color":"yellow"},
				{"text":"\nCan only be planted on stone blocks","color":"gray"},
				{"text":"\nGrows fully after 20 minutes","color":"gray"},
				{"text":"\nYields 0-2 diamonds when harvested","color":"gray"},
				{"text":"\nFortune effect applies (+10% per level)","color":"gray"},
			],
		},
		"advanced_diamond_seed": {
			"id": CUSTOM_BLOCK_ALTERNATIVE, CATEGORY: MISC,
			VANILLA_BLOCK: {"id":"minecraft:moss_carpet", "apply_facing":False},
			GROWING_SEED: {"texture_basename":"advanced_diamond","seconds":1200,"planted_on":"stone","loots":[
				{"id":"minecraft:diamond","rolls":{"type":"minecraft:uniform","min":0,"max":24},"fortune":{"extra":0,"probability":0.1}}
			]},
			"lore": [
				{"text":"Can only be planted on stone.","italic":False,"color":"gray"},
			],
			WIKI_COMPONENT: [
				{"text":"Magical seed that grows diamonds.","color":"yellow"},
				{"text":"\nCan only be planted on stone blocks","color":"gray"},
				{"text":"\nGrows fully after 20 minutes","color":"gray"},
				{"text":"\nYields 0-24 diamonds when harvested","color":"gray"},
				{"text":"\nFortune effect applies (+10% per level)","color":"gray"},
			],
		},
		"stardust_seed": {
			"id": CUSTOM_BLOCK_ALTERNATIVE, CATEGORY: MISC,
			VANILLA_BLOCK: {"id":"minecraft:moss_carpet", "apply_facing":False},
			GROWING_SEED: {"texture_basename":"stardust","seconds":480,"planted_on":"diamond_block","loots":[
				{"id":"stardust_fragment","rolls":{"type":"minecraft:uniform","min":3,"max":9},"fortune":{"extra":0,"probability":0.5}}
			]},
			"lore": [
				{"text":"Can only be planted on diamond block.","italic":False,"color":"gray"},
			],
			WIKI_COMPONENT: [
				{"text":"Magical seed that grows stardust fragments.","color":"yellow"},
				{"text":"\nCan only be planted on diamond blocks","color":"gray"},
				{"text":"\nGrows fully after 8 minutes","color":"gray"},
				{"text":"\nYields 3-9 stardust fragments when harvested","color":"gray"},
				{"text":"\nFortune effect applies (+50% per level)","color":"gray"},
			],
		},
		"advanced_stardust_seed": {
			"id": CUSTOM_BLOCK_ALTERNATIVE, CATEGORY: MISC,
			VANILLA_BLOCK: {"id":"minecraft:moss_carpet", "apply_facing":False},
			GROWING_SEED: {"texture_basename":"advanced_stardust","seconds":960,"planted_on":"diamond_block","loots":[
				{"id":"stardust_ingot","rolls":{"type":"minecraft:uniform","min":1,"max":4},"fortune":{"extra":0,"probability":0.3}}
			]},
			"lore": [
				{"text":"Can only be planted on diamond block.","italic":False,"color":"gray"},
			],
			WIKI_COMPONENT: [
				{"text":"Magical seed that grows stardust ingots.","color":"yellow"},
				{"text":"\nCan only be planted on diamond blocks","color":"gray"},
				{"text":"\nGrows fully after 16 minutes","color":"gray"},
				{"text":"\nYields 1-4 stardust ingots when harvested","color":"gray"},
				{"text":"\nFortune effect applies (+30% per level)","color":"gray"},
			],
		},
		"elite_stardust_seed": {
			"id": CUSTOM_BLOCK_ALTERNATIVE, CATEGORY: MISC,
			VANILLA_BLOCK: {"id":"minecraft:moss_carpet", "apply_facing":False},
			GROWING_SEED: {"texture_basename":"elite_stardust","seconds":1920,"planted_on":"diamond_block","loots":[
				{"id":"stardust_essence","rolls":{"type":"minecraft:uniform","min":1,"max":2},"fortune":{"extra":0,"probability":0.2}}
			]},
			"lore": [
				{"text":"Can only be planted on diamond block.","italic":False,"color":"gray"},
			],
			WIKI_COMPONENT: [
				{"text":"Magical seed that grows stardust essences.","color":"yellow"},
				{"text":"\nCan only be planted on diamond blocks","color":"gray"},
				{"text":"\nGrows fully after 32 minutes","color":"gray"},
				{"text":"\nYields 1-2 stardust essences when harvested","color":"gray"},
				{"text":"\nFortune effect applies (+20% per level)","color":"gray"},
			],
		},
		"legendarium_seed": {
			"id": CUSTOM_BLOCK_ALTERNATIVE, CATEGORY: MISC,
			VANILLA_BLOCK: {"id":"minecraft:moss_carpet", "apply_facing":False},
			GROWING_SEED: {"texture_basename":"legendarium","seconds":3840,"planted_on":"emerald_block","loots":[
				{"id":"legendarium_fragment","rolls":{"type":"minecraft:uniform","min":1,"max":2},"fortune":{"extra":0,"probability":0.1}}
			]},
			"lore": [
				{"text":"Can only be planted on emerald block.","italic":False,"color":"gray"},
			],
			WIKI_COMPONENT: [
				{"text":"Magical seed that grows legendarium.","color":"yellow"},
				{"text":"\nCan only be planted on emerald blocks","color":"gray"},
				{"text":"\nGrows fully after 64 minutes","color":"gray"},
				{"text":"\nYields 1-2 legendarium fragments when harvested","color":"gray"},
				{"text":"\nFortune effect applies (+10% per level)","color":"gray"},
			],
		},
		"solarium_seed": {
			"id": CUSTOM_BLOCK_ALTERNATIVE, CATEGORY: MISC,
			VANILLA_BLOCK: {"id":"minecraft:moss_carpet", "apply_facing":False},
			GROWING_SEED: {"texture_basename":"solarium","seconds":3840,"planted_on":"magma_block","loots":[
				{"id":"solarium_fragment","rolls":{"type":"minecraft:uniform","min":1,"max":2},"fortune":{"extra":0,"probability":0.1}}
			]},
			"lore": [
				{"text":"Can only be planted on magma block.","italic":False,"color":"gray"},
			],
			WIKI_COMPONENT: [
				{"text":"Magical seed that grows solarium.","color":"yellow"},
				{"text":"\nCan only be planted on magma blocks","color":"gray"},
				{"text":"\nGrows fully after 64 minutes","color":"gray"},
				{"text":"\nYields 1-2 solarium fragments when harvested","color":"gray"},
				{"text":"\nFortune effect applies (+10% per level)","color":"gray"},
			],
		},
		"darkium_seed": {
			"id": CUSTOM_BLOCK_ALTERNATIVE, CATEGORY: MISC,
			VANILLA_BLOCK: {"id":"minecraft:moss_carpet", "apply_facing":False},
			GROWING_SEED: {"texture_basename":"darkium","seconds":3840,"planted_on":"obsidian","loots":[
				{"id":"darkium_fragment","rolls":{"type":"minecraft:uniform","min":1,"max":2},"fortune":{"extra":0,"probability":0.1}}
			]},
			"lore": [
				{"text":"Can only be planted on obsidian.","italic":False,"color":"gray"},
			],
			WIKI_COMPONENT: [
				{"text":"Magical seed that grows darkium.","color":"yellow"},
				{"text":"\nCan only be planted on obsidian","color":"gray"},
				{"text":"\nGrows fully after 64 minutes","color":"gray"},
				{"text":"\nYields 1-2 darkium fragments when harvested","color":"gray"},
				{"text":"\nFortune effect applies (+10% per level)","color":"gray"},
			],
		},
		**{
			f"cobblestone_miner_lv{i+1}": {
				"id": CUSTOM_BLOCK_VANILLA, CATEGORY: MISC,
				VANILLA_BLOCK: {"id":"minecraft:deepslate", "apply_facing":False},
				"item_name": {"text":f"Cobblestone Miner Lv.{i+1}"},
				"rarity": "rare" if i < 4 else "epic",
				"lore": [
					{"text":"Only mines cobblestone directly below","color":"white","italic":False},
					{"text":f"[x{9*(5**i):,} per minute]","color":"gray","italic":False},
				],
				WIKI_COMPONENT: [
					{"text":f"Cobblestone Miner Lv.{i+1}","color":"yellow"},
					{"text":"\nEvery minute, it will break the cobblestone directly below it","color":"gray"},
					{"text":f"\nProduction rate is {9*(5**i):,} cobblestone per minute","color":"gray"},
					{"text":"\nNo energy required","color":"gray"},
				],
			}
			for i in range(5)
		},
		"stoupegg": {
			"id": CUSTOM_ITEM_VANILLA, CATEGORY: MISC,
			"consumable": {"animation": "bow", "has_consume_particles": False, "sound": {"sound_id": "stardust:stoupegg_consuming"}},
			"item_name": {"text":"StoupEgg"},
			"rarity": "epic",
			"lore": [
				{"text":"Summoner of the StoupArmy mini-boss","italic":False,"color":"white"},
			],
			WIKI_COMPONENT: [
				{"text":"Mystical egg that summons the StoupArmy mini-boss.","color":"yellow"},
				{"text":"\nUpon defeat, it drops valuable early-game resources","color":"gray"},
				{"text":"\nUse with caution, the improved wolves are strong","color":"gray"},
				{"text":"\nand will automatically target nearby players","color":"gray"},
			],
		},
		"stardust_pillar": {
			"id": CUSTOM_ITEM_VANILLA, CATEGORY: MISC,
			"consumable": {"animation": "bow", "has_consume_particles": False, "sound": {"sound_id": "stardust:pillar_consuming"}},
			"item_name": {"text":"Stardust Pillar"},
			"rarity": "epic",
			"lore": [
				{"text":"Summoner of the Stardust Pillar boss","italic":False,"color":"white"},
			],
			WIKI_COMPONENT: [
				{"text":"Mystical creature that summons the Stardust Pillar boss.","color":"yellow"},
				{"text":"\nUpon defeat, it drops valuable mid-game resources","color":"gray"},
				{"text":"\nalong with a Stardust Dungeon Key","color":"gray"},
				{"text":"\n\nInspired by Terraria's Stardust Pillar,","color":"gray"},
				{"text":"\nthe shield around the boss will be lowered after 50 enemies are killed near it","color":"gray"},
				{"text":"\n(+15 kills required per player in the area, capped at 150)","color":"gray"},
				{"text":"\nThen, the pillar will start to move like a normal wither","color":"gray"},
				{"text":"\nwith more health and damage while still summoning mobs","color":"gray"},
			],
		},
		"stardust_dungeon_key": {
			"id": CUSTOM_ITEM_VANILLA, CATEGORY: MISC,
			"rarity": "epic",
			"lore": [
				{"text":"One-time use key for the Stardust Dungeon","italic":False,"color":"gray"},
			],
			WIKI_COMPONENT: [
				{"text":"Key that allows access to the Stardust Dungeon.","color":"yellow"},
				{"text":"\nObtained by defeating the Stardust Pillar boss","color":"gray"},
				{"text":"\nOnce used, the key will be consumed","color":"gray"},
				{"text":"\nInside the dungeon, face challenging enemies and traps","color":"gray"},
				{"text":"\nto earn valuable rewards","color":"gray"},
			],
		},
		"quarry_configurator": {
			"id": CUSTOM_ITEM_VANILLA, CATEGORY: MISC,
			"lore": [
				[{"keybind":"key.use","italic":False,"color":"white"},{"text":" to set 1st coordinates","color":"gray"}],
				[{"keybind":"key.sneak","italic":False,"color":"white"},{"text":" + ","color":"gray"},{"keybind":"key.use"},{"text":" to set 2nd coordinates","color":"gray"}],
			],
			WIKI_COMPONENT: [
				{"text":"Configurator for setting up quarries.\n","color":"yellow"},
				{"keybind":"key.use","color":"white"},
				{"text":" to set the first corner of the quarry area\n","color":"gray"},
				{"keybind":"key.sneak","color":"white"},
				{"text":" + ","color":"gray"},
				{"keybind":"key.use","color":"white"},
				{"text":" to set the opposite corner of the quarry area","color":"gray"},
				{"text":"\nFinally, just ","color":"gray"},
				{"keybind":"key.use","color":"white"},
				{"text":" the quarry you want to apply the region configuration","color":"gray"},
				{"text":"\nOr put the configurator inside the quarry on the dedicated slot","color":"gray"},
			],
		},
		"fortune_module": {
			"id": CUSTOM_ITEM_VANILLA, CATEGORY: MISC,
			"max_stack_size": 5,
			"lore": [
				{"text":"Increases fortune level of the quarry","italic":False,"color":"gray"},
				{"text":"by 1 (max 5)","italic":False,"color":"gray"},
			],
			WIKI_COMPONENT: [
				{"text":"Module that increases the fortune level of compatible machines.","color":"yellow"},
				{"text":"\nEach module increases fortune by 1, up to a maximum of 5","color":"gray"},
				{"text":"\nPut the module in the dedicated slot of the quarry","color":"gray"},
			],
		},
		"silk_touch_module": {
			"id": CUSTOM_ITEM_VANILLA, CATEGORY: MISC,
			"max_stack_size": 1,
			"lore": [
				{"text":"Enables silk touch enchantment for the quarry","italic":False,"color":"gray"},
			],
			WIKI_COMPONENT: [
				{"text":"Module that enables silk touch enchantment for compatible machines.","color":"yellow"},
				{"text":"\nPut the module in the dedicated slot of the quarry","color":"gray"},
			],
		}
	}

	# Vanilla block for cables
	additions["stardust_cable"][VANILLA_BLOCK] = {"apply_facing": False, "id": "minecraft:player_head{profile:" + str(additions["stardust_cable"]["profile"]) + "}"}
	additions["awakened_stardust_cable"][VANILLA_BLOCK] = {"apply_facing": False, "id": "minecraft:player_head{profile:" + str(additions["awakened_stardust_cable"]["profile"]) + "}"}
	additions["ultimate_cable"][VANILLA_BLOCK] = {"apply_facing": False, "id": "minecraft:player_head{profile:" + str(additions["ultimate_cable"]["profile"]) + "}"}

	# Manual item and recipes
	additions["manual"] = {
		"id": "minecraft:written_book", "category": MISC,
		RESULT_OF_CRAFTING: [
			# Put a book and a steel ingot in the crafting grid to get the manual
			{"type":"crafting_shapeless","result_count":1,"group":"manual","category":MISC,"ingredients": [ingr_repr("minecraft:book"), ingr_repr("stardust_fragment", ns)]},

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

