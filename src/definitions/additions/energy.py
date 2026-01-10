
# ruff: noqa: E501
# Imports
from stewbeet import (
	Block,
	BlockHead,
	CraftingShapedRecipe,
	CraftingShapelessRecipe,
	Ingr,
	Item,
	JsonDict,
	Mem,
	RecipeBase,
	VanillaBlock,
	WikiButton,
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
	QUARRY_CRAFTING_RECIPES: dict[str, list[RecipeBase]] = {
		"quarry_lv1": [
			CraftingShapelessRecipe(result_count=1, category="misc", ingredients=[
				Ingr("minecraft:barrel"),Ingr("minecraft:crafter"),Ingr("minecraft:barrel"),
				Ingr("minecraft:observer"),Ingr("minecraft:amethyst_shard"),Ingr("minecraft:observer"),
				Ingr("minecraft:diamond_pickaxe"),Ingr("minecraft:diamond_axe"),Ingr("minecraft:diamond_shovel"),
			]),
		],
		"quarry_lv2": [
			CraftingShapedRecipe(result_count=1, category="misc", shape=["WWW","EQE","BBB"], ingredients={"W":Ingr("minecraft:warped_fungus"),"E":Ingr("stardust_essence"),"Q":Ingr("quarry_lv1"),"B":Ingr("triple_compressed_cobblestone")}),
		],
		"quarry_lv3": [
			CraftingShapedRecipe(result_count=1, category="misc", shape=["DDD","SQS","BRB"], ingredients={"D":Ingr("dragon_pearl"),"S":Ingr("compacted_stardust_shard"),"Q":Ingr("quarry_lv2"),"B":Ingr("quadruple_compressed_cobblestone"),'R':Ingr("minecraft:respawn_anchor")}),
		],
		"quarry_lv4": [
			CraftingShapedRecipe(result_count=1, category="misc", shape=["EEE","NQN","BBB"], ingredients={"E":Ingr("ender_dragon_pearl"),"N":Ingr("minecraft:netherite_ingot"),"Q":Ingr("quarry_lv3"),"B":Ingr("quintuple_compressed_cobblestone")}),
		],
		"quarry_lv5": [
			CraftingShapedRecipe(result_count=1, category="misc", shape=["NNN","UQU","BBB"], ingredients={"N":Ingr("minecraft:netherite_block"),"U":Ingr("ultimate_shard"),"Q":Ingr("quarry_lv4"),"B":Ingr("sextuple_compressed_cobblestone")}),
			CraftingShapedRecipe(result_count=1, category="misc", shape=["BBB","UQU","NNN"], ingredients={"N":Ingr("minecraft:netherite_block"),"U":Ingr("ultimate_shard"),"Q":Ingr("quarry_lv4"),"B":Ingr("sextuple_compressed_cobblestone")}),
		],
	}
	PORTAL_CRAFTING_RECIPES: dict[str, list[RecipeBase]] = {
		"cavern_portal": [
			CraftingShapelessRecipe(result_count=1, category="misc", ingredients=8*[Ingr("compressed_cobblestone")] + [Ingr("stardust_fragment")]),
		],
		"celestial_portal": [
			CraftingShapelessRecipe(result_count=1, category="misc", ingredients=[
				Ingr("minecraft:iron_block"),Ingr("minecraft:phantom_membrane"),Ingr("minecraft:iron_block"),
				Ingr("minecraft:phantom_membrane"),Ingr("stardust_fragment"),Ingr("minecraft:phantom_membrane"),
				Ingr("minecraft:iron_block"),Ingr("minecraft:phantom_membrane"),Ingr("minecraft:iron_block"),
			]),
		],
		"stardust_portal": [
			CraftingShapelessRecipe(result_count=1, category="misc", ingredients=[
				Ingr("minecraft:blue_concrete"),Ingr("compacted_stardust_shard"),Ingr("minecraft:blue_concrete"),
				Ingr("compacted_stardust_shard"),Ingr("celestial_portal"),Ingr("compacted_stardust_shard"),
				Ingr("minecraft:blue_concrete"),Ingr("compacted_stardust_shard"),Ingr("minecraft:blue_concrete"),
			]),
		],
		"stardust_dungeon_portal": [
			CraftingShapelessRecipe(result_count=1, category="misc", ingredients=[
				Ingr("awakened_stardust_block"),Ingr("awakened_stardust_ore"),Ingr("awakened_stardust_block"),
				Ingr("awakened_stardust_ore"),Ingr("stardust_portal"),Ingr("awakened_stardust_ore"),
				Ingr("awakened_stardust_block"),Ingr("awakened_stardust_ore"),Ingr("awakened_stardust_block"),
			]),
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

	# Energy Systems - Cables
	stardust_cable_profile: JsonDict = {
		"id": [-709098200,1001541428,-2043264882,-430220135],
		"properties":[{"name":"textures", "value":"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvM2Y4NDVlMzBlNmVjOGI0N2RmZWUxMzI5NmQzYjQ3NzY5YzVjMGE5Nzc3YzNkNTk2ZWJiNDA3ZmY3OTcwNDE1ZCJ9fX0="}],
	}
	awakened_stardust_cable_profile: JsonDict = {
		"id": [-709098200,1001541428,-2043264882,-430220135],
		"properties":[{"name":"textures", "value":"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvOWQ5ZmE4MTE1Y2MyY2FhNDE2MzA4N2Y1MzU5YTIzZjNmYzAxZjIxZTliMWRjOTE0ZDJkMzBkYTk4ZTZjMDUxYiJ9fX0="}],
	}
	ultimate_cable_profile: JsonDict = {
		"id": [-709098200,1001541428,-2043264882,-430220135],
		"properties":[{"name":"textures", "value":"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvYzQ4NGE3OGU4YTY5YjZhYWUwNmQ3ZTI2OWM3NWJjZjkxM2U4ZWY3ZDU1Y2Q3ZjY2MjZiZTZjOWIwZjQ2OGQ5MyJ9fX0="}],
	}

	BlockHead(
		id="stardust_cable",
		manual_category=ENERGY,
		vanilla_block=VanillaBlock(
			id="minecraft:player_head{profile:" + str(stardust_cable_profile) + "}",
			apply_facing=False
		),
		components={
			"custom_data": {"energy": {"transfer":480}},
			"profile": stardust_cable_profile,
		},
		wiki_buttons=[WikiButton([
			{"text":"High-capacity energy transmission cable.","color":"yellow"},
			{"text":"\nTransfers up to 480 kW","color":"gray"},
			{"text":"\nConnects generators to machines and batteries","color":"gray"},
		])],
		recipes=[
			CraftingShapedRecipe(result_count=1, category="misc", shape=["SGS","GCG","SGS"], ingredients={"S":Ingr("stardust_block"),"G":Ingr("minecraft:gold_block"),"C":Ingr("elite_cable", "simplenergy")}),
			CraftingShapedRecipe(result_count=1, category="misc", shape=["GSG","SCS","GSG"], ingredients={"S":Ingr("stardust_block"),"G":Ingr("minecraft:gold_block"),"C":Ingr("elite_cable", "simplenergy")}),
		]
	)
	BlockHead(
		id="awakened_stardust_cable",
		manual_category=ENERGY,
		vanilla_block=VanillaBlock(
			id="minecraft:player_head{profile:" + str(awakened_stardust_cable_profile) + "}",
			apply_facing=False
		),
		components={
			"custom_data": {"energy": {"transfer":960}},
			"profile": awakened_stardust_cable_profile,
		},
		wiki_buttons=[WikiButton([
			{"text":"Enhanced energy transmission cable.","color":"yellow"},
			{"text":"\nTransfers up to 960 kW","color":"gray"},
			{"text":"\nUpgraded version of stardust cable","color":"gray"},
		])],
		recipes=[
			CraftingShapedRecipe(result_count=1, category="misc", shape=["BRB","RCR","BRB"], ingredients={"B":Ingr("awakened_stardust_block"),"R":Ingr("minecraft:redstone_block"),"C":Ingr("stardust_cable")}),
			CraftingShapedRecipe(result_count=1, category="misc", shape=["RBR","BCB","RBR"], ingredients={"B":Ingr("awakened_stardust_block"),"R":Ingr("minecraft:redstone_block"),"C":Ingr("stardust_cable")}),
		]
	)
	BlockHead(
		id="ultimate_cable",
		manual_category=ENERGY,
		vanilla_block=VanillaBlock(
			id="minecraft:player_head{profile:" + str(ultimate_cable_profile) + "}",
			apply_facing=False
		),
		components={
			"custom_data": {"energy": {"transfer":1920}},
			"item_name": rainbow_gradient_text("Ultimate Cable"),
			"profile": ultimate_cable_profile,
		},
		wiki_buttons=[WikiButton([
			{"text":"Ultimate energy transmission cable.","color":"yellow"},
			{"text":"\nTransfers up to 1920 kW","color":"gray"},
			{"text":"\nUpgraded version of awakened stardust cable","color":"gray"},
		])],
		recipes=[
			CraftingShapelessRecipe(result_count=1, category="misc", ingredients=[
				Ingr("compacted_stardust_shard"),Ingr("legendarium_ingot"),Ingr("compacted_stardust_shard"),
				Ingr("solarium_ingot"),Ingr("awakened_stardust_cable"),Ingr("darkium_ingot"),
				Ingr("compacted_stardust_shard"),Ingr("stardust_core"),Ingr("compacted_stardust_shard"),
			]),
		]
	)

	# Energy Systems - Batteries
	Block(
		id="stardust_battery",
		manual_category=ENERGY,
		vanilla_block=VanillaBlock(id="minecraft:warped_hyphae", apply_facing=False),
		components={
			"custom_data": {"energy": {"storage":0, "max_storage":200000}},
		},
		wiki_buttons=[
			WikiButton({"text":"Large-capacity energy storage device.","color":"yellow"}),
			WikiButton({"text":"\nStores up to 200 MJ of energy","color":"gray"}),
		],
		recipes=[
			CraftingShapedRecipe(result_count=1, category="misc", shape=["EEE","CBC","SSS"], ingredients={"E":Ingr("stardust_essence"),"C":Ingr("compacted_stardust_shard"),"B":Ingr("elite_battery", "simplenergy"),"S":Ingr("stardust_block")}),
		]
	)
	Block(
		id="awakened_stardust_battery",
		manual_category=ENERGY,
		vanilla_block=VanillaBlock(id="minecraft:crimson_hyphae", apply_facing=False),
		components={
			"custom_data": {"energy": {"storage":0, "max_storage":500000}},
		},
		wiki_buttons=[
			WikiButton({"text":"Enhanced energy storage with awakened stardust.","color":"yellow"}),
			WikiButton({"text":"\nStores up to 500 MJ of energy","color":"gray"}),
		],
		recipes=[
			CraftingShapedRecipe(result_count=1, category="misc", shape=["RRR","SBS","AAA"], ingredients={"R":Ingr("minecraft:redstone_block"),"S":Ingr("awakened_stardust"),"B":Ingr("stardust_battery"),"A":Ingr("awakened_stardust_block")}),
			CraftingShapedRecipe(result_count=1, category="misc", shape=["AAA","SBS","RRR"], ingredients={"R":Ingr("minecraft:redstone_block"),"S":Ingr("awakened_stardust"),"B":Ingr("stardust_battery"),"A":Ingr("awakened_stardust_block")}),
		]
	)
	Block(
		id="ultimate_battery",
		manual_category=ENERGY,
		vanilla_block=VanillaBlock(id="minecraft:crying_obsidian", apply_facing=False),
		components={
			"custom_data": {"energy": {"storage":0, "max_storage":10000000}},
			"item_name": rainbow_gradient_text("Ultimate Battery"),
		},
		wiki_buttons=[
			WikiButton({"text":"Ultimate energy storage device.","color":"yellow"}),
			WikiButton({"text":"\nStores up to 10 GJ of energy","color":"gray"}),
		],
		recipes=[
			CraftingShapedRecipe(result_count=1, category="misc", shape=["SSS","FBF","CCC"], ingredients={"S":Ingr("ultimate_shard"),"F":Ingr("ultimate_frame"),"B":Ingr("awakened_stardust_battery"),"C":Ingr("stardust_core")}),
			CraftingShapedRecipe(result_count=1, category="misc", shape=["CCC","FBF","SSS"], ingredients={"S":Ingr("ultimate_shard"),"F":Ingr("ultimate_frame"),"B":Ingr("awakened_stardust_battery"),"C":Ingr("stardust_core")}),
		]
	)

	# Energy Systems - Solar Panels
	Block(
		id="stardust_solar_panel",
		manual_category=ENERGY,
		vanilla_block=VanillaBlock(id="minecraft:daylight_detector", apply_facing=False),
		override_model={"parent":"block/daylight_detector", "textures": {"side": f"{ns}:item/stardust_solar_panel_side", "top": f"{ns}:item/stardust_solar_panel_top"}},
		components={
			"custom_data": {"energy": {"generation":8, "max_storage":1200}},
		},
		wiki_buttons=[
			WikiButton({"text":"Stardust-enhanced solar energy collector.","color":"yellow"}),
			WikiButton({"text":"\nGenerates 8 kW during daylight","color":"gray"}),
			WikiButton({"text":"\nRequires direct sunlight","color":"gray"}),
		],
		recipes=[
			CraftingShapedRecipe(result_count=1, category="misc", shape=["CCC","EPE","BBB"], ingredients={"C":Ingr("stardust_photovoltaic_cell"),"E":Ingr("stardust_essence"),"P":Ingr("solar_panel", "simplenergy"),"B":Ingr("minecraft:lapis_block")}),
		]
	)
	Block(
		id="awakened_stardust_solar_panel",
		manual_category=ENERGY,
		vanilla_block=VanillaBlock(id="minecraft:daylight_detector", apply_facing=False),
		override_model={"parent":"block/daylight_detector", "textures": {"side": f"{ns}:item/awakened_stardust_solar_panel_side", "top": f"{ns}:item/awakened_stardust_solar_panel_top"}},
		components={
			"custom_data": {"energy": {"generation":16, "max_storage":2400}},
		},
		wiki_buttons=[
			WikiButton({"text":"Advanced solar panel with awakened stardust.","color":"yellow"}),
			WikiButton({"text":"\nDouble the power of basic solar panels","color":"gray"}),
			WikiButton({"text":"\nGenerates 16 kW during daylight","color":"gray"}),
		],
		recipes=[
			CraftingShapedRecipe(result_count=1, category="misc", shape=["CCC","APA","BBB"], ingredients={"C":Ingr("awakened_stardust_photovoltaic_cell"),"A":Ingr("awakened_stardust_block"),"P":Ingr("stardust_solar_panel"),"B":Ingr("minecraft:iron_block")}),
		]
	)
	Block(
		id="legendarium_solar_panel",
		manual_category=ENERGY,
		vanilla_block=VanillaBlock(id="minecraft:daylight_detector", apply_facing=False),
		override_model={"parent":"block/daylight_detector", "textures": {"side": f"{ns}:item/legendarium_solar_panel_side", "top": f"{ns}:item/legendarium_solar_panel_top"}},
		components={
			"custom_data": {"energy": {"generation":32, "max_storage":4800}},
		},
		wiki_buttons=[
			WikiButton({"text":"Advanced solar panel with legendarium material.","color":"yellow"}),
			WikiButton({"text":"\nDouble the power of awakened solar panels","color":"gray"}),
			WikiButton({"text":"\nGenerates 32 kW during daylight","color":"gray"}),
		],
		recipes=[
			CraftingShapedRecipe(result_count=1, category="misc", shape=["CCC","EPE","BBB"], ingredients={"C":Ingr("legendarium_photovoltaic_cell"),"E":Ingr("legendarium_ingot"),"P":Ingr("awakened_stardust_solar_panel"),"B":Ingr("minecraft:calcite")}),
		]
	)
	Block(
		id="solarium_solar_panel",
		manual_category=ENERGY,
		vanilla_block=VanillaBlock(id="minecraft:daylight_detector", apply_facing=False),
		override_model={"parent":"block/daylight_detector", "textures": {"side": f"{ns}:item/solarium_solar_panel_side", "top": f"{ns}:item/solarium_solar_panel_top"}},
		components={
			"custom_data": {"energy": {"generation":32, "max_storage":4800}},
		},
		wiki_buttons=[
			WikiButton({"text":"Advanced solar panel with solarium material.","color":"yellow"}),
			WikiButton({"text":"\nDouble the power of awakened solar panels","color":"gray"}),
			WikiButton({"text":"\nGenerates 32 kW during daylight","color":"gray"}),
		],
		recipes=[
			CraftingShapedRecipe(result_count=1, category="misc", shape=["CCC","EPE","BBB"], ingredients={"C":Ingr("solarium_photovoltaic_cell"),"E":Ingr("solarium_ingot"),"P":Ingr("awakened_stardust_solar_panel"),"B":Ingr("minecraft:calcite")}),
		]
	)
	Block(
		id="darkium_solar_panel",
		manual_category=ENERGY,
		vanilla_block=VanillaBlock(id="minecraft:daylight_detector", apply_facing=False),
		override_model={"parent":"block/daylight_detector", "textures": {"side": f"{ns}:item/darkium_solar_panel_side", "top": f"{ns}:item/darkium_solar_panel_top"}},
		components={
			"custom_data": {"energy": {"generation":32, "max_storage":4800}},
		},
		wiki_buttons=[
			WikiButton({"text":"Advanced solar panel with darkium material.","color":"yellow"}),
			WikiButton({"text":"\nDouble the power of awakened solar panels","color":"gray"}),
			WikiButton({"text":"\nGenerates 32 kW during nighttime instead of daylight","color":"gray"}),
		],
		recipes=[
			CraftingShapedRecipe(result_count=1, category="misc", shape=["CCC","EPE","BBB"], ingredients={"C":Ingr("darkium_photovoltaic_cell"),"E":Ingr("darkium_ingot"),"P":Ingr("awakened_stardust_solar_panel"),"B":Ingr("simplunium_block", "simplenergy")}),
		]
	)
	Block(
		id="ultimate_solar_panel",
		manual_category=ENERGY,
		vanilla_block=VanillaBlock(id="minecraft:daylight_detector", apply_facing=False),
		override_model={"parent":"block/daylight_detector", "textures": {"side": f"{ns}:item/ultimate_solar_panel_side", "top": f"{ns}:item/ultimate_solar_panel_top"}},
		components={
			"custom_data": {"energy": {"generation":128, "max_storage":20000}},
			"item_name": rainbow_gradient_text("Ultimate Solar Panel"),
		},
		wiki_buttons=[
			WikiButton({"text":"Ultimate solar panel combining all three elements.","color":"yellow"}),
			WikiButton({"text":"\nGenerates 128 kW during daylight only","color":"gray"}),
		],
		recipes=unique_list([
			CraftingShapedRecipe(result_count=1, category="misc", shape=["CCC","SPS","XYZ"], ingredients={
				"C":Ingr("ultimate_photovoltaic_cell"),
				"S":Ingr("ultimate_shard"),
				"P":Ingr(f"{panel}_solar_panel"),
				"X":Ingr(f"{X}_block"),
				"Y":Ingr("stardust_core"),
				"Z":Ingr(f"{Z}_block")
			})
			for elements in [("legendarium", "solarium", "darkium"), ("darkium", "legendarium", "solarium"), ("solarium", "darkium", "legendarium")]
			for panel in elements
			for X in elements
			for Z in elements
			if panel != X and panel != Z and X != Z
		], method="str")
	)

	# Quarries
	Item(
		id="quarry_configurator",
		base_item="minecraft:warped_fungus_on_a_stick",
		manual_category=ENERGY,
		override_model={"parent":"minecraft:item/generated"},
		components={
			"lore": [
				[{"keybind":"key.use","italic":False,"color":"white"},{"text":" to set 1st coordinates","color":"gray"}],
				[{"keybind":"key.sneak","italic":False,"color":"white"},{"text":" + ","color":"gray"},{"keybind":"key.use"},{"text":" to set 2nd coordinates","color":"gray"}],
			],
		},
		wiki_buttons=[
			WikiButton({"text":"Configurator for setting up quarries.\n","color":"yellow"}),
			WikiButton({"keybind":"key.use","color":"white"}),
			WikiButton({"text":" to set the first corner of the quarry area\n","color":"gray"}),
			WikiButton({"keybind":"key.sneak","color":"white"}),
			WikiButton({"text":" + ","color":"gray"}),
			WikiButton({"keybind":"key.use","color":"white"}),
			WikiButton({"text":" to set the opposite corner of the quarry area","color":"gray"}),
			WikiButton({"text":"\nFinally, just ","color":"gray"}),
			WikiButton({"keybind":"key.use","color":"white"}),
			WikiButton({"text":" the quarry you want to apply the region configuration","color":"gray"}),
			WikiButton({"text":"\nOr put the configurator inside the quarry on the dedicated slot","color":"gray"}),
		],
		recipes=[
			CraftingShapedRecipe(result_count=1, category="misc", shape=["DD","QQ","QQ"], ingredients={"D":Ingr("minecraft:diamond"),"Q":Ingr("minecraft:quartz")}),
		],
	)
	Item(
		id="fortune_module",
		manual_category=ENERGY,
		components={
			"max_stack_size": 5,
			"lore": [
				{"text":"Increases fortune level of the quarry","italic":False,"color":"gray"},
				{"text":"by 1 (max 5)","italic":False,"color":"gray"},
			],
		},
		wiki_buttons=[
			WikiButton({"text":"Module that increases the fortune level of compatible machines.","color":"yellow"}),
			WikiButton({"text":"\nEach module increases fortune by 1, up to a maximum of 5","color":"gray"}),
			WikiButton({"text":"\nPut the module in the dedicated slot of the quarry","color":"gray"}),
		],
		recipes=[
			CraftingShapedRecipe(result_count=1, category="misc", shape=["EDE","DMD","EDE"], ingredients={"E":Ingr("minecraft:emerald"),"D":Ingr("minecraft:diamond"),"M":Ingr("empty_module")}),
			CraftingShapedRecipe(result_count=1, category="misc", shape=["DED","EME","DED"], ingredients={"E":Ingr("minecraft:emerald"),"D":Ingr("minecraft:diamond"),"M":Ingr("empty_module")}),
		]
	)
	Item(
		id="silk_touch_module",
		manual_category=ENERGY,
		components={
			"max_stack_size": 1,
			"lore": [
				{"text":"Enables silk touch enchantment for the quarry","italic":False,"color":"gray"},
			],
		},
		wiki_buttons=[
			WikiButton({"text":"Module that enables silk touch enchantment for compatible machines.","color":"yellow"}),
			WikiButton({"text":"\nPut the module in the dedicated slot of the quarry","color":"gray"}),
		],
		recipes=[
			CraftingShapelessRecipe(result_count=1, category="misc", ingredients=8*[Ingr("minecraft:iron_ore")] + [Ingr("empty_module")]),
			CraftingShapelessRecipe(result_count=1, category="misc", ingredients=8*[Ingr("minecraft:deepslate_iron_ore")] + [Ingr("empty_module")]),
		]
	)
	Item(
		id="force_load_module",
		manual_category=ENERGY,
		components={
			"max_stack_size": 1,
			"lore": [
				{"text":"Force loads the chunk where the quarry is placed","italic":False,"color":"gray"},
			],
		},
		wiki_buttons=[
			WikiButton({"text":"Module that force loads the chunk for compatible machines.","color":"yellow"}),
			WikiButton({"text":"\nPrevents the chunk from unloading when no players are nearby","color":"gray"}),
			WikiButton({"text":"\nMachine continues to operate even in unloaded chunks","color":"gray"}),
			WikiButton({"text":"\nPut the module in the dedicated slot of the quarry","color":"gray"}),
		],
		recipes=[
			CraftingShapelessRecipe(result_count=1, category="misc", ingredients=4*[Ingr("minecraft:respawn_anchor")] + 4*[Ingr("minecraft:glowstone")] + [Ingr("empty_module")]),
		]
	)
	for i, (usage, storage, block_per_second) in enumerate(QUARRY_STATS):
		quarry_id, quarry_name, _ = quarry_display(i)
		Block(
			id=quarry_id,
			manual_category=ENERGY,
			vanilla_block=VanillaBlock(id="minecraft:barrel", apply_facing=False),
			components={
				"custom_data": {"energy": {"usage":usage, "max_storage":storage}, ns: {"quarry": {"block_per_second":block_per_second}}},
				"item_name": {"text":quarry_name,"italic":False},
				"lore": [
					{"text":f"[Speed: {block_per_second} block/s]","italic":False,"color":"gray"},
				],
			},
			wiki_buttons=[
				WikiButton({"text":f"Level {i+1} quarry for automated mining.","color":"yellow"}),
				WikiButton({"text":f"\nMines {block_per_second} blocks per second","color":"gray"}),
				WikiButton({"text":"\nOnly mines blocks in a configured area","color":"gray"}),
				WikiButton({"text":f"\n\nConsumes {usage} kW of power","color":"gray"}),
				WikiButton({"text":f"\nEnergy buffer: {storage//1000} MJ","color":"gray"}),
			],
			recipes=QUARRY_CRAFTING_RECIPES[quarry_id]
		)
	Block(
		id="quarry_creative",
		manual_category=ENERGY,
		vanilla_block=VanillaBlock(id="minecraft:barrel", apply_facing=False),
		components={
			"custom_data": {"energy": {"usage":0, "max_storage":1}, ns: {"quarry": {"block_per_second":1000}}},
			"lore": [
				{"text":"[Speed: 1000 block/s]","italic":False,"color":"gray"},
			],
			"enchantment_glint_override": True,
		},
		wiki_buttons=[
			WikiButton({"text":"Creative quarry with unlimited power.","color":"yellow"}),
			WikiButton({"text":"\nRequires no power to operate","color":"gray"}),
			WikiButton({"text":"\nEquivalent to a Level 1000 quarry","color":"gray"}),
			WikiButton({"text":"\nFor creative/testing purposes only","color":"gray"}),
		],
	)

	# Portals
	Block(
		id="cavern_portal",
		manual_category=ENERGY,
		vanilla_block=VanillaBlock(id=PORTALS_BLOCK["cavern_portal"], apply_facing=False),
		components={
			"custom_data": {"energy": {"usage":20, "max_storage":800}},
			"item_name": {"text":"Cavern Portal","italic":False,"color":"dark_gray"},
			"lore": [
				{"text":"This portal allows access to a world full of caverns!","italic":False,"color":"white"},
			],
		},
		wiki_buttons=[
			WikiButton({"text":"Portal to the Cavern dimension.","color":"yellow"}),
			WikiButton({"text":"\nA world full of underground caverns and caves","color":"gray"}),
			WikiButton({"text":"\n\nMobs: All vanilla mobs (scaled to 0.75x size)","color":"white"}),
			WikiButton({"text":"\nLoot: Ores, minerals, gems (Coal, Copper, Iron, Gold, Lapis, Redstone, Emerald, Diamond)","color":"white"}),
			WikiButton({"text":"\n\nConsumes 20 kW of power","color":"gray"}),
			WikiButton({"text":"\nEnergy buffer: 800 kJ","color":"gray"}),
		],
		recipes=PORTAL_CRAFTING_RECIPES["cavern_portal"],
	)
	Block(
		id="celestial_portal",
		manual_category=ENERGY,
		vanilla_block=VanillaBlock(id=PORTALS_BLOCK["celestial_portal"], apply_facing=False),
		components={
			"custom_data": {"energy": {"usage":20, "max_storage":800}},
			"item_name": {"text":"Celestial Portal","italic":False,"color":"gray"},
			"lore": [
				{"text":"This portal allows access to a dimension filled with floating islands","italic":False,"color":"white"},
			],
		},
		wiki_buttons=[
			WikiButton({"text":"Portal to the Celestial dimension.","color":"yellow"}),
			WikiButton({"text":"\nA dimension filled with floating islands in the sky","color":"gray"}),
			WikiButton({"text":"\n\nMobs: All vanilla mobs (1.5x health, 1.5x damage, 1.1x speed)","color":"white"}),
			WikiButton({"text":"\nLoot: Iron Ingots, Stardust Fragments, Simplunium Ingots","color":"white"}),
			WikiButton({"text":"\nTransitions: Fall down to return to Overworld, go up to Stardust dimension","color":"aqua"}),
			WikiButton({"text":"\n\nConsumes 20 kW of power","color":"gray"}),
			WikiButton({"text":"\nEnergy buffer: 800 kJ","color":"gray"}),
		],
		recipes=PORTAL_CRAFTING_RECIPES["celestial_portal"],
	)
	Block(
		id="stardust_portal",
		manual_category=ENERGY,
		vanilla_block=VanillaBlock(id=PORTALS_BLOCK["stardust_portal"], apply_facing=False),
		components={
			"custom_data": {"energy": {"usage":100, "max_storage":6000}},
			"item_name": {"text":"Stardust Portal","italic":False,"color":"blue"},
			"lore": [
				{"text":"This portal allows access to the Stardust dimension with lots of powerful mobs!","italic":False,"color":"white"},
			],
		},
		wiki_buttons=[
			WikiButton({"text":"Portal to the Stardust dimension.","color":"yellow"}),
			WikiButton({"text":"\nA dangerous dimension with powerful Stardust-corrupted mobs","color":"gray"}),
			WikiButton({"text":"\n\nMobs: Stardust Soldier, Stardust Evoker, Stardust Bat","color":"white"}),
			WikiButton({"text":"\n  - Stardust Soldier/Evoker: 2x health, 3x damage, 1.25x speed","color":"gray"}),
			WikiButton({"text":"\n  - Stardust Bat: Summons lightning at nearby players (10% chance/second)","color":"gray"}),
			WikiButton({"text":"\nLoot: Stardust Ingots, Stardust Essence, Netherite Scraps","color":"white"}),
			WikiButton({"text":"\nTransitions: Fall down to Celestial dimension, go up for Ultimate dimension","color":"aqua"}),
			WikiButton({"text":"\n\nConsumes 100 kW of power","color":"gray"}),
			WikiButton({"text":"\nEnergy buffer: 6 MJ","color":"gray"}),
		],
		recipes=PORTAL_CRAFTING_RECIPES["stardust_portal"],
	)
	Block(
		id="stardust_dungeon_portal",
		manual_category=ENERGY,
		vanilla_block=VanillaBlock(id=PORTALS_BLOCK["stardust_dungeon_portal"], apply_facing=False),
		components={
			"custom_data": {"energy": {"usage":200, "max_storage":12000}},
			"item_name": {"text":"Stardust Dungeon Portal","italic":False,"color":"red"},
			"lore": [
				{"text":"This portal allows access to the dimension of the Stardust Dungeon!","italic":False,"color":"white"},
			],
		},
		wiki_buttons=[
			WikiButton({"text":"Portal to the Stardust Dungeon.","color":"yellow"}),
			WikiButton({"text":"\nA pre-built dungeon dimension with extreme challenges","color":"gray"}),
			WikiButton({"text":"\n\nMobs: All vanilla mobs (3x health, 4x damage, 1.35x speed)","color":"white"}),
			WikiButton({"text":"\nLoot: Awakened Stardust, Stardust Essence","color":"white"}),
			WikiButton({"text":"\nWarning: Extremely dangerous! Prepare well before entering","color":"red"}),
			WikiButton({"text":"\n\nConsumes 200 kW of power","color":"gray"}),
			WikiButton({"text":"\nEnergy buffer: 12 MJ","color":"gray"}),
		],
		recipes=PORTAL_CRAFTING_RECIPES["stardust_dungeon_portal"],
	)
	Block(
		id="ultimate_portal",
		manual_category=ENERGY,
		vanilla_block=VanillaBlock(id=PORTALS_BLOCK["ultimate_portal"], apply_facing=False),
		components={
			"custom_data": {"energy": {"usage":500, "max_storage":24000}},
			"item_name": rainbow_gradient_text("Ultimate Portal"),
			"lore": [
				{"text":"This portal allows access to the dimension of the Ultimate Boss!","italic":False,"color":"white"},
			],
		},
		wiki_buttons=[
			WikiButton({"text":"Portal to the Ultimate dimension.","color":"yellow"}),
			WikiButton({"text":"\nThe ultimate challenge - home of the Ultimate Dragon boss","color":"gray"}),
			WikiButton({"text":"\n\nBoss: Ultimate Dragon (1024 HP)","color":"white"}),
			WikiButton({"text":"\n  - Spawned by consuming Ultimate Dragon Essence","color":"gray"}),
			WikiButton({"text":"\n  - Multiple powerful attacks and mechanics","color":"gray"}),
			WikiButton({"text":"\n  - Summons Ultimate Slaves (512 HP each)","color":"gray"}),
			WikiButton({"text":"\nTransitions: Fall down to return to Stardust dimension","color":"aqua"}),
			WikiButton({"text":"\nWarning: This is the hardest content in the datapack!","color":"red"}),
			WikiButton({"text":"\n\nConsumes 500 kW of power","color":"gray"}),
			WikiButton({"text":"\nEnergy buffer: 24 MJ","color":"gray"}),
		],
		recipes=[
			CraftingShapelessRecipe(result_count=1, category="misc", ingredients=[
				Ingr("ultimate_shard"),Ingr("ultimate_shard"),Ingr("ultimate_shard"),
				Ingr("ultimate_frame"),Ingr("stardust_dungeon_portal"),Ingr("ultimate_frame"),
				Ingr("minecraft:respawn_anchor"),Ingr("minecraft:respawn_anchor"),Ingr("minecraft:respawn_anchor"),
			]),
		]
	)

	# Other Machines
	Block(
		id="growth_accelerator",
		manual_category=ENERGY,
		vanilla_block=VanillaBlock(id="minecraft:diamond_block", apply_facing=False),
		components={
			"custom_data": {"energy": {"usage":100, "max_storage":12000}},
			"lore": [
				{"text":"Only growth seeds in a radius","italic":False,"color":"white"},
				{"text":"of 10 blocks every minute","italic":False,"color":"white"},
			],
		},
		wiki_buttons=[
			WikiButton({"text":"Accelerates crop and plant growth.","color":"yellow"}),
			WikiButton({"text":"\nAccelerates growth in 10-block radius","color":"gray"}),
			WikiButton({"text":"\nOperates once per minute when powered","color":"gray"}),
			WikiButton({"text":"\n\nEffects:","color":"aqua"}),
			WikiButton({"text":"\n➤ Vanilla crops: +1 growth stage","color":"white"}),
			WikiButton({"text":"\n➤ Custom growing seeds: +10 minutes of growth time","color":"white"}),
			WikiButton({"text":"\n\nConsumes 100 kW of power","color":"gray"}),
			WikiButton({"text":"\nEnergy buffer: 12 MJ","color":"gray"}),
		],
		recipes=[
			CraftingShapedRecipe(result_count=1, category="misc", shape=["EEE","DSD","FFF"], ingredients={"E":Ingr("stardust_essence"),"D":Ingr("dog_excrement"),"S":Ingr("diamond_seed"),"F":Ingr("stardust_frame")}),
			CraftingShapedRecipe(result_count=1, category="misc", shape=["FFF","DSD","EEE"], ingredients={"E":Ingr("stardust_essence"),"D":Ingr("dog_excrement"),"S":Ingr("diamond_seed"),"F":Ingr("stardust_frame")}),
		]
	)
	Block(
		id="mob_grinder",
		manual_category=ENERGY,
		vanilla_block=VanillaBlock(id="minecraft:redstone_block", apply_facing="entity"),
		components={
			"custom_data": {"energy": {"usage":100, "max_storage":15000}},
		},
		wiki_buttons=[
			WikiButton({"text":"Automated mob killing machine.","color":"yellow"}),
			WikiButton({"text":"\nKills mobs in a large area in front of it","color":"gray"}),
			WikiButton({"text":"\n\nConsumes 100 kW of power","color":"gray"}),
		],
		recipes=[
			CraftingShapedRecipe(result_count=1, category="misc", shape=["AAA","DSD","FFF"], ingredients={"A":Ingr("awakened_stardust_block"),"D":Ingr("ender_dragon_pearl"),"S":Ingr("minecraft:wither_skeleton_skull"),"F":Ingr("awakened_stardust_frame")}),
			CraftingShapedRecipe(result_count=1, category="misc", shape=["FFF","DSD","AAA"], ingredients={"A":Ingr("awakened_stardust_block"),"D":Ingr("ender_dragon_pearl"),"S":Ingr("minecraft:wither_skeleton_skull"),"F":Ingr("awakened_stardust_frame")}),
		]
	)

	# Generators
	Block(
		id="nether_star_generator",
		manual_category=ENERGY,
		vanilla_block=VanillaBlock(id="minecraft:furnace", apply_facing=True),
		components={
			"custom_data": {"energy": {"generation":1500, "max_storage":30000}},
		},
		wiki_buttons=[
			WikiButton({"text":"High-power generator using nether stars.","color":"yellow"}),
			WikiButton({"text":"\nGenerates 1500 kW when supplied with nether stars","color":"gray"}),
			WikiButton({"text":"\nOne nether star provides 15 minutes of fuel","color":"gray"}),
		],
		recipes=[
			CraftingShapedRecipe(result_count=1, category="misc", shape=["MMM","NRN","BBB"], ingredients={"M":Ingr("machine_block", "simplenergy"),"N":Ingr("minecraft:nether_star"),"R":Ingr("redstone_generator", "simplenergy"),"B":Ingr("minecraft:iron_block")}),
			CraftingShapedRecipe(result_count=1, category="misc", shape=["BBB","NRN","MMM"], ingredients={"M":Ingr("machine_block", "simplenergy"),"N":Ingr("minecraft:nether_star"),"R":Ingr("redstone_generator", "simplenergy"),"B":Ingr("minecraft:iron_block")}),
		]
	)
	Block(
		id="advanced_furnace_generator",
		manual_category=ENERGY,
		vanilla_block=VanillaBlock(id="minecraft:furnace", apply_facing=True),
		components={
			"custom_data": {"energy": {"generation":20, "max_storage":1600}},
		},
		wiki_buttons=[
			WikiButton({"text":"Enhanced furnace generator.","color":"yellow"}),
			WikiButton({"text":"\nGenerates 20 kW when supplied with fuel","color":"gray"}),
			WikiButton({"text":"\nEnergy buffer: 1600 kJ","color":"gray"}),
			WikiButton({"text":"\nMore efficient than basic furnace generator","color":"gray"}),
		],
		recipes=[
			CraftingShapedRecipe(result_count=1, category="misc", shape=["MMM","GFG","BBB"], ingredients={"M":Ingr("machine_block", "simplenergy"),"G":Ingr("minecraft:glass"),"F":Ingr("furnace_generator", "simplenergy"),"B":Ingr("minecraft:iron_block")}),
			CraftingShapedRecipe(result_count=1, category="misc", shape=["BBB","GFG","MMM"], ingredients={"M":Ingr("machine_block", "simplenergy"),"G":Ingr("minecraft:glass"),"F":Ingr("furnace_generator", "simplenergy"),"B":Ingr("minecraft:iron_block")}),
		]
	)
	Block(
		id="stardust_furnace_generator",
		manual_category=ENERGY,
		vanilla_block=VanillaBlock(id="minecraft:furnace", apply_facing=True),
		components={
			"custom_data": {"energy": {"generation":40, "max_storage":1600}},
		},
		wiki_buttons=[
			WikiButton({"text":"Stardust-enhanced furnace generator.","color":"yellow"}),
			WikiButton({"text":"\nGenerates 40 kW when supplied with fuel","color":"gray"}),
			WikiButton({"text":"\nEnergy buffer: 1600 kJ","color":"gray"}),
			WikiButton({"text":"\nHigher efficiency than advanced generator","color":"gray"}),
		],
		recipes=[
			CraftingShapedRecipe(result_count=1, category="misc", shape=["SSS","CFC","BBB"], ingredients={"S":Ingr("stardust_frame"),"C":Ingr("compacted_stardust_shard"),"F":Ingr("advanced_furnace_generator"),"B":Ingr("stardust_block")}),
			CraftingShapedRecipe(result_count=1, category="misc", shape=["BBB","CFC","SSS"], ingredients={"S":Ingr("stardust_frame"),"C":Ingr("compacted_stardust_shard"),"F":Ingr("advanced_furnace_generator"),"B":Ingr("stardust_block")}),
		]
	)
	Block(
		id="awakened_stardust_furnace_generator",
		manual_category=ENERGY,
		vanilla_block=VanillaBlock(id="minecraft:furnace", apply_facing=True),
		components={
			"custom_data": {"energy": {"generation":80, "max_storage":1600}},
		},
		wiki_buttons=[
			WikiButton({"text":"Top-tier furnace generator with awakened stardust.","color":"yellow"}),
			WikiButton({"text":"\nGenerates 80 kW when supplied with fuel","color":"gray"}),
			WikiButton({"text":"\nEnergy buffer: 1600 kJ","color":"gray"}),
			WikiButton({"text":"\nMaximum efficiency furnace generator","color":"gray"}),
		],
		recipes=[
			CraftingShapedRecipe(result_count=1, category="misc", shape=["AAA","DFD","BBB"], ingredients={"A":Ingr("awakened_stardust_frame"),"D":Ingr("ender_dragon_pearl"),"F":Ingr("stardust_furnace_generator"),"B":Ingr("awakened_stardust_block")}),
			CraftingShapedRecipe(result_count=1, category="misc", shape=["BBB","DFD","AAA"], ingredients={"A":Ingr("awakened_stardust_frame"),"D":Ingr("ender_dragon_pearl"),"F":Ingr("stardust_furnace_generator"),"B":Ingr("awakened_stardust_block")}),
		]
	)

