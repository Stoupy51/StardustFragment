
# ruff: noqa: E501
# Imports
from stewbeet import (
	CATEGORY,
	CUSTOM_BLOCK_VANILLA,
	CUSTOM_ITEM_VANILLA,
	NO_SILK_TOUCH_DROP,
	RESULT_OF_CRAFTING,
	USED_FOR_CRAFTING,
	VANILLA_BLOCK,
	VANILLA_BLOCK_FOR_ORES,
	WIKI_COMPONENT,
	BlastingRecipe,
	Block,
	CraftingShapelessRecipe,
	Ingr,
	Item,
	JsonDict,
	Mem,
	PulverizingRecipe,
	SmeltingRecipe,
	VanillaBlock,
	WikiButton,
	rainbow_gradient_text,
)

# Constants
COBBLESTONE_TIERS: list[str] = [
	"compressed", "double_compressed", "triple_compressed", "quadruple_compressed",
	"quintuple_compressed", "sextuple_compressed", "septuple_compressed", "octuple_compressed",
]

def main_additions() -> None:
	MATERIALS: str = "materials"

	# Basic Materials
	Item(
		id="stardust_fragment",
		manual_category=MATERIALS,
		wiki_buttons = [
			WikiButton({"text":"The fundamental building block of stardust technology.","color":"yellow"}),
			WikiButton({"text":"\nMined from Stardust Ore found in the overworld","color":"gray"}),
			WikiButton({"text":"\nUsed to craft ingots, tools, armor, and machines","color":"gray"}),
		],
		recipes = [
			SmeltingRecipe(result_count=2, category="misc", experience=0.8, cookingtime=200, ingredient=Ingr("stardust_ore")),
			BlastingRecipe(result_count=2, category="misc", experience=0.8, cookingtime=100, ingredient=Ingr("stardust_ore")),
			SmeltingRecipe(result_count=4, category="misc", experience=0.8, cookingtime=200, ingredient=Ingr("deepslate_stardust_ore")),
			BlastingRecipe(result_count=4, category="misc", experience=0.8, cookingtime=100, ingredient=Ingr("deepslate_stardust_ore")),
			PulverizingRecipe(result_count=8, ingredient=Ingr("stardust_ingot")),
		]
	)

	Item(
		id="stardust_ingot",
		manual_category=MATERIALS,
		wiki_buttons = [
			WikiButton({"text":"Refined stardust material for advanced crafting.","color":"yellow"}),
			WikiButton({"text":"\nCrafted from Stardust Fragments","color":"gray"}),
			WikiButton({"text":"\nUsed in tool, armor, and machine construction","color":"gray"}),
		],
		recipes = [
			SmeltingRecipe(result_count=2, category="misc", experience=0.8, cookingtime=200, ingredient=Ingr("nether_stardust_ore")),
			BlastingRecipe(result_count=2, category="misc", experience=0.8, cookingtime=100, ingredient=Ingr("nether_stardust_ore")),
			CraftingShapelessRecipe(result_count=1, category="misc", ingredients=[Ingr("minecraft:iron_ingot")] + 8*[Ingr("stardust_fragment")]),
			CraftingShapelessRecipe(result_count=1, category="misc", ingredients=[Ingr("minecraft:copper_ingot")] + 8*[Ingr("stardust_fragment")]),
			CraftingShapelessRecipe(result_count=1, category="misc", ingredients=[Ingr("minecraft:gold_ingot")] + 8*[Ingr("stardust_fragment")]),
			CraftingShapelessRecipe(result_count=9, category="misc", ingredients=[Ingr("stardust_block")]),
			PulverizingRecipe(result_count=8, ingredient=Ingr("stardust_essence")),
		]
	)

	Block(
		id="stardust_block",
		manual_category=MATERIALS,
		vanilla_block = VanillaBlock(id="minecraft:lapis_block", apply_facing=False),
		wiki_buttons = [
			WikiButton({"text":"Compressed stardust for storage and crafting.","color":"yellow"}),
			WikiButton({"text":"\nCrafted from 8 Stardust Ingots and a Diamond Block","color":"gray"}),
		],
		recipes = [
			CraftingShapelessRecipe(result_count=1, category="misc", ingredients=[Ingr("minecraft:diamond_block")] + 8*[Ingr("stardust_ingot")]),
			CraftingShapelessRecipe(result_count=1, category="misc", ingredients=[Ingr("minecraft:gold_block")] + 8*[Ingr("stardust_ingot")]),
		]
	)

	Item(
		id="stardust_essence",
		manual_category=MATERIALS,
		wiki_buttons = [
			WikiButton({"text":"Concentrated stardust energy.","color":"yellow"}),
			WikiButton({"text":"\nCrafted from Stardust Ingots","color":"gray"}),
			WikiButton({"text":"\nUsed in high-tier crafting recipes","color":"gray"}),
		],
		recipes = [
			SmeltingRecipe(result_count=1, category="misc", experience=0.8, cookingtime=200, ingredient=Ingr("ender_stardust_ore")),
			BlastingRecipe(result_count=1, category="misc", experience=0.8, cookingtime=100, ingredient=Ingr("ender_stardust_ore")),
			CraftingShapelessRecipe(result_count=1, category="misc", ingredients=[Ingr("minecraft:blaze_powder")] + 8*[Ingr("stardust_ingot")]),
			CraftingShapelessRecipe(result_count=1, category="misc", ingredients=[Ingr("minecraft:wind_charge")] + 8*[Ingr("stardust_ingot")]),
			PulverizingRecipe(result_count=8, ingredient=Ingr("stardust_core")),
		]
	)

	Block(
		id="stardust_core",
		manual_category=MATERIALS,
		vanilla_block = VanillaBlock(id="minecraft:diamond_block", apply_facing=False),
		wiki_buttons = [
			WikiButton({"text":"Central component of stardust technology.","color":"yellow"}),
			WikiButton({"text":"\nCrafted from Stardust Essences","color":"gray"}),
			WikiButton({"text":"\nUsed in top-tier crafting recipes","color":"gray"}),
		],
		recipes = [
			CraftingShapelessRecipe(result_count=1, category="misc", ingredients=[Ingr("minecraft:crafter")] + 8*[Ingr("stardust_essence")]),
			CraftingShapelessRecipe(result_count=1, category="misc", ingredients=[Ingr("minecraft:observer")] + 8*[Ingr("stardust_essence")]),
		]
	)

	Item(
		id="compacted_stardust_shard",
		manual_category=MATERIALS,
		wiki_buttons = [
			WikiButton({"text":"Component of stardust technology.","color":"yellow"}),
			WikiButton({"text":"\nFilled with stardust energy","color":"gray"}),
			WikiButton({"text":"\nUsed in high-tier crafting recipes","color":"gray"}),
		],
		recipes = [
			CraftingShapelessRecipe(result_count=1, category="misc", ingredients=[Ingr("minecraft:amethyst_shard")] + 8*[Ingr("stardust_block")]),
		]
	)

	obj = Item.from_id("awakened_stardust")
	obj.manual_category = MATERIALS
	obj.wiki_buttons = [
		WikiButton({"text":"Enhanced stardust with increased energy potential.","color":"yellow"}),
		WikiButton({"text":"\nObtained through mining or some special mobs","color":"gray"}),
		WikiButton({"text":"\nRequired for advanced equipment and machines","color":"gray"}),
	]
	obj.recipes = [
		PulverizingRecipe(result_count=8, ingredient=Ingr("awakened_stardust_block")),
	]

	obj = Block.from_id("awakened_stardust_block")
	obj.vanilla_block = VanillaBlock(id="minecraft:redstone_block", apply_facing=False)
	obj.manual_category = MATERIALS
	obj.wiki_buttons = [
		WikiButton({"text":"Compressed awakened stardust block.","color":"yellow"}),
		WikiButton({"text":"\nCrafted from 8 Awakened Stardust","color":"gray"}),
		WikiButton({"text":"\nRequired for advanced equipment and machines","color":"gray"}),
	]
	obj.recipes = [
		CraftingShapelessRecipe(result_count=1, category="misc", ingredients=[Ingr("quadruple_compressed_cobblestone")] + 8*[Ingr("awakened_stardust")]),
	]

	Item(
		id="dragon_pearl",
		base_item="minecraft:ender_pearl",
		manual_category=MATERIALS,
		components={
			"item_name": {"text":"Dragon Pearl","italic":False,"color":"dark_purple"},
			"use_cooldown": {"seconds": 0.5},
		},
		wiki_buttons = [
			WikiButton({"text":"Upgraded ender pearl variant","color":"yellow"}),
			WikiButton({"text":"\nThrows x1.5 farther than regular ender pearls","color":"gray"}),
			WikiButton({"text":"\nCooldown is 0.5 seconds instead of 1 second","color":"gray"}),
		],
		recipes = [
			CraftingShapelessRecipe(result_count=1, category="misc", ingredients=[Ingr("minecraft:ender_pearl")] + 8*[Ingr("minecraft:dragon_breath")]),
			PulverizingRecipe(result_count=1, ingredient=Ingr("ender_dragon_pearl")),
		]
	)

	Item(
		id="ender_dragon_pearl",
		base_item="minecraft:ender_pearl",
		manual_category=MATERIALS,
		components={
			"item_name": [{"text":"Ender ","italic":False,"color":"dark_aqua"},{"text":"Dragon Pearl","italic":False,"color":"dark_purple"}],
			"use_cooldown": {"seconds": 0.25},
		},
		wiki_buttons = [
			WikiButton({"text":"Upgraded dragon pearl variant","color":"yellow"}),
			WikiButton({"text":"\nThrows x2 farther than regular ender pearls","color":"gray"}),
			WikiButton({"text":"\nCooldown is 0.25 seconds instead of 1 second","color":"gray"}),
			WikiButton({"text":"\nUsed in high-tier crafting","color":"gray"}),
		],
		recipes = [
			CraftingShapelessRecipe(result_count=1, category="misc", ingredients=[Ingr("dragon_pearl")] + 8*[Ingr("minecraft:ender_pearl")]),
		]
	)

	obj = Item.from_id("legendarium_fragment")
	obj.manual_category = MATERIALS
	obj.wiki_buttons = [
		WikiButton({"text":"Legendary material fragment with wind power.","color":"yellow"}),
		WikiButton({"text":"\nExtremely rare and valuable","color":"gray"}),
		WikiButton({"text":"\nObtained through legendarium seeds","color":"gray"}),
		WikiButton({"text":"\nUsed for legendarium-tier equipment","color":"gray"}),
	]
	obj.recipes = [
		PulverizingRecipe(result_count=8, ingredient=Ingr("legendarium_ingot")),
	]

	obj = Item.from_id("legendarium_ingot")
	obj.manual_category = MATERIALS
	obj.wiki_buttons = [
		WikiButton({"text":"Refined legendary material with wind power.","color":"yellow"}),
		WikiButton({"text":"\nExtremely rare and valuable","color":"gray"}),
		WikiButton({"text":"\nUsed for legendarium-tier equipment","color":"gray"}),
	]
	obj.recipes = [
		CraftingShapelessRecipe(result_count=1, category="misc", ingredients=[Ingr("stardust_ingot")] + 8*[Ingr("legendarium_fragment")]),
		PulverizingRecipe(result_count=8, ingredient=Ingr("legendarium_block")),
	]

	obj = Block.from_id("legendarium_block")
	obj.vanilla_block = VanillaBlock(id="minecraft:emerald_block", apply_facing=False)
	obj.manual_category = MATERIALS
	obj.wiki_buttons = [
		WikiButton({"text":"Compressed legendarium storage block.","color":"yellow"}),
		WikiButton({"text":"\nCrafted from 8Legendarium Ingots","color":"gray"}),
	]
	obj.recipes = [
		CraftingShapelessRecipe(result_count=1, category="misc", ingredients=[Ingr("stardust_block")] + 8*[Ingr("legendarium_ingot")]),
	]

	obj = Item.from_id("solarium_fragment")
	obj.manual_category = MATERIALS
	obj.wiki_buttons = [
		WikiButton({"text":"Solarium material fragment with fire power.","color":"yellow"}),
		WikiButton({"text":"\nExtremely rare and valuable","color":"gray"}),
		WikiButton({"text":"\nObtained through solarium seeds","color":"gray"}),
		WikiButton({"text":"\nUsed for solarium-tier equipment","color":"gray"}),
	]
	obj.recipes = [
		PulverizingRecipe(result_count=8, ingredient=Ingr("solarium_ingot")),
	]

	obj = Item.from_id("solarium_ingot")
	obj.manual_category = MATERIALS
	obj.wiki_buttons = [
		WikiButton({"text":"Refined solarium material with fire power.","color":"yellow"}),
		WikiButton({"text":"\nExtremely rare and valuable","color":"gray"}),
		WikiButton({"text":"\nUsed for solarium-tier equipment","color":"gray"}),
	]
	obj.recipes = [
		CraftingShapelessRecipe(result_count=1, category="misc", ingredients=[Ingr("stardust_ingot")] + 8*[Ingr("solarium_fragment")]),
		PulverizingRecipe(result_count=8, ingredient=Ingr("solarium_block")),
	]

	obj = Block.from_id("solarium_block")
	obj.manual_category = MATERIALS
	obj.vanilla_block = VanillaBlock(id="minecraft:waxed_copper_block", apply_facing=False)
	obj.wiki_buttons = [
		WikiButton({"text":"Compressed solarium storage block.","color":"yellow"}),
		WikiButton({"text":"\nCrafted from 8Solarium Ingots","color":"gray"}),
	]
	obj.recipes = [
		CraftingShapelessRecipe(result_count=1, category="misc", ingredients=[Ingr("stardust_block")] + 8*[Ingr("solarium_ingot")]),
	]

	obj = Item.from_id("darkium_fragment")
	obj.manual_category = MATERIALS
	obj.wiki_buttons = [
		WikiButton({"text":"Darkium material fragment with darkness power.","color":"yellow"}),
		WikiButton({"text":"\nExtremely rare and valuable","color":"gray"}),
		WikiButton({"text":"\nObtained through darkium seeds","color":"gray"}),
		WikiButton({"text":"\nUsed for darkium-tier equipment","color":"gray"}),
	]
	obj.recipes = [
		PulverizingRecipe(result_count=8, ingredient=Ingr("darkium_ingot")),
	]

	obj = Item.from_id("darkium_ingot")
	obj.manual_category = MATERIALS
	obj.wiki_buttons = [
		WikiButton({"text":"Refined darkium material with darkness power.","color":"yellow"}),
		WikiButton({"text":"\nExtremely rare and valuable","color":"gray"}),
		WikiButton({"text":"\nUsed for darkium-tier equipment","color":"gray"}),
	]
	obj.recipes = [
		CraftingShapelessRecipe(result_count=1, category="misc", ingredients=[Ingr("stardust_ingot")] + 8*[Ingr("darkium_fragment")]),
		PulverizingRecipe(result_count=8, ingredient=Ingr("darkium_block")),
	]

	obj = Block.from_id("darkium_block")
	obj.vanilla_block = VanillaBlock(id="minecraft:netherite_block", apply_facing=False)
	obj.manual_category = MATERIALS
	obj.wiki_buttons = [
		WikiButton({"text":"Compressed darkium storage block.","color":"yellow"}),
		WikiButton({"text":"\nCrafted from 8Darkium Ingots","color":"gray"}),
	]
	obj.recipes = [
		CraftingShapelessRecipe(result_count=1, category="misc", ingredients=[Ingr("stardust_block")] + 8*[Ingr("darkium_ingot")]),
	]


	# Give Additional data for every item
	additions: dict[str, JsonDict] = {

		# Ores
		"stardust_ore": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: MATERIALS,
			VANILLA_BLOCK: VANILLA_BLOCK_FOR_ORES,
			NO_SILK_TOUCH_DROP: {"id": "stardust_fragment", "count": {"min": 1, "max": 4}},
			WIKI_COMPONENT: [
				WikiButton({"text":"Primary ore for the datapack.","color":"yellow"}),
				WikiButton({"text":"\nFound in the Overworld between Y=0 and Y=50","color":"gray"}),
				WikiButton({"text":"\nDeepslate variant generates below Y=0","color":"gray"}),
				WikiButton({"text":"\nDrops between 1 and 4 stardust fragments when mined","color":"gray"}),
			],
		},
		"deepslate_stardust_ore": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: MATERIALS,
			VANILLA_BLOCK: VANILLA_BLOCK_FOR_ORES,
			NO_SILK_TOUCH_DROP: {"id": "stardust_fragment", "count": {"min": 2, "max": 6}},
			WIKI_COMPONENT: [
				WikiButton({"text":"Deepslate variant of stardust ore.","color":"yellow"}),
				WikiButton({"text":"\nFound in deepslate layers below Y=0","color":"gray"}),
				WikiButton({"text":"\nDrops between 2 and 6 stardust fragments when mined","color":"gray"}),
			],
		},
		"nether_stardust_ore": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: MATERIALS,
			VANILLA_BLOCK: VANILLA_BLOCK_FOR_ORES,
			NO_SILK_TOUCH_DROP: {"id": "stardust_ingot", "count": {"min": 1, "max": 3}},
			WIKI_COMPONENT: [
				WikiButton({"text":"Nether variant of stardust ore.","color":"yellow"}),
				WikiButton({"text":"\nFound throughout the Nether dimension","color":"gray"}),
				WikiButton({"text":"\nDrops between 1 and 3 stardust ingots when mined","color":"gray"}),
			],
		},
		"ender_stardust_ore": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: MATERIALS,
			VANILLA_BLOCK: VANILLA_BLOCK_FOR_ORES,
			NO_SILK_TOUCH_DROP: {"id": "stardust_essence", "count": {"min": 1, "max": 2}},
			WIKI_COMPONENT: [
				WikiButton({"text":"End dimension stardust ore.","color":"yellow"}),
				WikiButton({"text":"\nFound in the End dimension","color":"gray"}),
				WikiButton({"text":"\nDrops between 1 and 2 stardust essences when mined","color":"gray"}),
			],
		},
		"awakened_stardust_ore": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: MATERIALS,
			VANILLA_BLOCK: VANILLA_BLOCK_FOR_ORES,
			NO_SILK_TOUCH_DROP: {"id": "awakened_stardust", "count": {"min": 2, "max": 8}},
			WIKI_COMPONENT: [
				WikiButton({"text":"Variant of the nether stardust ore.","color":"yellow"}),
				WikiButton({"text":"\nFound throughout the Nether dimension","color":"gray"}),
				WikiButton({"text":"\nDrops between 2 and 8 awakened stardust when mined","color":"gray"}),
			],
		},

		# Other Materials
		"ultimate_shard": {
			"id": CUSTOM_ITEM_VANILLA, CATEGORY: MATERIALS,
			"item_name": rainbow_gradient_text("Ultimate Shard"),
			WIKI_COMPONENT: [
				WikiButton({"text":"The ultimate refined material.","color":"yellow"}),
				WikiButton({"text":"\nMain component for ultimate crafting","color":"gray"}),
			],
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shapeless","result_count":1,"category":"misc","ingredients":[
					Ingr("minecraft:popped_chorus_fruit"),Ingr("stardust_core"),Ingr("minecraft:echo_shard"),
					Ingr("legendarium_block"),Ingr("compacted_stardust_shard"),Ingr("solarium_block"),
					Ingr("minecraft:resin_brick"),Ingr("darkium_block"),Ingr("minecraft:turtle_scute"),
				]},
			]
		},
		"dog_excrement": {
			"id": CUSTOM_ITEM_VANILLA, CATEGORY: MATERIALS,
			"item_name": {"text":"Dog Excrement","italic":False,"color":"#693100"},
			WIKI_COMPONENT: [
				WikiButton({"text":"A smelly piece of dog excrement.","color":"#693100"}),
				WikiButton({"text":"\nUsed for comedic purposes and boss summoning","color":"gray"}),
				WikiButton({"text":"\nEvery wolf lays an excrement item every 5-10 minutes","color":"gray"}),
			],
			USED_FOR_CRAFTING: [
				{"type":"simplenergy_pulverizing","result_count":{"type":"minecraft:uniform","min":4,"max":6},"result":Ingr("minecraft:bone_meal")},
			]
		},
		**{
			f"{current}_cobblestone": {
				"id": CUSTOM_BLOCK_VANILLA, CATEGORY: MATERIALS,
				VANILLA_BLOCK: {"id":"minecraft:cobbled_deepslate" if i < 4 else "minecraft:obsidian", "apply_facing":False},
				"lore": [
					{"text":f"Equivalent to {9**(i+1):,} cobblestones","color":"gray","italic":False},
				],
				WIKI_COMPONENT: [
					WikiButton({"text":f"Some {current.replace('_', ' ').title()} Cobblestone is nice to have.","color":"yellow"}),
					WikiButton({"text":f"\nEquals to {9**(i+1):,} cobblestones","color":"gray"}),
				],
				RESULT_OF_CRAFTING: [
					{"type":"crafting_shapeless","result_count": 1,"category":"misc","ingredients":9*[Ingr(f"{prev}_cobblestone") if prev else Ingr("minecraft:cobblestone")]},
				] + ([
					{"type":"crafting_shapeless","result_count": 9,"category":"misc","ingredients":[Ingr(f"{next_t}_cobblestone")]},
					{"type":"simplenergy_pulverizing","result_count": 9,"ingredient":Ingr(f"{next_t}_cobblestone")},
				] if next_t else [])
			}
			for i, (prev, current, next_t) in enumerate(zip([None, *COBBLESTONE_TIERS[:-1]], COBBLESTONE_TIERS, [*COBBLESTONE_TIERS[1:], None], strict=True))
		},
		"stardust_frame": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: MATERIALS,
			VANILLA_BLOCK: {"id":"minecraft:lapis_block", "apply_facing":False},
			WIKI_COMPONENT: [
				WikiButton({"text":"Enhanced machine block with stardust.","color":"yellow"}),
				WikiButton({"text":"\nUsed as a base for most advanced machines","color":"gray"}),
			],
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["BBB","CMC","SSS"],"ingredients":{"B":Ingr("minecraft:blue_glazed_terracotta"),"C":Ingr("compacted_stardust_shard"),"M":Ingr("machine_block", "simplenergy"),"S":Ingr("stardust_block")}},
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["SSS","CMC","BBB"],"ingredients":{"B":Ingr("minecraft:blue_glazed_terracotta"),"C":Ingr("compacted_stardust_shard"),"M":Ingr("machine_block", "simplenergy"),"S":Ingr("stardust_block")}},
			]
		},
		"awakened_stardust_frame": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: MATERIALS,
			VANILLA_BLOCK: {"id":"minecraft:redstone_block", "apply_facing":False},
			WIKI_COMPONENT: [
				WikiButton({"text":"Awakened frame made with stardust.","color":"yellow"}),
				WikiButton({"text":"\nFurther upgraded version of the machine block","color":"gray"}),
				WikiButton({"text":"\nUsed for top-tier machines","color":"gray"}),
			],
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["NNN","ASA","BBB"],"ingredients":{"N":Ingr("minecraft:nether_wart_block"),"A":Ingr("awakened_stardust"),"S":Ingr("stardust_frame"),"B":Ingr("awakened_stardust_block")}},
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["BBB","ASA","NNN"],"ingredients":{"N":Ingr("minecraft:nether_wart_block"),"A":Ingr("awakened_stardust"),"S":Ingr("stardust_frame"),"B":Ingr("awakened_stardust_block")}},
			]
		},
		"ultimate_frame": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: MATERIALS,
			VANILLA_BLOCK: {"id":"minecraft:crying_obsidian", "apply_facing":False},
			"item_name": rainbow_gradient_text("Ultimate Frame"),
			WIKI_COMPONENT: [
				WikiButton({"text":"Ultimate frame made with advanced materials.","color":"yellow"}),
				WikiButton({"text":"\nFinal upgraded version of the machine block","color":"gray"}),
				WikiButton({"text":"\nUsed for final-tier machines","color":"gray"}),
			],
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["LSD","UAU","PPP"],"ingredients":{"L":Ingr("legendarium_block"),"S":Ingr("solarium_block"),"D":Ingr("darkium_block"),"U":Ingr("ultimate_shard"),"A":Ingr("awakened_stardust_frame"),"P":Ingr("minecraft:stripped_pale_oak_wood")}},
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["PPP","UAU","LSD"],"ingredients":{"L":Ingr("legendarium_block"),"S":Ingr("solarium_block"),"D":Ingr("darkium_block"),"U":Ingr("ultimate_shard"),"A":Ingr("awakened_stardust_frame"),"P":Ingr("minecraft:stripped_pale_oak_wood")}},
			]
		},
		"mirror": {
			"id": CUSTOM_ITEM_VANILLA, CATEGORY: MATERIALS,
			WIKI_COMPONENT: [
				WikiButton({"text":"Reflective surface for advanced optics.","color":"yellow"}),
				WikiButton({"text":"\nUsed for upgrading solar panels","color":"gray"}),
			],
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shapeless","result_count":1,"category":"misc","ingredients":4*[Ingr("minecraft:black_stained_glass")] + [Ingr("minecraft:quartz_block")]},
				{"type":"crafting_shapeless","result_count":1,"category":"misc","ingredients":4*[Ingr("minecraft:tinted_glass")] + [Ingr("minecraft:quartz_block")]},
			]
		},
		"stardust_photovoltaic_cell": {
			"id": CUSTOM_ITEM_VANILLA, CATEGORY: MATERIALS,
			WIKI_COMPONENT: [
				WikiButton({"text":"Photovoltaic cell made from stardust.","color":"yellow"}),
				WikiButton({"text":"\nUsed to convert sunlight into energy","color":"gray"}),
			],
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["FFF","MMM"," I "],"ingredients":{"F":Ingr("stardust_fragment"),"M":Ingr("mirror"),"I":Ingr("stardust_ingot")}},
			]
		},
		"awakened_stardust_photovoltaic_cell": {
			"id": CUSTOM_ITEM_VANILLA, CATEGORY: MATERIALS,
			WIKI_COMPONENT: [
				WikiButton({"text":"Awakened photovoltaic cell made from stardust.","color":"yellow"}),
				WikiButton({"text":"\nUsed to convert sunlight into energy more efficiently","color":"gray"}),
			],
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["FFF","SSS","FFF"],"ingredients":{"F":Ingr("awakened_stardust"),"S":Ingr("stardust_photovoltaic_cell")}},
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["FSF","FSF","FSF"],"ingredients":{"F":Ingr("awakened_stardust"),"S":Ingr("stardust_photovoltaic_cell")}},
			]
		},
		"legendarium_photovoltaic_cell": {
			"id": CUSTOM_ITEM_VANILLA, CATEGORY: MATERIALS,
			WIKI_COMPONENT: [
				WikiButton({"text":"Legendarium photovoltaic cell made from legendary energy.","color":"yellow"}),
				WikiButton({"text":"\nUsed to convert sunlight into energy even more efficiently","color":"gray"}),
			],
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["III","AAA","III"],"ingredients":{"I":Ingr("legendarium_ingot"),"A":Ingr("awakened_stardust_photovoltaic_cell")}},
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["IAI","IAI","IAI"],"ingredients":{"I":Ingr("legendarium_ingot"),"A":Ingr("awakened_stardust_photovoltaic_cell")}},
			]
		},
		"solarium_photovoltaic_cell": {
			"id": CUSTOM_ITEM_VANILLA, CATEGORY: MATERIALS,
			WIKI_COMPONENT: [
				WikiButton({"text":"Solarium photovoltaic cell made from solar energy.","color":"yellow"}),
				WikiButton({"text":"\nUsed to convert sunlight into energy even more efficiently","color":"gray"}),
			],
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["III","AAA","III"],"ingredients":{"I":Ingr("solarium_ingot"),"A":Ingr("awakened_stardust_photovoltaic_cell")}},
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["IAI","IAI","IAI"],"ingredients":{"I":Ingr("solarium_ingot"),"A":Ingr("awakened_stardust_photovoltaic_cell")}},
			]
		},
		"darkium_photovoltaic_cell": {
			"id": CUSTOM_ITEM_VANILLA, CATEGORY: MATERIALS,
			WIKI_COMPONENT: [
				WikiButton({"text":"Darkium photovoltaic cell made from dark energy.","color":"yellow"}),
				WikiButton({"text":"\nUsed to convert sunlight into energy even more efficiently","color":"gray"}),
			],
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["III","AAA","III"],"ingredients":{"I":Ingr("darkium_ingot"),"A":Ingr("awakened_stardust_photovoltaic_cell")}},
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["IAI","IAI","IAI"],"ingredients":{"I":Ingr("darkium_ingot"),"A":Ingr("awakened_stardust_photovoltaic_cell")}},
			]
		},
		"ultimate_photovoltaic_cell": {
			"id": CUSTOM_ITEM_VANILLA, CATEGORY: MATERIALS,
			"item_name": rainbow_gradient_text("Ultimate Photovoltaic Cell"),
			WIKI_COMPONENT: [
				WikiButton({"text":"Ultimate photovoltaic cell made from stardust.","color":"yellow"}),
				WikiButton({"text":"\nUsed to convert sunlight into energy with ultimate efficiency","color":"gray"}),
				WikiButton({"text":"\nCrafted from ultimate materials","color":"gray"}),
			],
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["LSD"," U "],"ingredients":{"L":Ingr("legendarium_photovoltaic_cell"),"S":Ingr("solarium_photovoltaic_cell"),"D":Ingr("darkium_photovoltaic_cell"),"U":Ingr("ultimate_shard")}},
				{"type":"crafting_shapeless","result_count":1,"category":"misc","ingredients":[Ingr("legendarium_photovoltaic_cell"),Ingr("solarium_photovoltaic_cell"),Ingr("darkium_photovoltaic_cell"),Ingr("ultimate_shard")]},
			]
		},
		"empty_module": {
			"id": CUSTOM_ITEM_VANILLA, CATEGORY: MATERIALS,
			WIKI_COMPONENT: [
				WikiButton({"text":"Empty module for quarry's upgrade.","color":"yellow"}),
				WikiButton({"text":"\nCan be filled with various materials","color":"gray"}),
			],
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shapeless","result_count":1,"category":"misc","ingredients":8*[Ingr("minecraft:map")] + [Ingr("simplunium_ingot", "simplenergy")]},
			]
		},
	}

	# Compressed cobblestone uncraft to base cobblestone
	additions["compressed_cobblestone"][USED_FOR_CRAFTING] = [
		{"type":"crafting_shapeless","result_count":9,"category":"misc","result":Ingr("minecraft:cobblestone"),"ingredients":[Ingr("compressed_cobblestone")]},
	]

	# Update the definitions with new data
	for k, v in additions.items():
		if k in Mem.definitions:
			Mem.definitions[k].update(v)
		else:
			Mem.definitions[k] = v

