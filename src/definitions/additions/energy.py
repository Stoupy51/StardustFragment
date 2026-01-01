
# ruff: noqa: E501
# Imports
from stewbeet import (
	CATEGORY,
	CUSTOM_BLOCK_HEAD,
	CUSTOM_BLOCK_VANILLA,
	CUSTOM_ITEM_VANILLA,
	OVERRIDE_MODEL,
	RESULT_OF_CRAFTING,
	VANILLA_BLOCK,
	WIKI_COMPONENT,
	Ingr,
	JsonDict,
	Mem,
	rainbow_gradient_text,
)
from stouputils import simple_cache, unique_list

from ...utils.common import ROMAN_NUMERALS

# Constants
QUARRY_STATS: list[tuple[int, int, int]] = [
	(125, 20000, 1),
	(250, 60000, 3),
	(375, 100000, 5),
	(500, 140000, 8),
	(625, 180000, 16)
]

# Utility functions
@simple_cache
def quarry_display(i: int) -> tuple[str, str, str]:
	""" Generate the ID, name, and roman numeral for a quarry.

	Args:
		i (int): The level of the quarry (Starting from 0).
	"""
	return f"quarry_lv{i+1}", f"Quarry Lv.{i+1}", ROMAN_NUMERALS[i]


def main_additions() -> None:
	ENERGY: str = "energy"
	ns: str = Mem.ctx.project_id

	# Prepare some recipes
	QUARRY_CRAFTING_RECIPES: dict[str, list[JsonDict]] = {
		"quarry_lv1": [
			{"type":"crafting_shapeless","result_count":1,"category":"misc","ingredients":[
				Ingr("minecraft:barrel"),Ingr("minecraft:crafter"),Ingr("minecraft:barrel"),
				Ingr("minecraft:observer"),Ingr("minecraft:amethyst_shard"),Ingr("minecraft:observer"),
				Ingr("minecraft:diamond_pickaxe"),Ingr("minecraft:diamond_axe"),Ingr("minecraft:diamond_shovel"),
			]},
		],
		"quarry_lv2": [
			{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["WWW","EQE","BBB"],"ingredients":{"W":Ingr("minecraft:warped_fungus"),"E":Ingr("stardust_essence"),"Q":Ingr("quarry_lv1"),"B":Ingr("triple_compressed_cobblestone")}},
		],
		"quarry_lv3": [
			{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["DDD","SQS","BRB"],"ingredients":{"D":Ingr("dragon_pearl"),"S":Ingr("compacted_stardust_shard"),"Q":Ingr("quarry_lv2"),"B":Ingr("quadruple_compressed_cobblestone"),'R':Ingr("minecraft:respawn_anchor")}},
		],
		"quarry_lv4": [
			{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["EEE","NQN","BBB"],"ingredients":{"E":Ingr("ender_dragon_pearl"),"N":Ingr("minecraft:netherite_ingot"),"Q":Ingr("quarry_lv3"),"B":Ingr("quintuple_compressed_cobblestone")}},
		],
		"quarry_lv5": [
			{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["NNN","UQU","BBB"],"ingredients":{"N":Ingr("minecraft:netherite_block"),"U":Ingr("ultimate_shard"),"Q":Ingr("quarry_lv4"),"B":Ingr("sextuple_compressed_cobblestone")}},
			{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["BBB","UQU","NNN"],"ingredients":{"N":Ingr("minecraft:netherite_block"),"U":Ingr("ultimate_shard"),"Q":Ingr("quarry_lv4"),"B":Ingr("sextuple_compressed_cobblestone")}},
		],
	}
	PORTAL_CRAFTING_RECIPES: dict[str, list[JsonDict]] = {
		"cavern_portal": [
			{"type":"crafting_shapeless","result_count":1,"category":"misc","ingredients":8*[Ingr("compressed_cobblestone")] + [Ingr("stardust_fragment")]},
		],
		"celestial_portal": [
			{"type":"crafting_shapeless","result_count":1,"category":"misc","ingredients":[
				Ingr("minecraft:iron_block"),Ingr("minecraft:phantom_membrane"),Ingr("minecraft:iron_block"),
				Ingr("minecraft:phantom_membrane"),Ingr("stardust_fragment"),Ingr("minecraft:phantom_membrane"),
				Ingr("minecraft:iron_block"),Ingr("minecraft:phantom_membrane"),Ingr("minecraft:iron_block"),
			]},
		],
		"stardust_portal": [
			{"type":"crafting_shapeless","result_count":1,"category":"misc","ingredients":[
				Ingr("minecraft:blue_concrete"),Ingr("compacted_stardust_shard"),Ingr("minecraft:blue_concrete"),
				Ingr("compacted_stardust_shard"),Ingr("celestial_portal"),Ingr("compacted_stardust_shard"),
				Ingr("minecraft:blue_concrete"),Ingr("compacted_stardust_shard"),Ingr("minecraft:blue_concrete"),
			]},
		],
		"stardust_dungeon_portal": [
			{"type":"crafting_shapeless","result_count":1,"category":"misc","ingredients":[
				Ingr("awakened_stardust_block"),Ingr("awakened_stardust_ore"),Ingr("awakened_stardust_block"),
				Ingr("awakened_stardust_ore"),Ingr("stardust_portal"),Ingr("awakened_stardust_ore"),
				Ingr("awakened_stardust_block"),Ingr("awakened_stardust_ore"),Ingr("awakened_stardust_block"),
			]},
		],
	}

	# Portal block mapping
	PORTALS_BLOCK: dict[str, str] = {
		"cavern_portal": "minecraft:cobbled_deepslate",
		"celestial_portal": "minecraft:iron_block",
		"stardust_portal": "minecraft:lapis_block",
		"stardust_dungeon_portal": "minecraft:red_nether_bricks",
		"ultimate_portal": "minecraft:crying_obsidian",
	}

	# Give Additional data for every item
	additions: dict[str, JsonDict] = {

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
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["SGS","GCG","SGS"],"ingredients":{"S":Ingr("stardust_block"),"G":Ingr("minecraft:gold_block"),"C":Ingr("elite_cable", "simplenergy")}},
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["GSG","SCS","GSG"],"ingredients":{"S":Ingr("stardust_block"),"G":Ingr("minecraft:gold_block"),"C":Ingr("elite_cable", "simplenergy")}},
			]
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
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["BRB","RCR","BRB"],"ingredients":{"B":Ingr("awakened_stardust_block"),"R":Ingr("minecraft:redstone_block"),"C":Ingr("stardust_cable")}},
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["RBR","BCB","RBR"],"ingredients":{"B":Ingr("awakened_stardust_block"),"R":Ingr("minecraft:redstone_block"),"C":Ingr("stardust_cable")}},
			]
		},
		"ultimate_cable": {
			"id": CUSTOM_BLOCK_HEAD, CATEGORY: ENERGY, "custom_data": {"energy": {"transfer":1920}},
			"item_name": rainbow_gradient_text("Ultimate Cable"),
			"profile": {
				"id": [-709098200,1001541428,-2043264882,-430220135],
				"properties":[{"name":"textures", "value":"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvYzQ4NGE3OGU4YTY5YjZhYWUwNmQ3ZTI2OWM3NWJjZjkxM2U4ZWY3ZDU1Y2Q3ZjY2MjZiZTZjOWIwZjQ2OGQ5MyJ9fX0="}],
			},
			WIKI_COMPONENT: [
				{"text":"Ultimate energy transmission cable.","color":"yellow"},
				{"text":"\nTransfers up to 1920 kW","color":"gray"},
				{"text":"\nUpgraded version of awakened stardust cable","color":"gray"},
			],
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shapeless","result_count":1,"category":"misc","ingredients":[
					Ingr("compacted_stardust_shard"),Ingr("legendarium_ingot"),Ingr("compacted_stardust_shard"),
					Ingr("solarium_ingot"),Ingr("awakened_stardust_cable"),Ingr("darkium_ingot"),
					Ingr("compacted_stardust_shard"),Ingr("stardust_core"),Ingr("compacted_stardust_shard"),
				]},
			]
		},

		# Energy Systems - Batteries
		"stardust_battery": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: ENERGY, "custom_data": {"energy": {"storage":0, "max_storage":200000}},
			VANILLA_BLOCK: {"id":"minecraft:warped_hyphae", "apply_facing":False},
			WIKI_COMPONENT: [
				{"text":"Large-capacity energy storage device.","color":"yellow"},
				{"text":"\nStores up to 200 MJ of energy","color":"gray"},
			],
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["EEE","CBC","SSS"],"ingredients":{"E":Ingr("stardust_essence"),"C":Ingr("compacted_stardust_shard"),"B":Ingr("elite_battery", "simplenergy"),"S":Ingr("stardust_block")}},
			]
		},
		"awakened_stardust_battery": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: ENERGY, "custom_data": {"energy": {"storage":0, "max_storage":500000}},
			VANILLA_BLOCK: {"id":"minecraft:crimson_hyphae", "apply_facing":False},
			WIKI_COMPONENT: [
				{"text":"Enhanced energy storage with awakened stardust.","color":"yellow"},
				{"text":"\nStores up to 500 MJ of energy","color":"gray"},
			],
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["RRR","SBS","AAA"],"ingredients":{"R":Ingr("minecraft:redstone_block"),"S":Ingr("awakened_stardust"),"B":Ingr("stardust_battery"),"A":Ingr("awakened_stardust_block")}},
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["AAA","SBS","RRR"],"ingredients":{"R":Ingr("minecraft:redstone_block"),"S":Ingr("awakened_stardust"),"B":Ingr("stardust_battery"),"A":Ingr("awakened_stardust_block")}},
			]
		},
		"ultimate_battery": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: ENERGY, "custom_data": {"energy": {"storage":0, "max_storage":10000000}},
			VANILLA_BLOCK: {"id":"minecraft:crying_obsidian", "apply_facing":False},
			"item_name": rainbow_gradient_text("Ultimate Battery"),
			WIKI_COMPONENT: [
				{"text":"Ultimate energy storage device.","color":"yellow"},
				{"text":"\nStores up to 10 GJ of energy","color":"gray"},
			],
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["SSS","FBF","CCC"],"ingredients":{"S":Ingr("ultimate_shard"),"F":Ingr("ultimate_frame"),"B":Ingr("awakened_stardust_battery"),"C":Ingr("stardust_core")}},
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["CCC","FBF","SSS"],"ingredients":{"S":Ingr("ultimate_shard"),"F":Ingr("ultimate_frame"),"B":Ingr("awakened_stardust_battery"),"C":Ingr("stardust_core")}},
			]
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
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["CCC","EPE","BBB"],"ingredients":{"C":Ingr("stardust_photovoltaic_cell"),"E":Ingr("stardust_essence"),"P":Ingr("solar_panel", "simplenergy"),"B":Ingr("minecraft:lapis_block")}},
			]
		},
		"awakened_stardust_solar_panel": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: ENERGY, "custom_data": {"energy": {"generation":16, "max_storage":2400}},
			VANILLA_BLOCK: {"id":"minecraft:daylight_detector", "apply_facing":False},
			OVERRIDE_MODEL: {"parent":"block/daylight_detector", "textures": {"side": f"{ns}:item/awakened_stardust_solar_panel_side", "top": f"{ns}:item/awakened_stardust_solar_panel_top"}},
			WIKI_COMPONENT: [
				{"text":"Advanced solar panel with awakened stardust.","color":"yellow"},
				{"text":"\nDouble the power of basic solar panels","color":"gray"},
				{"text":"\nGenerates 16 kW during daylight","color":"gray"},
			],
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["CCC","APA","BBB"],"ingredients":{"C":Ingr("awakened_stardust_photovoltaic_cell"),"A":Ingr("awakened_stardust_block"),"P":Ingr("stardust_solar_panel"),"B":Ingr("minecraft:iron_block")}},
			]
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
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["CCC","EPE","BBB"],"ingredients":{"C":Ingr("legendarium_photovoltaic_cell"),"E":Ingr("legendarium_ingot"),"P":Ingr("awakened_stardust_solar_panel"),"B":Ingr("minecraft:calcite")}},
			]
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
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["CCC","EPE","BBB"],"ingredients":{"C":Ingr("solarium_photovoltaic_cell"),"E":Ingr("solarium_ingot"),"P":Ingr("awakened_stardust_solar_panel"),"B":Ingr("minecraft:calcite")}},
			]
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
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["CCC","EPE","BBB"],"ingredients":{"C":Ingr("darkium_photovoltaic_cell"),"E":Ingr("darkium_ingot"),"P":Ingr("awakened_stardust_solar_panel"),"B":Ingr("simplunium_block", "simplenergy")}},
			]
		},
		"ultimate_solar_panel": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: ENERGY, "custom_data": {"energy": {"generation":128, "max_storage":20000}},
			VANILLA_BLOCK: {"id":"minecraft:daylight_detector", "apply_facing":False},
			"item_name": rainbow_gradient_text("Ultimate Solar Panel"),
			OVERRIDE_MODEL: {"parent":"block/daylight_detector", "textures": {"side": f"{ns}:item/ultimate_solar_panel_side", "top": f"{ns}:item/ultimate_solar_panel_top"}},
			WIKI_COMPONENT: [
				{"text":"Ultimate solar panel combining all three elements.","color":"yellow"},
				{"text":"\nGenerates 128 kW during daylight only","color":"gray"},
			],
			RESULT_OF_CRAFTING: unique_list([
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["CCC","SPS","XYZ"],"ingredients":{
					"C":Ingr("ultimate_photovoltaic_cell"),
					"S":Ingr("ultimate_shard"),
					"P":Ingr(f"{panel}_solar_panel"),
					"X":Ingr(f"{X}_block"),
					"Y":Ingr("stardust_core"),
					"Z":Ingr(f"{Z}_block")
				}}
				for elements in [("legendarium", "solarium", "darkium"), ("darkium", "legendarium", "solarium"), ("solarium", "darkium", "legendarium")]
				for panel in elements
				for X in elements
				for Z in elements
				if panel != X and panel != Z and X != Z
			], method="str")
		},

		# Quarries
		"quarry_configurator": {
			"id": "minecraft:warped_fungus_on_a_stick", CATEGORY: ENERGY,
			"lore": [
				[{"keybind":"key.use","italic":False,"color":"white"},{"text":" to set 1st coordinates","color":"gray"}],
				[{"keybind":"key.sneak","italic":False,"color":"white"},{"text":" + ","color":"gray"},{"keybind":"key.use"},{"text":" to set 2nd coordinates","color":"gray"}],
			],
			OVERRIDE_MODEL: {"parent":"minecraft:item/generated"},
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
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["DD","QQ","QQ"],"ingredients":{"D":Ingr("minecraft:diamond"),"Q":Ingr("minecraft:quartz")}},
			],
		},
		"fortune_module": {
			"id": CUSTOM_ITEM_VANILLA, CATEGORY: ENERGY,
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
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["EDE","DMD","EDE"],"ingredients":{"E":Ingr("minecraft:emerald"),"D":Ingr("minecraft:diamond"),"M":Ingr("empty_module")}},
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["DED","EME","DED"],"ingredients":{"E":Ingr("minecraft:emerald"),"D":Ingr("minecraft:diamond"),"M":Ingr("empty_module")}},
			]
		},
		"silk_touch_module": {
			"id": CUSTOM_ITEM_VANILLA, CATEGORY: ENERGY,
			"max_stack_size": 1,
			"lore": [
				{"text":"Enables silk touch enchantment for the quarry","italic":False,"color":"gray"},
			],
			WIKI_COMPONENT: [
				{"text":"Module that enables silk touch enchantment for compatible machines.","color":"yellow"},
				{"text":"\nPut the module in the dedicated slot of the quarry","color":"gray"},
			],
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shapeless","result_count":1,"category":"misc","ingredients":8*[Ingr("minecraft:iron_ore")] + [Ingr("empty_module")]},
				{"type":"crafting_shapeless","result_count":1,"category":"misc","ingredients":8*[Ingr("minecraft:deepslate_iron_ore")] + [Ingr("empty_module")]},
			]
		},
		"force_load_module": {
			"id": CUSTOM_ITEM_VANILLA, CATEGORY: ENERGY,
			"max_stack_size": 1,
			"lore": [
				{"text":"Force loads the chunk where the quarry is placed","italic":False,"color":"gray"},
			],
			WIKI_COMPONENT: [
				{"text":"Module that force loads the chunk for compatible machines.","color":"yellow"},
				{"text":"\nPrevents the chunk from unloading when no players are nearby","color":"gray"},
				{"text":"\nMachine continues to operate even in unloaded chunks","color":"gray"},
				{"text":"\nPut the module in the dedicated slot of the quarry","color":"gray"},
			],
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shapeless","result_count":1,"category":"misc","ingredients":4*[Ingr("minecraft:respawn_anchor")] + 4*[Ingr("minecraft:glowstone")] + [Ingr("empty_module")]},
			]
		},
		**{
			quarry_display(i)[0]: {
				"id": CUSTOM_BLOCK_VANILLA, CATEGORY: ENERGY,
				"custom_data": {"energy": {"usage":usage, "max_storage":storage}, ns: {"quarry": {"block_per_second":block_per_second}}},
				VANILLA_BLOCK: {"id":"minecraft:barrel", "apply_facing":False},
				"item_name": {"text":quarry_display(i)[1],"italic":False},
				"lore": [
					{"text":f"[Speed: {block_per_second} block/s]","italic":False,"color":"gray"},
				],
				WIKI_COMPONENT: [
					{"text":f"Level {i+1} quarry for automated mining.","color":"yellow"},
					{"text":f"\nMines {block_per_second} blocks per second","color":"gray"},
					{"text":"\nOnly mines blocks in a configured area","color":"gray"},
					{"text":f"\n\nConsumes {usage} kW of power","color":"gray"},
					{"text":f"\nEnergy buffer: {storage//1000} MJ","color":"gray"},
				],
				RESULT_OF_CRAFTING: QUARRY_CRAFTING_RECIPES[quarry_display(i)[0]],
			}
			for i, (usage, storage, block_per_second) in enumerate(QUARRY_STATS)
		},
		"quarry_creative": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: ENERGY,
			"custom_data": {"energy": {"usage":0, "max_storage":1}, ns: {"quarry": {"block_per_second":1000}}},
			VANILLA_BLOCK: {"id":"minecraft:barrel", "apply_facing":False},
			"lore": [
				{"text":"[Speed: 1000 block/s]","italic":False,"color":"gray"},
			],
			"enchantment_glint_override": True,
			WIKI_COMPONENT: [
				{"text":"Creative quarry with unlimited power.","color":"yellow"},
				{"text":"\nRequires no power to operate","color":"gray"},
				{"text":"\nEquivalent to a Level 1000 quarry","color":"gray"},
				{"text":"\nFor creative/testing purposes only","color":"gray"},
			],
		},

		# Portals
		"cavern_portal": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: ENERGY,
			"custom_data": {"energy": {"usage":20, "max_storage":800}},
			VANILLA_BLOCK: {"id": PORTALS_BLOCK["cavern_portal"], "apply_facing":False},
			"item_name": {"text":"Cavern Portal","italic":False,"color":"dark_gray"},
			"lore": [
				{"text":"This portal allows access to a world full of caverns!","italic":False,"color":"white"},
			],
			WIKI_COMPONENT: [
				{"text":"Portal to the Cavern dimension.","color":"yellow"},
				{"text":"\nA world full of underground caverns and caves","color":"gray"},
				{"text":"\n\nMobs: All vanilla mobs (scaled to 0.75x size)","color":"white"},
				{"text":"\nLoot: Ores, minerals, gems (Coal, Copper, Iron, Gold, Lapis, Redstone, Emerald, Diamond)","color":"white"},
				{"text":"\n\nConsumes 20 kW of power","color":"gray"},
				{"text":"\nEnergy buffer: 800 kJ","color":"gray"},
			],
			RESULT_OF_CRAFTING: PORTAL_CRAFTING_RECIPES["cavern_portal"],
		},
		"celestial_portal": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: ENERGY,
			"custom_data": {"energy": {"usage":20, "max_storage":800}},
			VANILLA_BLOCK: {"id": PORTALS_BLOCK["celestial_portal"], "apply_facing":False},
			"item_name": {"text":"Celestial Portal","italic":False,"color":"gray"},
			"lore": [
				{"text":"This portal allows access to a dimension filled with floating islands","italic":False,"color":"white"},
			],
			WIKI_COMPONENT: [
				{"text":"Portal to the Celestial dimension.","color":"yellow"},
				{"text":"\nA dimension filled with floating islands in the sky","color":"gray"},
				{"text":"\n\nMobs: All vanilla mobs (1.5x health, 1.5x damage, 1.1x speed)","color":"white"},
				{"text":"\nLoot: Iron Ingots, Stardust Fragments, Simplunium Ingots","color":"white"},
				{"text":"\nTransitions: Fall down to return to Overworld, go up to Stardust dimension","color":"aqua"},
				{"text":"\n\nConsumes 20 kW of power","color":"gray"},
				{"text":"\nEnergy buffer: 800 kJ","color":"gray"},
			],
			RESULT_OF_CRAFTING: PORTAL_CRAFTING_RECIPES["celestial_portal"],
		},
		"stardust_portal": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: ENERGY,
			"custom_data": {"energy": {"usage":100, "max_storage":6000}},
			VANILLA_BLOCK: {"id": PORTALS_BLOCK["stardust_portal"], "apply_facing":False},
			"item_name": {"text":"Stardust Portal","italic":False,"color":"blue"},
			"lore": [
				{"text":"This portal allows access to the Stardust dimension with lots of powerful mobs!","italic":False,"color":"white"},
			],
			WIKI_COMPONENT: [
				{"text":"Portal to the Stardust dimension.","color":"yellow"},
				{"text":"\nA dangerous dimension with powerful Stardust-corrupted mobs","color":"gray"},
				{"text":"\n\nMobs: Stardust Soldier, Stardust Evoker, Stardust Bat","color":"white"},
				{"text":"\n  - Stardust Soldier/Evoker: 2x health, 3x damage, 1.25x speed","color":"gray"},
				{"text":"\n  - Stardust Bat: Summons lightning at nearby players (10% chance/second)","color":"gray"},
				{"text":"\nLoot: Stardust Ingots, Stardust Essence, Netherite Scraps","color":"white"},
				{"text":"\nTransitions: Fall down to Celestial dimension, go up for Ultimate dimension","color":"aqua"},
				{"text":"\n\nConsumes 100 kW of power","color":"gray"},
				{"text":"\nEnergy buffer: 6 MJ","color":"gray"},
			],
			RESULT_OF_CRAFTING: PORTAL_CRAFTING_RECIPES["stardust_portal"],
		},
		"stardust_dungeon_portal": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: ENERGY,
			"custom_data": {"energy": {"usage":200, "max_storage":12000}},
			VANILLA_BLOCK: {"id": PORTALS_BLOCK["stardust_dungeon_portal"], "apply_facing":False},
			"item_name": {"text":"Stardust Dungeon Portal","italic":False,"color":"red"},
			"lore": [
				{"text":"This portal allows access to the dimension of the Stardust Dungeon!","italic":False,"color":"white"},
			],
			WIKI_COMPONENT: [
				{"text":"Portal to the Stardust Dungeon.","color":"yellow"},
				{"text":"\nA pre-built dungeon dimension with extreme challenges","color":"gray"},
				{"text":"\n\nMobs: All vanilla mobs (3x health, 4x damage, 1.35x speed)","color":"white"},
				{"text":"\nLoot: Awakened Stardust, Stardust Essence","color":"white"},
				{"text":"\nWarning: Extremely dangerous! Prepare well before entering","color":"red"},
				{"text":"\n\nConsumes 200 kW of power","color":"gray"},
				{"text":"\nEnergy buffer: 12 MJ","color":"gray"},
			],
			RESULT_OF_CRAFTING: PORTAL_CRAFTING_RECIPES["stardust_dungeon_portal"],
		},
		"ultimate_portal": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: ENERGY,
			"custom_data": {"energy": {"usage":500, "max_storage":24000}},
			VANILLA_BLOCK: {"id": PORTALS_BLOCK["ultimate_portal"], "apply_facing":False},
			"item_name": rainbow_gradient_text("Ultimate Portal"),
			"lore": [
				{"text":"This portal allows access to the dimension of the Ultimate Boss!","italic":False,"color":"white"},
			],
			WIKI_COMPONENT: [
				{"text":"Portal to the Ultimate dimension.","color":"yellow"},
				{"text":"\nThe ultimate challenge - home of the Ultimate Dragon boss","color":"gray"},
				{"text":"\n\nBoss: Ultimate Dragon (1024 HP)","color":"white"},
				{"text":"\n  - Spawned by consuming Ultimate Dragon Essence","color":"gray"},
				{"text":"\n  - Multiple powerful attacks and mechanics","color":"gray"},
				{"text":"\n  - Summons Ultimate Slaves (512 HP each)","color":"gray"},
				{"text":"\nTransitions: Fall down to return to Stardust dimension","color":"aqua"},
				{"text":"\nWarning: This is the hardest content in the datapack!","color":"red"},
				{"text":"\n\nConsumes 500 kW of power","color":"gray"},
				{"text":"\nEnergy buffer: 24 MJ","color":"gray"},
			],
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shapeless","result_count":1,"category":"misc","ingredients":[
					Ingr("ultimate_shard"),Ingr("ultimate_shard"),Ingr("ultimate_shard"),
					Ingr("ultimate_frame"),Ingr("stardust_dungeon_portal"),Ingr("ultimate_frame"),
					Ingr("minecraft:respawn_anchor"),Ingr("minecraft:respawn_anchor"),Ingr("minecraft:respawn_anchor"),
				]},
			]
		},

		# Other Machines
		"growth_accelerator": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: ENERGY, "custom_data": {"energy": {"usage":100, "max_storage":12000}},
			VANILLA_BLOCK: {"id":"minecraft:diamond_block", "apply_facing":False},
			"lore": [
				{"text":"Only growth seeds in a radius","italic":False,"color":"white"},
				{"text":"of 10 blocks every minute","italic":False,"color":"white"},
			],
			WIKI_COMPONENT: [
				{"text":"Accelerates crop and plant growth.","color":"yellow"},
				{"text":"\nAccelerates growth in 10-block radius","color":"gray"},
				{"text":"\nOperates once per minute when powered","color":"gray"},
				{"text":"\n\nEffects:","color":"aqua"},
				{"text":"\n➤ Vanilla crops: +1 growth stage","color":"white"},
				{"text":"\n➤ Custom growing seeds: +10 minutes of growth time","color":"white"},
				{"text":"\n\nConsumes 100 kW of power","color":"gray"},
				{"text":"\nEnergy buffer: 12 MJ","color":"gray"},
			],
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["EEE","DSD","FFF"],"ingredients":{"E":Ingr("stardust_essence"),"D":Ingr("dog_excrement"),"S":Ingr("diamond_seed"),"F":Ingr("stardust_frame")}},
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["FFF","DSD","EEE"],"ingredients":{"E":Ingr("stardust_essence"),"D":Ingr("dog_excrement"),"S":Ingr("diamond_seed"),"F":Ingr("stardust_frame")}},
			]
		},
		"mob_grinder": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: ENERGY,
			"custom_data": {"energy": {"usage":100, "max_storage":15000}},
			VANILLA_BLOCK: {"id":"minecraft:redstone_block", "apply_facing":"entity"},
			WIKI_COMPONENT: [
				{"text":"Automated mob killing machine.","color":"yellow"},
				{"text":"\nKills mobs in a large area in front of it","color":"gray"},
				{"text":"\n\nConsumes 100 kW of power","color":"gray"},
			],
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["AAA","DSD","FFF"],"ingredients":{"A":Ingr("awakened_stardust_block"),"D":Ingr("ender_dragon_pearl"),"S":Ingr("minecraft:wither_skeleton_skull"),"F":Ingr("awakened_stardust_frame")}},
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["FFF","DSD","AAA"],"ingredients":{"A":Ingr("awakened_stardust_block"),"D":Ingr("ender_dragon_pearl"),"S":Ingr("minecraft:wither_skeleton_skull"),"F":Ingr("awakened_stardust_frame")}},
			]
		},

		# Generators
		"nether_star_generator": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: ENERGY,
			"custom_data": {"energy": {"generation":1500, "max_storage":30000}},
			VANILLA_BLOCK: {"id":"minecraft:furnace", "apply_facing":True},
			WIKI_COMPONENT: [
				{"text":"High-power generator using nether stars.","color":"yellow"},
				{"text":"\nGenerates 1500 kW when supplied with nether stars","color":"gray"},
				{"text":"\nOne nether star provides 15 minutes of fuel","color":"gray"},
			],
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["MMM","NRN","BBB"],"ingredients":{"M":Ingr("machine_block", "simplenergy"),"N":Ingr("minecraft:nether_star"),"R":Ingr("redstone_generator", "simplenergy"),"B":Ingr("minecraft:iron_block")}},
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["BBB","NRN","MMM"],"ingredients":{"M":Ingr("machine_block", "simplenergy"),"N":Ingr("minecraft:nether_star"),"R":Ingr("redstone_generator", "simplenergy"),"B":Ingr("minecraft:iron_block")}},
			]
		},
		"advanced_furnace_generator": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: ENERGY,
			"custom_data": {"energy": {"generation":20, "max_storage":1600}},
			VANILLA_BLOCK: {"id":"minecraft:furnace", "apply_facing":True},
			WIKI_COMPONENT: [
				{"text":"Enhanced furnace generator.","color":"yellow"},
				{"text":"\nGenerates 20 kW when supplied with fuel","color":"gray"},
				{"text":"\nEnergy buffer: 1600 kJ","color":"gray"},
				{"text":"\nMore efficient than basic furnace generator","color":"gray"},
			],
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["MMM","GFG","BBB"],"ingredients":{"M":Ingr("machine_block", "simplenergy"),"G":Ingr("minecraft:glass"),"F":Ingr("furnace_generator", "simplenergy"),"B":Ingr("minecraft:iron_block")}},
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["BBB","GFG","MMM"],"ingredients":{"M":Ingr("machine_block", "simplenergy"),"G":Ingr("minecraft:glass"),"F":Ingr("furnace_generator", "simplenergy"),"B":Ingr("minecraft:iron_block")}},
			]
		},
		"stardust_furnace_generator": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: ENERGY,
			"custom_data": {"energy": {"generation":40, "max_storage":1600}},
			VANILLA_BLOCK: {"id":"minecraft:furnace", "apply_facing":True},
			WIKI_COMPONENT: [
				{"text":"Stardust-enhanced furnace generator.","color":"yellow"},
				{"text":"\nGenerates 40 kW when supplied with fuel","color":"gray"},
				{"text":"\nEnergy buffer: 1600 kJ","color":"gray"},
				{"text":"\nHigher efficiency than advanced generator","color":"gray"},
			],
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["SSS","CFC","BBB"],"ingredients":{"S":Ingr("stardust_frame"),"C":Ingr("compacted_stardust_shard"),"F":Ingr("advanced_furnace_generator"),"B":Ingr("stardust_block")}},
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["BBB","CFC","SSS"],"ingredients":{"S":Ingr("stardust_frame"),"C":Ingr("compacted_stardust_shard"),"F":Ingr("advanced_furnace_generator"),"B":Ingr("stardust_block")}},
			]
		},
		"awakened_stardust_furnace_generator": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: ENERGY,
			"custom_data": {"energy": {"generation":80, "max_storage":1600}},
			VANILLA_BLOCK: {"id":"minecraft:furnace", "apply_facing":True},
			WIKI_COMPONENT: [
				{"text":"Top-tier furnace generator with awakened stardust.","color":"yellow"},
				{"text":"\nGenerates 80 kW when supplied with fuel","color":"gray"},
				{"text":"\nEnergy buffer: 1600 kJ","color":"gray"},
				{"text":"\nMaximum efficiency furnace generator","color":"gray"},
			],
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["AAA","DFD","BBB"],"ingredients":{"A":Ingr("awakened_stardust_frame"),"D":Ingr("ender_dragon_pearl"),"F":Ingr("stardust_furnace_generator"),"B":Ingr("awakened_stardust_block")}},
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["BBB","DFD","AAA"],"ingredients":{"A":Ingr("awakened_stardust_frame"),"D":Ingr("ender_dragon_pearl"),"F":Ingr("stardust_furnace_generator"),"B":Ingr("awakened_stardust_block")}},
			]
		},
	}

	# Vanilla block for cables
	additions["stardust_cable"][VANILLA_BLOCK] = {"apply_facing": False, "id": "minecraft:player_head{profile:" + str(additions["stardust_cable"]["profile"]) + "}"}
	additions["awakened_stardust_cable"][VANILLA_BLOCK] = {"apply_facing": False, "id": "minecraft:player_head{profile:" + str(additions["awakened_stardust_cable"]["profile"]) + "}"}
	additions["ultimate_cable"][VANILLA_BLOCK] = {"apply_facing": False, "id": "minecraft:player_head{profile:" + str(additions["ultimate_cable"]["profile"]) + "}"}

	# Update the definitions with new data
	for k, v in additions.items():
		if k in Mem.definitions:
			Mem.definitions[k].update(v)
		else:
			Mem.definitions[k] = v

