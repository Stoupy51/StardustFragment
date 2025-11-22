
# ruff: noqa: E501
# Imports
from stewbeet import (
	CATEGORY,
	CUSTOM_BLOCK_HEAD,
	CUSTOM_BLOCK_VANILLA,
	OVERRIDE_MODEL,
	RESULT_OF_CRAFTING,
	VANILLA_BLOCK,
	WIKI_COMPONENT,
	JsonDict,
	Mem,
	ingr_repr,
	rainbow_gradient_text,
	simple_cache,
)
from stouputils.collections import unique_list

from ...utils.common import ROMAN_NUMERALS


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
				ingr_repr("minecraft:barrel"),ingr_repr("minecraft:crafter"),ingr_repr("minecraft:barrel"),
				ingr_repr("minecraft:observer"),ingr_repr("minecraft:amethyst_shard"),ingr_repr("minecraft:observer"),
				ingr_repr("minecraft:diamond_pickaxe"),ingr_repr("minecraft:diamond_axe"),ingr_repr("minecraft:diamond_shovel"),
			]},
		],
		"quarry_lv2": [
			{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["WWW","EQE","BBB"],"ingredients":{"W":ingr_repr("minecraft:warped_fungus"),"E":ingr_repr("stardust_essence"),"Q":ingr_repr("quarry_lv1"),"B":ingr_repr("triple_compressed_cobblestone")}},
		],
		"quarry_lv3": [
			{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["DDD","SQS","BRB"],"ingredients":{"D":ingr_repr("dragon_pearl"),"S":ingr_repr("compacted_stardust_shard"),"Q":ingr_repr("quarry_lv2"),"B":ingr_repr("quadruple_compressed_cobblestone"),'R':ingr_repr("minecraft:respawn_anchor")}},
		],
		"quarry_lv4": [
			{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["EEE","NQN","BBB"],"ingredients":{"E":ingr_repr("ender_dragon_pearl"),"N":ingr_repr("minecraft:netherite_ingot"),"Q":ingr_repr("quarry_lv3"),"B":ingr_repr("quintuple_compressed_cobblestone")}},
		],
		"quarry_lv5": [
			{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["NNN","UQU","BBB"],"ingredients":{"N":ingr_repr("minecraft:netherite_block"),"U":ingr_repr("ultimate_shard"),"Q":ingr_repr("quarry_lv4"),"B":ingr_repr("sextuple_compressed_cobblestone")}},
			{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["BBB","UQU","NNN"],"ingredients":{"N":ingr_repr("minecraft:netherite_block"),"U":ingr_repr("ultimate_shard"),"Q":ingr_repr("quarry_lv4"),"B":ingr_repr("sextuple_compressed_cobblestone")}},
		],
	}
	PORTAL_CRAFTING_RECIPES: dict[str, list[JsonDict]] = {
		"cavern_portal": [
			{"type":"crafting_shapeless","result_count":1,"category":"misc","ingredients":8*[ingr_repr("compressed_cobblestone")] + [ingr_repr("stardust_fragment")]},
		],
		"celestial_portal": [
			{"type":"crafting_shapeless","result_count":1,"category":"misc","ingredients":[
				ingr_repr("minecraft:iron_block"),ingr_repr("minecraft:phantom_membrane"),ingr_repr("minecraft:iron_block"),
				ingr_repr("minecraft:phantom_membrane"),ingr_repr("stardust_fragment"),ingr_repr("minecraft:phantom_membrane"),
				ingr_repr("minecraft:iron_block"),ingr_repr("minecraft:phantom_membrane"),ingr_repr("minecraft:iron_block"),
			]},
		],
		"stardust_portal": [
			{"type":"crafting_shapeless","result_count":1,"category":"misc","ingredients":[
				ingr_repr("minecraft:blue_concrete"),ingr_repr("compacted_stardust_shard"),ingr_repr("minecraft:blue_concrete"),
				ingr_repr("compacted_stardust_shard"),ingr_repr("celestial_portal"),ingr_repr("compacted_stardust_shard"),
				ingr_repr("minecraft:blue_concrete"),ingr_repr("compacted_stardust_shard"),ingr_repr("minecraft:blue_concrete"),
			]},
		],
		"stardust_dungeon_portal": [
			{"type":"crafting_shapeless","result_count":1,"category":"misc","ingredients":[
				ingr_repr("awakened_stardust_block"),ingr_repr("awakened_stardust_ore"),ingr_repr("awakened_stardust_block"),
				ingr_repr("awakened_stardust_ore"),ingr_repr("stardust_portal"),ingr_repr("awakened_stardust_ore"),
				ingr_repr("awakened_stardust_block"),ingr_repr("awakened_stardust_ore"),ingr_repr("awakened_stardust_block"),
			]},
		],
	}

	# Portal block mapping
	PORTALS_BLOCK: dict[str, str] = {
		"cavern_portal": "minecraft:deepslate",
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
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["SGS","GCG","SGS"],"ingredients":{"S":ingr_repr("stardust_block"),"G":ingr_repr("minecraft:gold_block"),"C":ingr_repr("elite_cable", "simplenergy")}},
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["GSG","SCS","GSG"],"ingredients":{"S":ingr_repr("stardust_block"),"G":ingr_repr("minecraft:gold_block"),"C":ingr_repr("elite_cable", "simplenergy")}},
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
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["BRB","RCR","BRB"],"ingredients":{"B":ingr_repr("awakened_stardust_block"),"R":ingr_repr("minecraft:redstone_block"),"C":ingr_repr("stardust_cable")}},
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["RBR","BCB","RBR"],"ingredients":{"B":ingr_repr("awakened_stardust_block"),"R":ingr_repr("minecraft:redstone_block"),"C":ingr_repr("stardust_cable")}},
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
					ingr_repr("compacted_stardust_shard"),ingr_repr("legendarium_ingot"),ingr_repr("compacted_stardust_shard"),
					ingr_repr("solarium_ingot"),ingr_repr("awakened_stardust_cable"),ingr_repr("darkium_ingot"),
					ingr_repr("compacted_stardust_shard"),ingr_repr("stardust_core"),ingr_repr("compacted_stardust_shard"),
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
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["EEE","CBC","SSS"],"ingredients":{"E":ingr_repr("stardust_essence"),"C":ingr_repr("compacted_stardust_shard"),"B":ingr_repr("elite_battery", "simplenergy"),"S":ingr_repr("stardust_block")}},
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
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["RRR","SBS","AAA"],"ingredients":{"R":ingr_repr("minecraft:redstone_block"),"S":ingr_repr("awakened_stardust"),"B":ingr_repr("stardust_battery"),"A":ingr_repr("awakened_stardust_block")}},
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["AAA","SBS","RRR"],"ingredients":{"R":ingr_repr("minecraft:redstone_block"),"S":ingr_repr("awakened_stardust"),"B":ingr_repr("stardust_battery"),"A":ingr_repr("awakened_stardust_block")}},
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
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["SSS","FBF","CCC"],"ingredients":{"S":ingr_repr("ultimate_shard"),"F":ingr_repr("ultimate_frame"),"B":ingr_repr("awakened_stardust_battery"),"C":ingr_repr("stardust_core")}},
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["CCC","FBF","SSS"],"ingredients":{"S":ingr_repr("ultimate_shard"),"F":ingr_repr("ultimate_frame"),"B":ingr_repr("awakened_stardust_battery"),"C":ingr_repr("stardust_core")}},
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
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["CCC","EPE","BBB"],"ingredients":{"C":ingr_repr("stardust_photovoltaic_cell"),"E":ingr_repr("stardust_essence"),"P":ingr_repr("solar_panel", "simplenergy"),"B":ingr_repr("minecraft:lapis_block")}},
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
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["CCC","APA","BBB"],"ingredients":{"C":ingr_repr("awakened_stardust_photovoltaic_cell"),"A":ingr_repr("awakened_stardust_block"),"P":ingr_repr("stardust_solar_panel"),"B":ingr_repr("minecraft:iron_block")}},
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
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["CCC","EPE","BBB"],"ingredients":{"C":ingr_repr("legendarium_photovoltaic_cell"),"E":ingr_repr("legendarium_ingot"),"P":ingr_repr("awakened_stardust_solar_panel"),"B":ingr_repr("minecraft:calcite")}},
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
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["CCC","EPE","BBB"],"ingredients":{"C":ingr_repr("solarium_photovoltaic_cell"),"E":ingr_repr("solarium_ingot"),"P":ingr_repr("awakened_stardust_solar_panel"),"B":ingr_repr("minecraft:calcite")}},
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
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["CCC","EPE","BBB"],"ingredients":{"C":ingr_repr("darkium_photovoltaic_cell"),"E":ingr_repr("darkium_ingot"),"P":ingr_repr("awakened_stardust_solar_panel"),"B":ingr_repr("simplunium_block", "simplenergy")}},
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
					"C":ingr_repr("ultimate_photovoltaic_cell"),
					"S":ingr_repr("ultimate_shard"),
					"P":ingr_repr(f"{panel}_solar_panel"),
					"X":ingr_repr(f"{X}_block"),
					"Y":ingr_repr("stardust_core"),
					"Z":ingr_repr(f"{Z}_block")
				}}
				for elements in [("legendarium", "solarium", "darkium"), ("darkium", "legendarium", "solarium"), ("solarium", "darkium", "legendarium")]
				for panel in elements
				for X in elements
				for Z in elements
				if panel != X and panel != Z and X != Z
			], method="str")
		},

		# Quarries
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
					{"text":f"\nConsumes {usage} kW of power","color":"gray"},
					{"text":f"\nEnergy buffer: {storage//1000} MJ","color":"gray"},
					{"text":"\nOnly mines blocks in a configured area","color":"gray"},
				],
				RESULT_OF_CRAFTING: QUARRY_CRAFTING_RECIPES[quarry_display(i)[0]],
			}
			for i, (usage, storage, block_per_second) in enumerate([(125, 20000, 1), (250, 60000, 3), (375, 100000, 5), (500, 140000, 8), (625, 180000, 16)])
		},
		"quarry_creative": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: ENERGY,
			"custom_data": {"energy": {"usage":0, "max_storage":1}, ns: {"quarry": {"block_per_second":1000}}},
			VANILLA_BLOCK: {"id":"minecraft:barrel", "apply_facing":False},
			"item_name": {"text":"Creative Quarry","italic":False,"color":"white"},
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
		**{
			portal_name: {
				"id": CUSTOM_BLOCK_VANILLA, CATEGORY: ENERGY,
				"custom_data": {"energy": {"usage":usage, "max_storage":storage}},
				VANILLA_BLOCK: {"id": PORTALS_BLOCK[portal_name], "apply_facing":False},
				"item_name": {"text":display_name,"italic":False,"color":color},
				"lore": [
					{"text":description,"italic":False,"color":"white"},
				],
				WIKI_COMPONENT: [
					{"text":f"Portal to {dimension}.","color":"yellow"},
					{"text":f"\n{description}","color":"gray"},
					{"text":f"\nConsumes {usage} kW of power","color":"gray"},
					{"text":f"\nEnergy buffer of {storage//1000 if storage >= 1000 else storage} {'MJ' if storage >= 1000 else 'kJ'}","color":"gray"},
				],
				RESULT_OF_CRAFTING: PORTAL_CRAFTING_RECIPES[portal_name],
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
			VANILLA_BLOCK: {"id": PORTALS_BLOCK["ultimate_portal"], "apply_facing":False},
			"item_name": rainbow_gradient_text("Ultimate Portal"),
			"lore": [
				{"text":"This portal allows access to the dimension of the Ultimate Boss!","italic":False,"color":"white"},
			],
			WIKI_COMPONENT: [
				{"text":"Portal to the Ultimate Boss dimension.","color":"yellow"},
				{"text":"\nAccess to the most challenging content","color":"gray"},
				{"text":"\nConsumes 500 kW of power","color":"gray"},
				{"text":"\nEnergy buffer: 24 MJ","color":"gray"},
			],
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shapeless","result_count":1,"category":"misc","ingredients":[
					ingr_repr("ultimate_shard"),ingr_repr("ultimate_shard"),ingr_repr("ultimate_shard"),
					ingr_repr("ultimate_frame"),ingr_repr("stardust_dungeon_portal"),ingr_repr("ultimate_frame"),
					ingr_repr("minecraft:respawn_anchor"),ingr_repr("minecraft:respawn_anchor"),ingr_repr("minecraft:respawn_anchor"),
				]},
			]
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
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["EEE","DSD","FFF"],"ingredients":{"E":ingr_repr("stardust_essence"),"D":ingr_repr("dog_excrement"),"S":ingr_repr("diamond_seed"),"F":ingr_repr("stardust_frame")}},
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["FFF","DSD","EEE"],"ingredients":{"E":ingr_repr("stardust_essence"),"D":ingr_repr("dog_excrement"),"S":ingr_repr("diamond_seed"),"F":ingr_repr("stardust_frame")}},
			]
		},
		"mob_grinder": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: ENERGY,
			"custom_data": {"energy": {"usage":100, "max_storage":15000}},
			VANILLA_BLOCK: {"id":"minecraft:redstone_block", "apply_facing":"entity"},
			"item_name": {"text":"Mob Grinder","italic":False,"color":"white"},
			WIKI_COMPONENT: [
				{"text":"Automated mob killing machine.","color":"yellow"},
				{"text":"\nKills mobs in a large area in front of it","color":"gray"},
				{"text":"\nConsumes 100 kW of power","color":"gray"},
			],
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["AAA","DSD","FFF"],"ingredients":{"A":ingr_repr("awakened_stardust_block"),"D":ingr_repr("ender_dragon_pearl"),"S":ingr_repr("minecraft:wither_skeleton_skull"),"F":ingr_repr("awakened_stardust_frame")}},
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["FFF","DSD","AAA"],"ingredients":{"A":ingr_repr("awakened_stardust_block"),"D":ingr_repr("ender_dragon_pearl"),"S":ingr_repr("minecraft:wither_skeleton_skull"),"F":ingr_repr("awakened_stardust_frame")}},
			]
		},

		# Generators
		"nether_star_generator": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: ENERGY,
			"custom_data": {"energy": {"generation":1500, "max_storage":30000}},
			VANILLA_BLOCK: {"id":"minecraft:furnace", "apply_facing":True},
			"item_name": {"text":"Nether Star Generator","italic":False,"color":"white"},
			WIKI_COMPONENT: [
				{"text":"High-power generator using nether stars.","color":"yellow"},
				{"text":"\nGenerates 1500 kW when supplied with nether stars","color":"gray"},
				{"text":"\nOne nether star provides 15 minutes of fuel","color":"gray"},
			],
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["MMM","NRN","BBB"],"ingredients":{"M":ingr_repr("machine_block", "simplenergy"),"N":ingr_repr("minecraft:nether_star"),"R":ingr_repr("redstone_generator", "simplenergy"),"B":ingr_repr("minecraft:iron_block")}},
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["BBB","NRN","MMM"],"ingredients":{"M":ingr_repr("machine_block", "simplenergy"),"N":ingr_repr("minecraft:nether_star"),"R":ingr_repr("redstone_generator", "simplenergy"),"B":ingr_repr("minecraft:iron_block")}},
			]
		},
		"advanced_furnace_generator": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: ENERGY,
			"custom_data": {"energy": {"generation":20, "max_storage":1600}},
			VANILLA_BLOCK: {"id":"minecraft:furnace", "apply_facing":True},
			"item_name": {"text":"Advanced Furnace Generator","italic":False,"color":"white"},
			WIKI_COMPONENT: [
				{"text":"Enhanced furnace generator.","color":"yellow"},
				{"text":"\nGenerates 20 kW when supplied with fuel","color":"gray"},
				{"text":"\nEnergy buffer: 1600 kJ","color":"gray"},
				{"text":"\nMore efficient than basic furnace generator","color":"gray"},
			],
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["MMM","GFG","BBB"],"ingredients":{"M":ingr_repr("machine_block", "simplenergy"),"G":ingr_repr("minecraft:glass"),"F":ingr_repr("furnace_generator", "simplenergy"),"B":ingr_repr("minecraft:iron_block")}},
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["BBB","GFG","MMM"],"ingredients":{"M":ingr_repr("machine_block", "simplenergy"),"G":ingr_repr("minecraft:glass"),"F":ingr_repr("furnace_generator", "simplenergy"),"B":ingr_repr("minecraft:iron_block")}},
			]
		},
		"stardust_furnace_generator": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: ENERGY,
			"custom_data": {"energy": {"generation":40, "max_storage":1600}},
			VANILLA_BLOCK: {"id":"minecraft:furnace", "apply_facing":True},
			"item_name": {"text":"Stardust Furnace Generator","italic":False,"color":"white"},
			WIKI_COMPONENT: [
				{"text":"Stardust-enhanced furnace generator.","color":"yellow"},
				{"text":"\nGenerates 40 kW when supplied with fuel","color":"gray"},
				{"text":"\nEnergy buffer: 1600 kJ","color":"gray"},
				{"text":"\nHigher efficiency than advanced generator","color":"gray"},
			],
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["SSS","CFC","BBB"],"ingredients":{"S":ingr_repr("stardust_frame"),"C":ingr_repr("compacted_stardust_shard"),"F":ingr_repr("advanced_furnace_generator"),"B":ingr_repr("stardust_block")}},
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["BBB","CFC","SSS"],"ingredients":{"S":ingr_repr("stardust_frame"),"C":ingr_repr("compacted_stardust_shard"),"F":ingr_repr("advanced_furnace_generator"),"B":ingr_repr("stardust_block")}},
			]
		},
		"awakened_stardust_furnace_generator": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: ENERGY,
			"custom_data": {"energy": {"generation":80, "max_storage":1600}},
			VANILLA_BLOCK: {"id":"minecraft:furnace", "apply_facing":True},
			"item_name": {"text":"Awakened Furnace Generator","italic":False,"color":"white"},
			WIKI_COMPONENT: [
				{"text":"Top-tier furnace generator with awakened stardust.","color":"yellow"},
				{"text":"\nGenerates 80 kW when supplied with fuel","color":"gray"},
				{"text":"\nEnergy buffer: 1600 kJ","color":"gray"},
				{"text":"\nMaximum efficiency furnace generator","color":"gray"},
			],
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["AAA","DFD","BBB"],"ingredients":{"A":ingr_repr("awakened_stardust_frame"),"D":ingr_repr("ender_dragon_pearl"),"F":ingr_repr("stardust_furnace_generator"),"B":ingr_repr("awakened_stardust_block")}},
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["BBB","DFD","AAA"],"ingredients":{"A":ingr_repr("awakened_stardust_frame"),"D":ingr_repr("ender_dragon_pearl"),"F":ingr_repr("stardust_furnace_generator"),"B":ingr_repr("awakened_stardust_block")}},
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

