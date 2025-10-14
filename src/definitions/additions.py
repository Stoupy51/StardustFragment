
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
	PULVERIZING,
	RESULT_OF_CRAFTING,
	USED_FOR_CRAFTING,
	VANILLA_BLOCK,
	VANILLA_BLOCK_FOR_ORES,
	WIKI_COMPONENT,
	JsonDict,
	Mem,
	TextComponent,
	ingr_repr,
)
from stouputils.collections import unique_list
from stouputils.print import info

# Constants
SNIPER_BULLETS_WIKI: list[TextComponent] = [
	{"text":"\nPossible bullet types:","color":"gray"},
	{"text":"\n- Copper nugget: +3 damage","color":"gray"},
	{"text":"\n- Iron nugget: +5 damage","color":"gray"},
	{"text":"\n- Gold nugget: +7 damage","color":"gray"},
	{"text":"\n- Stardust Essence: +10 damage","color":"gray"},
	{"text":"\n- Awakened Stardust: +20 damage","color":"gray"},
]
COBBLESTONE_TIERS: list[str] = [
	"compressed", "double_compressed", "triple_compressed", "quadruple_compressed",
	"quintuple_compressed", "sextuple_compressed", "septuple_compressed", "octuple_compressed",
]

def main_additions() -> None:
	ENERGY: str = "energy"
	MATERIALS: str = "materials"
	MISC: str = "miscellaneous"
	EQUIPMENT: str = "equipment"
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
			{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["WWW","EQE","BBB"],"ingredients":{"W":ingr_repr("minecraft:warped_fungus"),"E":ingr_repr("stardust_essence", ns),"Q":ingr_repr("quarry_lv1", ns),"B":ingr_repr("triple_compressed_cobblestone", ns)}},
		],
		"quarry_lv3": [
			{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["DDD","SQS","TTT"],"ingredients":{"D":ingr_repr("dragon_pearl", ns),"S":ingr_repr("compacted_stardust_shard", ns),"Q":ingr_repr("quarry_lv2", ns),"T":ingr_repr("quadruple_compressed_cobblestone", ns)}},
		],
		"quarry_lv4": [
			{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["EEE","NQN","BBB"],"ingredients":{"E":ingr_repr("ender_dragon_pearl", ns),"N":ingr_repr("minecraft:netherite_ingot"),"Q":ingr_repr("quarry_lv3", ns),"B":ingr_repr("quintuple_compressed_cobblestone", ns)}},
		],
		"quarry_lv5": [
			{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["NNN","UQU","BBB"],"ingredients":{"N":ingr_repr("minecraft:netherite_block"),"U":ingr_repr("ultimate_shard", ns),"Q":ingr_repr("quarry_lv4", ns),"B":ingr_repr("sextuple_compressed_cobblestone", ns)}},
			{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["BBB","UQU","NNN"],"ingredients":{"N":ingr_repr("minecraft:netherite_block"),"U":ingr_repr("ultimate_shard", ns),"Q":ingr_repr("quarry_lv4", ns),"B":ingr_repr("sextuple_compressed_cobblestone", ns)}},
		],
	}
	PORTAL_CRAFTING_RECIPES: dict[str, list[JsonDict]] = {
		"cavern_portal": [
			{"type":"crafting_shapeless","result_count":1,"category":"misc","ingredients":8*[ingr_repr("compressed_cobblestone", ns)] + [ingr_repr("stardust_fragment", ns)]},
		],
		"celestial_portal": [
			{"type":"crafting_shapeless","result_count":1,"category":"misc","ingredients":[
				ingr_repr("minecraft:iron_block"),ingr_repr("minecraft:phantom_membrane"),ingr_repr("minecraft:iron_block"),
				ingr_repr("minecraft:phantom_membrane"),ingr_repr("stardust_fragment", ns),ingr_repr("minecraft:phantom_membrane"),
				ingr_repr("minecraft:iron_block"),ingr_repr("minecraft:phantom_membrane"),ingr_repr("minecraft:iron_block"),
			]},
		],
		"stardust_portal": [
			{"type":"crafting_shapeless","result_count":1,"category":"misc","ingredients":[
				ingr_repr("minecraft:blue_concrete"),ingr_repr("compacted_stardust_shard", ns),ingr_repr("minecraft:blue_concrete"),
				ingr_repr("compacted_stardust_shard", ns),ingr_repr("celestial_portal", ns),ingr_repr("compacted_stardust_shard", ns),
				ingr_repr("minecraft:blue_concrete"),ingr_repr("compacted_stardust_shard", ns),ingr_repr("minecraft:blue_concrete"),
			]},
		],
		"stardust_dungeon_portal": [
			{"type":"crafting_shapeless","result_count":1,"category":"misc","ingredients":[
				ingr_repr("awakened_stardust_block", ns),ingr_repr("awakened_stardust_ore", ns),ingr_repr("awakened_stardust_block", ns),
				ingr_repr("awakened_stardust_ore", ns),ingr_repr("stardust_portal", ns),ingr_repr("awakened_stardust_ore", ns),
				ingr_repr("awakened_stardust_block", ns),ingr_repr("awakened_stardust_ore", ns),ingr_repr("awakened_stardust_block", ns),
			]},
		],
	}

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
				{"text":"\nMined from Stardust Ore found in the overworld","color":"gray"},
				{"text":"\nUsed to craft ingots, tools, armor, and machines","color":"gray"},
			],
			RESULT_OF_CRAFTING: [
				{"type":"smelting","result_count":2,"category":"misc","experience":0.8,"cookingtime":200,"ingredient":ingr_repr("stardust_ore", ns)},
				{"type":"blasting","result_count":2,"category":"misc","experience":0.8,"cookingtime":100,"ingredient":ingr_repr("stardust_ore", ns)},
				{"type":"smelting","result_count":4,"category":"misc","experience":0.8,"cookingtime":200,"ingredient":ingr_repr("deepslate_stardust_ore", ns)},
				{"type":"blasting","result_count":4,"category":"misc","experience":0.8,"cookingtime":100,"ingredient":ingr_repr("deepslate_stardust_ore", ns)},
				{"type":"crafting_shapeless","result_count":8,"category":"misc","ingredients":[ingr_repr("stardust_ingot", ns)]},
			]
		},
		"stardust_ingot": {
			"id": CUSTOM_ITEM_VANILLA, CATEGORY: MATERIALS,
			WIKI_COMPONENT: [
				{"text":"Refined stardust material for advanced crafting.","color":"yellow"},
				{"text":"\nCrafted from Stardust Fragments","color":"gray"},
				{"text":"\nUsed in tool, armor, and machine construction","color":"gray"},
			],
			RESULT_OF_CRAFTING: [
				{"type":"smelting","result_count":2,"category":"misc","experience":0.8,"cookingtime":200,"ingredient":ingr_repr("nether_stardust_ore", ns)},
				{"type":"blasting","result_count":2,"category":"misc","experience":0.8,"cookingtime":100,"ingredient":ingr_repr("nether_stardust_ore", ns)},
				{"type":"crafting_shapeless","result_count":1,"category":"misc","ingredients":[ingr_repr("minecraft:iron_ingot")] + 8*[ingr_repr("stardust_fragment", ns)]},
				{"type":"crafting_shapeless","result_count":1,"category":"misc","ingredients":[ingr_repr("minecraft:copper_ingot")] + 8*[ingr_repr("stardust_fragment", ns)]},
				{"type":"crafting_shapeless","result_count":1,"category":"misc","ingredients":[ingr_repr("minecraft:gold_ingot")] + 8*[ingr_repr("stardust_fragment", ns)]},
				{"type":"crafting_shapeless","result_count":8,"category":"misc","ingredients":[ingr_repr("stardust_essence", ns)]},
				{"type":"crafting_shapeless","result_count":9,"category":"misc","ingredients":[ingr_repr("stardust_block", ns)]},
			]
		},
		"stardust_block": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: MATERIALS,
			VANILLA_BLOCK: {"id":"minecraft:lapis_block", "apply_facing":False},
			WIKI_COMPONENT: [
				{"text":"Compressed stardust for storage and crafting.","color":"yellow"},
				{"text":"\nCrafted from 8 Stardust Ingots and a Diamond Block","color":"gray"},
			],
			RESULT_OF_CRAFTING:[
				{"type":"crafting_shapeless","result_count":1,"category":"misc","ingredients":[ingr_repr("minecraft:diamond_block")] + 8*[ingr_repr("stardust_ingot", ns)]},
				{"type":"crafting_shapeless","result_count":1,"category":"misc","ingredients":[ingr_repr("minecraft:gold_block")] + 8*[ingr_repr("stardust_ingot", ns)]},
			],
		},
		"stardust_essence": {
			"id": CUSTOM_ITEM_VANILLA, CATEGORY: MATERIALS,
			WIKI_COMPONENT: [
				{"text":"Concentrated stardust energy.","color":"yellow"},
				{"text":"\nCrafted from Stardust Ingots","color":"gray"},
				{"text":"\nUsed in high-tier crafting recipes","color":"gray"},
			],
			RESULT_OF_CRAFTING: [
				{"type":"smelting","result_count":1,"category":"misc","experience":0.8,"cookingtime":200,"ingredient":ingr_repr("ender_stardust_ore", ns)},
				{"type":"blasting","result_count":1,"category":"misc","experience":0.8,"cookingtime":100,"ingredient":ingr_repr("ender_stardust_ore", ns)},
				{"type":"crafting_shapeless","result_count":1,"category":"misc","ingredients":[ingr_repr("minecraft:blaze_powder")] + 8*[ingr_repr("stardust_ingot", ns)]},
				{"type":"crafting_shapeless","result_count":1,"category":"misc","ingredients":[ingr_repr("minecraft:wind_charge")] + 8*[ingr_repr("stardust_ingot", ns)]},
				{"type":"crafting_shapeless","result_count":8,"category":"misc","ingredients":[ingr_repr("stardust_core", ns)]},
			]
		},
		"stardust_core": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: MATERIALS,
			VANILLA_BLOCK: {"id":"minecraft:diamond_block", "apply_facing":False},
			WIKI_COMPONENT: [
				{"text":"Central component of stardust technology.","color":"yellow"},
				{"text":"\nCrafted from Stardust Essences","color":"gray"},
				{"text":"\nUsed in top-tier crafting recipes","color":"gray"},
			],
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shapeless","result_count":1,"category":"misc","ingredients":[ingr_repr("minecraft:crafter")] + 8*[ingr_repr("stardust_essence", ns)]},
				{"type":"crafting_shapeless","result_count":1,"category":"misc","ingredients":[ingr_repr("minecraft:observer")] + 8*[ingr_repr("stardust_essence", ns)]},
			]
		},
		"compacted_stardust_shard": {
			"id": CUSTOM_ITEM_VANILLA, CATEGORY: MATERIALS,
			WIKI_COMPONENT: [
				{"text":"Component of stardust technology.","color":"yellow"},
				{"text":"\nFilled with stardust energy","color":"gray"},
				{"text":"\nUsed in high-tier crafting recipes","color":"gray"},
			],
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shapeless","result_count":1,"category":"misc","ingredients":[ingr_repr("minecraft:amethyst_shard")] + 8*[ingr_repr("stardust_block", ns)]},
			]
		},
		"awakened_stardust": {
			"id": CUSTOM_ITEM_VANILLA, CATEGORY: MATERIALS,
			WIKI_COMPONENT: [
				{"text":"Enhanced stardust with increased energy potential.","color":"yellow"},
				{"text":"\nObtained through mining or some special mobs","color":"gray"},
				{"text":"\nRequired for advanced equipment and machines","color":"gray"},
			],
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shapeless","result_count":8,"category":"misc","ingredients":[ingr_repr("awakened_stardust_block", ns)]},
			]
		},
		"awakened_stardust_block": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: MATERIALS,
			VANILLA_BLOCK: {"id":"minecraft:redstone_block", "apply_facing":False},
			WIKI_COMPONENT: [
				{"text":"Compressed awakened stardust block.","color":"yellow"},
				{"text":"\nCrafted from 8 Awakened Stardust","color":"gray"},
				{"text":"\nRequired for advanced equipment and machines","color":"gray"},
			],
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shapeless","result_count":1,"category":"misc","ingredients":[ingr_repr("quadruple_compressed_cobblestone", ns)] + 8*[ingr_repr("awakened_stardust", ns)]},
			]
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
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shapeless","result_count":1,"category":"misc","ingredients":[ingr_repr("minecraft:ender_pearl")] + 8*[ingr_repr("minecraft:dragon_breath")]},
				{"type":"crafting_shapeless","result_count":1,"category":"misc","ingredients":[ingr_repr("ender_dragon_pearl", ns)]},
			]
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
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shapeless","result_count":1,"category":"misc","ingredients":[ingr_repr("dragon_pearl", ns)] + 8*[ingr_repr("minecraft:ender_pearl")]},
			]
		},
		"legendarium_fragment": {
			"id": CUSTOM_ITEM_VANILLA, CATEGORY: MATERIALS,
			WIKI_COMPONENT: [
				{"text":"Legendary material fragment with wind power.","color":"yellow"},
				{"text":"\nExtremely rare and valuable","color":"gray"},
				{"text":"\nObtained through legendarium seeds","color":"gray"},
				{"text":"\nUsed for legendarium-tier equipment","color":"gray"},
			],
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shapeless","result_count":8,"category":"misc","ingredients":[ingr_repr("legendarium_ingot", ns)]},
			]
		},
		"legendarium_ingot": {
			"id": CUSTOM_ITEM_VANILLA, CATEGORY: MATERIALS,
			WIKI_COMPONENT: [
				{"text":"Refined legendary material with wind power.","color":"yellow"},
				{"text":"\nExtremely rare and valuable","color":"gray"},
				{"text":"\nUsed for legendarium-tier equipment","color":"gray"},
			],
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shapeless","result_count":1,"category":"misc","ingredients":[ingr_repr("stardust_ingot", ns)] + 8*[ingr_repr("legendarium_fragment", ns)]},
				{"type":"crafting_shapeless","result_count":8,"category":"misc","ingredients":[ingr_repr("legendarium_block", ns)]},
			]
		},
		"legendarium_block": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: MATERIALS,
			VANILLA_BLOCK: {"id":"minecraft:emerald_block", "apply_facing":False},
			WIKI_COMPONENT: [
				{"text":"Compressed legendarium storage block.","color":"yellow"},
				{"text":"\nCrafted from 9 Legendarium Ingots","color":"gray"},
			],
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shapeless","result_count":1,"category":"misc","ingredients":[ingr_repr("stardust_block", ns)] + 8*[ingr_repr("legendarium_ingot", ns)]},
			]
		},
		"solarium_fragment": {
			"id": CUSTOM_ITEM_VANILLA, CATEGORY: MATERIALS,
			WIKI_COMPONENT: [
				{"text":"Solarium material fragment with fire power.","color":"yellow"},
				{"text":"\nExtremely rare and valuable","color":"gray"},
				{"text":"\nObtained through solarium seeds","color":"gray"},
				{"text":"\nUsed for solarium-tier equipment","color":"gray"},
			],
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shapeless","result_count":8,"category":"misc","ingredients":[ingr_repr("solarium_ingot", ns)]},
			]
		},
		"solarium_ingot": {
			"id": CUSTOM_ITEM_VANILLA, CATEGORY: MATERIALS,
			WIKI_COMPONENT: [
				{"text":"Refined solarium material with fire power.","color":"yellow"},
				{"text":"\nExtremely rare and valuable","color":"gray"},
				{"text":"\nUsed for solarium-tier equipment","color":"gray"},
			],
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shapeless","result_count":1,"category":"misc","ingredients":[ingr_repr("stardust_ingot", ns)] + 8*[ingr_repr("solarium_fragment", ns)]},
				{"type":"crafting_shapeless","result_count":8,"category":"misc","ingredients":[ingr_repr("solarium_block", ns)]},
			]
		},
		"solarium_block": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: MATERIALS,
			VANILLA_BLOCK: {"id":"minecraft:waxed_copper_block", "apply_facing":False},
			WIKI_COMPONENT: [
				{"text":"Compressed solarium storage block.","color":"yellow"},
				{"text":"\nCrafted from 9 Solarium Ingots","color":"gray"},
			],
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shapeless","result_count":1,"category":"misc","ingredients":[ingr_repr("stardust_block", ns)] + 8*[ingr_repr("solarium_ingot", ns)]},
			]
		},
		"darkium_fragment": {
			"id": CUSTOM_ITEM_VANILLA, CATEGORY: MATERIALS,
			WIKI_COMPONENT: [
				{"text":"Darkium material fragment with darkness power.","color":"yellow"},
				{"text":"\nExtremely rare and valuable","color":"gray"},
				{"text":"\nObtained through darkium seeds","color":"gray"},
				{"text":"\nUsed for darkium-tier equipment","color":"gray"},
			],
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shapeless","result_count":8,"category":"misc","ingredients":[ingr_repr("darkium_ingot", ns)]},
			]
		},
		"darkium_ingot": {
			"id": CUSTOM_ITEM_VANILLA, CATEGORY: MATERIALS,
			WIKI_COMPONENT: [
				{"text":"Refined darkium material with darkness power.","color":"yellow"},
				{"text":"\nExtremely rare and valuable","color":"gray"},
				{"text":"\nUsed for darkium-tier equipment","color":"gray"},
			],
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shapeless","result_count":1,"category":"misc","ingredients":[ingr_repr("stardust_ingot", ns)] + 8*[ingr_repr("darkium_fragment", ns)]},
				{"type":"crafting_shapeless","result_count":8,"category":"misc","ingredients":[ingr_repr("darkium_block", ns)]},
			]
		},
		"darkium_block": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: MATERIALS,
			VANILLA_BLOCK: {"id":"minecraft:netherite_block", "apply_facing":False},
			WIKI_COMPONENT: [
				{"text":"Compressed darkium storage block.","color":"yellow"},
				{"text":"\nCrafted from 9 Darkium Ingots","color":"gray"},
			],
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shapeless","result_count":1,"category":"misc","ingredients":[ingr_repr("stardust_block", ns)] + 8*[ingr_repr("darkium_ingot", ns)]},
			]
		},
		"ultimate_shard": {
			"id": CUSTOM_ITEM_VANILLA, CATEGORY: MATERIALS,
			WIKI_COMPONENT: [
				{"text":"The ultimate refined material.","color":"yellow"},
				{"text":"\nSmelted from Ultimate Fragments","color":"gray"},
				{"text":"\nUsed for ultimate equipment","color":"gray"},
			],
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shapeless","result_count":1,"category":"misc","ingredients":[
					ingr_repr("minecraft:popped_chorus_fruit"),ingr_repr("stardust_core", ns),ingr_repr("minecraft:echo_shard"),
					ingr_repr("legendarium_block", ns),ingr_repr("compacted_stardust_shard", ns),ingr_repr("solarium_block", ns),
					ingr_repr("minecraft:resin_brick"),ingr_repr("darkium_block", ns),ingr_repr("minecraft:turtle_scute"),
				]},
			]
		},
		"dog_excrement": {
			"id": CUSTOM_ITEM_VANILLA, CATEGORY: MATERIALS,
			"item_name": {"text":"Dog Excrement","italic":False,"color":"#693100"},
			WIKI_COMPONENT: [
				{"text":"A smelly piece of dog excrement.","color":"#693100"},
				{"text":"\nUsed for comedic purposes and boss summoning","color":"gray"},
				{"text":"\nEvery wolf lays an excrement item every 5-10 minutes","color":"gray"},
			],
			USED_FOR_CRAFTING: [
				{"type":PULVERIZING,"result_count":{"type":"minecraft:uniform","min":4,"max":6},"category":"misc","ingredient":ingr_repr("dog_excrement", ns),"result":ingr_repr("minecraft:bone_meal")},
			]
		},
		**{
			f"{current}_cobblestone": {
				"id": CUSTOM_BLOCK_VANILLA, CATEGORY: MATERIALS,
				VANILLA_BLOCK: {"id":"minecraft:deepslate" if i < 4 else "minecraft:obsidian", "apply_facing":False},
				"lore": [
					{"text":f"Equivalent to {9**(i+1):,} cobblestones","color":"gray","italic":False},
				],
				WIKI_COMPONENT: [
					{"text":f"{current.capitalize()} compressed cobblestone.","color":"yellow"},
					{"text":f"\nEquals to {9**(i+1):,} cobblestones","color":"gray"},
				],
				RESULT_OF_CRAFTING: [
					{"type":"crafting_shapeless","result_count": 1,"category":"misc","ingredients":9*[ingr_repr(f"{prev}_cobblestone", ns) if prev else ingr_repr("minecraft:cobblestone")]},
				] + ([
					{"type":"crafting_shapeless","result_count": 9,"category":"misc","ingredients":[ingr_repr(f"{next_t}_cobblestone", ns)]}
				] if next_t else [])
			}
			for i, (prev, current, next_t) in enumerate(zip([None] + COBBLESTONE_TIERS[:-1], COBBLESTONE_TIERS, COBBLESTONE_TIERS[1:] + [None], strict=True))
		},
		"stardust_frame": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: MATERIALS,
			VANILLA_BLOCK: {"id":"minecraft:lapis_block", "apply_facing":False},
			WIKI_COMPONENT: [
				{"text":"Enhanced machine block with stardust.","color":"yellow"},
				{"text":"\nUsed as a base for most advanced machines","color":"gray"},
			],
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["BBB","CMC","SSS"],"ingredients":{"B":ingr_repr("minecraft:blue_glazed_terracotta"),"C":ingr_repr("compacted_stardust_shard", ns),"M":ingr_repr("machine_block", "simplenergy"),"S":ingr_repr("stardust_block", ns)}},
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["SSS","CMC","BBB"],"ingredients":{"B":ingr_repr("minecraft:blue_glazed_terracotta"),"C":ingr_repr("compacted_stardust_shard", ns),"M":ingr_repr("machine_block", "simplenergy"),"S":ingr_repr("stardust_block", ns)}},
			]
		},
		"awakened_stardust_frame": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: MATERIALS,
			VANILLA_BLOCK: {"id":"minecraft:redstone_block", "apply_facing":False},
			WIKI_COMPONENT: [
				{"text":"Awakened frame made with stardust.","color":"yellow"},
				{"text":"\nFurther upgraded version of the machine block","color":"gray"},
				{"text":"\nUsed for top-tier machines","color":"gray"},
			],
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["NNN","ASA","BBB"],"ingredients":{"N":ingr_repr("minecraft:nether_wart_block"),"A":ingr_repr("awakened_stardust", ns),"S":ingr_repr("stardust_frame", ns),"B":ingr_repr("awakened_stardust_block", ns)}},
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["BBB","ASA","NNN"],"ingredients":{"N":ingr_repr("minecraft:nether_wart_block"),"A":ingr_repr("awakened_stardust", ns),"S":ingr_repr("stardust_frame", ns),"B":ingr_repr("awakened_stardust_block", ns)}},
			]
		},
		"ultimate_frame": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: MATERIALS,
			VANILLA_BLOCK: {"id":"minecraft:crying_obsidian", "apply_facing":False},
			WIKI_COMPONENT: [
				{"text":"Ultimate frame made with advanced materials.","color":"yellow"},
				{"text":"\nFinal upgraded version of the machine block","color":"gray"},
				{"text":"\nUsed for final-tier machines","color":"gray"},
			],
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["LSD","UAU","PPP"],"ingredients":{"L":ingr_repr("legendarium_block", ns),"S":ingr_repr("solarium_block", ns),"D":ingr_repr("darkium_block", ns),"U":ingr_repr("ultimate_shard", ns),"A":ingr_repr("awakened_stardust_frame", ns),"P":ingr_repr("minecraft:stripped_pale_oak_wood")}},
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["PPP","UAU","LSD"],"ingredients":{"L":ingr_repr("legendarium_block", ns),"S":ingr_repr("solarium_block", ns),"D":ingr_repr("darkium_block", ns),"U":ingr_repr("ultimate_shard", ns),"A":ingr_repr("awakened_stardust_frame", ns),"P":ingr_repr("minecraft:stripped_pale_oak_wood")}},
			]
		},
		"mirror": {
			"id": CUSTOM_ITEM_VANILLA, CATEGORY: MATERIALS,
			WIKI_COMPONENT: [
				{"text":"Reflective surface for advanced optics.","color":"yellow"},
				{"text":"\nUsed for upgrading solar panels","color":"gray"},
			],
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shapeless","result_count":1,"category":"misc","ingredients":4*[ingr_repr("minecraft:black_stained_glass")] + [ingr_repr("minecraft:quartz_block")]},
				{"type":"crafting_shapeless","result_count":1,"category":"misc","ingredients":4*[ingr_repr("minecraft:tinted_glass")] + [ingr_repr("minecraft:quartz_block")]},
			]
		},
		"stardust_photovoltaic_cell": {
			"id": CUSTOM_ITEM_VANILLA, CATEGORY: MATERIALS,
			WIKI_COMPONENT: [
				{"text":"Photovoltaic cell made from stardust.","color":"yellow"},
				{"text":"\nUsed to convert sunlight into energy","color":"gray"},
			],
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["FFF","MMM"," I "],"ingredients":{"F":ingr_repr("stardust_fragment", ns),"M":ingr_repr("mirror", ns),"I":ingr_repr("stardust_ingot", ns)}},
			]
		},
		"awakened_photovoltaic_cell": {
			"id": CUSTOM_ITEM_VANILLA, CATEGORY: MATERIALS,
			WIKI_COMPONENT: [
				{"text":"Awakened photovoltaic cell made from stardust.","color":"yellow"},
				{"text":"\nUsed to convert sunlight into energy more efficiently","color":"gray"},
			],
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["FFF","SSS","FFF"],"ingredients":{"F":ingr_repr("awakened_stardust", ns),"S":ingr_repr("stardust_photovoltaic_cell", ns)}},
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["FSF","FSF","FSF"],"ingredients":{"F":ingr_repr("awakened_stardust", ns),"S":ingr_repr("stardust_photovoltaic_cell", ns)}},
			]
		},
		"legendarium_photovoltaic_cell": {
			"id": CUSTOM_ITEM_VANILLA, CATEGORY: MATERIALS,
			WIKI_COMPONENT: [
				{"text":"Legendarium photovoltaic cell made from legendary energy.","color":"yellow"},
				{"text":"\nUsed to convert sunlight into energy even more efficiently","color":"gray"},
			],
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["III","AAA","III"],"ingredients":{"I":ingr_repr("legendarium_ingot", ns),"A":ingr_repr("awakened_photovoltaic_cell", ns)}},
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["IAI","IAI","IAI"],"ingredients":{"I":ingr_repr("legendarium_ingot", ns),"A":ingr_repr("awakened_photovoltaic_cell", ns)}},
			]
		},
		"solarium_photovoltaic_cell": {
			"id": CUSTOM_ITEM_VANILLA, CATEGORY: MATERIALS,
			WIKI_COMPONENT: [
				{"text":"Solarium photovoltaic cell made from solar energy.","color":"yellow"},
				{"text":"\nUsed to convert sunlight into energy even more efficiently","color":"gray"},
			],
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["III","AAA","III"],"ingredients":{"I":ingr_repr("solarium_ingot", ns),"A":ingr_repr("awakened_photovoltaic_cell", ns)}},
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["IAI","IAI","IAI"],"ingredients":{"I":ingr_repr("solarium_ingot", ns),"A":ingr_repr("awakened_photovoltaic_cell", ns)}},
			]
		},
		"darkium_photovoltaic_cell": {
			"id": CUSTOM_ITEM_VANILLA, CATEGORY: MATERIALS,
			WIKI_COMPONENT: [
				{"text":"Darkium photovoltaic cell made from dark energy.","color":"yellow"},
				{"text":"\nUsed to convert sunlight into energy even more efficiently","color":"gray"},
			],
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["III","AAA","III"],"ingredients":{"I":ingr_repr("darkium_ingot", ns),"A":ingr_repr("awakened_photovoltaic_cell", ns)}},
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["IAI","IAI","IAI"],"ingredients":{"I":ingr_repr("darkium_ingot", ns),"A":ingr_repr("awakened_photovoltaic_cell", ns)}},
			]
		},
		"ultimate_photovoltaic_cell": {
			"id": CUSTOM_ITEM_VANILLA, CATEGORY: MATERIALS,
			WIKI_COMPONENT: [
				{"text":"Ultimate photovoltaic cell made from stardust.","color":"yellow"},
				{"text":"\nUsed to convert sunlight into energy with ultimate efficiency","color":"gray"},
				{"text":"\nCrafted from ultimate materials","color":"gray"},
			],
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["LSD"," U "],"ingredients":{"L":ingr_repr("legendarium_photovoltaic_cell", ns),"S":ingr_repr("solarium_photovoltaic_cell", ns),"D":ingr_repr("darkium_photovoltaic_cell", ns),"U":ingr_repr("ultimate_shard", ns)}},
				{"type":"crafting_shapeless","result_count":1,"category":"misc","ingredients":[ingr_repr("legendarium_photovoltaic_cell", ns),ingr_repr("solarium_photovoltaic_cell", ns),ingr_repr("darkium_photovoltaic_cell", ns),ingr_repr("ultimate_shard", ns)]},
			]
		},
		"empty_module": {
			"id": CUSTOM_ITEM_VANILLA, CATEGORY: MATERIALS,
			WIKI_COMPONENT: [
				{"text":"Empty module for quarry's upgrade.","color":"yellow"},
				{"text":"\nCan be filled with various materials","color":"gray"},
			],
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shapeless","result_count":1,"category":"misc","ingredients":8*[ingr_repr("minecraft:map")] + [ingr_repr("simplunium_ingot", "simplenergy")]},
			]
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
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["SGS","GCG","SGS"],"ingredients":{"S":ingr_repr("stardust_block", ns),"G":ingr_repr("minecraft:gold_block"),"C":ingr_repr("elite_cable", "simplenergy")}},
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["GSG","SCS","GSG"],"ingredients":{"S":ingr_repr("stardust_block", ns),"G":ingr_repr("minecraft:gold_block"),"C":ingr_repr("elite_cable", "simplenergy")}},
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
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["BRB","RCR","BRB"],"ingredients":{"B":ingr_repr("awakened_stardust_block", ns),"R":ingr_repr("minecraft:redstone_block"),"C":ingr_repr("stardust_cable", ns)}},
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["RBR","BCB","RBR"],"ingredients":{"B":ingr_repr("awakened_stardust_block", ns),"R":ingr_repr("minecraft:redstone_block"),"C":ingr_repr("stardust_cable", ns)}},
			]
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
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shapeless","result_count":1,"category":"misc","ingredients":[
					ingr_repr("compacted_stardust_shard", ns),ingr_repr("legendarium_ingot", ns),ingr_repr("compacted_stardust_shard", ns),
					ingr_repr("solarium_ingot", ns),ingr_repr("awakened_stardust_cable", ns),ingr_repr("darkium_ingot", ns),
					ingr_repr("compacted_stardust_shard", ns),ingr_repr("stardust_core", ns),ingr_repr("compacted_stardust_shard", ns),
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
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["EEE","CBC","SSS"],"ingredients":{"E":ingr_repr("stardust_essence", ns),"C":ingr_repr("compacted_stardust_shard", ns),"B":ingr_repr("elite_battery", "simplenergy"),"S":ingr_repr("stardust_block", ns)}},
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
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["RRR","SBS","AAA"],"ingredients":{"R":ingr_repr("minecraft:redstone_block"),"S":ingr_repr("awakened_stardust", ns),"B":ingr_repr("stardust_battery", ns),"A":ingr_repr("awakened_stardust_block", ns)}},
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["AAA","SBS","RRR"],"ingredients":{"R":ingr_repr("minecraft:redstone_block"),"S":ingr_repr("awakened_stardust", ns),"B":ingr_repr("stardust_battery", ns),"A":ingr_repr("awakened_stardust_block", ns)}},
			]
		},
		"ultimate_battery": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: ENERGY, "custom_data": {"energy": {"storage":0, "max_storage":10000000}},
			VANILLA_BLOCK: {"id":"minecraft:crying_obsidian", "apply_facing":False},
			"item_name": {"text":"Ultimate Battery","color":"dark_red"},
			WIKI_COMPONENT: [
				{"text":"Ultimate energy storage device.","color":"yellow"},
				{"text":"\nStores up to 10 GJ of energy","color":"gray"},
			],
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["SSS","FBF","CCC"],"ingredients":{"S":ingr_repr("ultimate_shard", ns),"F":ingr_repr("ultimate_frame", ns),"B":ingr_repr("awakened_stardust_battery", ns),"C":ingr_repr("stardust_core", ns)}},
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["CCC","FBF","SSS"],"ingredients":{"S":ingr_repr("ultimate_shard", ns),"F":ingr_repr("ultimate_frame", ns),"B":ingr_repr("awakened_stardust_battery", ns),"C":ingr_repr("stardust_core", ns)}},
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
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["CCC","EPE","BBB"],"ingredients":{"C":ingr_repr("stardust_photovoltaic_cell", ns),"E":ingr_repr("stardust_essence", ns),"P":ingr_repr("solar_panel", "simplenergy"),"B":ingr_repr("minecraft:lapis_block")}},
			]
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
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["CCC","APA","BBB"],"ingredients":{"C":ingr_repr("awakened_photovoltaic_cell", ns),"A":ingr_repr("awakened_stardust_block", ns),"P":ingr_repr("stardust_solar_panel", ns),"B":ingr_repr("minecraft:iron_block")}},
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
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["CCC","EPE","BBB"],"ingredients":{"C":ingr_repr("legendarium_photovoltaic_cell", ns),"E":ingr_repr("legendarium_ingot", ns),"P":ingr_repr("awakened_solar_panel", ns),"B":ingr_repr("minecraft:calcite")}},
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
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["CCC","EPE","BBB"],"ingredients":{"C":ingr_repr("solarium_photovoltaic_cell", ns),"E":ingr_repr("solarium_ingot", ns),"P":ingr_repr("awakened_solar_panel", ns),"B":ingr_repr("minecraft:calcite")}},
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
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["CCC","EPE","BBB"],"ingredients":{"C":ingr_repr("darkium_photovoltaic_cell", ns),"E":ingr_repr("darkium_ingot", ns),"P":ingr_repr("awakened_solar_panel", ns),"B":ingr_repr("simplunium_block", "simplenergy")}},
			]
		},
		"ultimate_solar_panel": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: ENERGY, "custom_data": {"energy": {"generation":128, "max_storage":20000}},
			VANILLA_BLOCK: {"id":"minecraft:daylight_detector", "apply_facing":False},
			OVERRIDE_MODEL: {"parent":"block/daylight_detector", "textures": {"side": f"{ns}:item/ultimate_solar_panel_side", "top": f"{ns}:item/ultimate_solar_panel_top"}},
			WIKI_COMPONENT: [
				{"text":"Ultimate solar panel combining all three elements.","color":"yellow"},
				{"text":"\nGenerates 128 kW during daylight only","color":"gray"},
			],
			RESULT_OF_CRAFTING: unique_list([
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["CCC","SPS","XYZ"],"ingredients":{
					"C":ingr_repr("ultimate_photovoltaic_cell", ns),
					"S":ingr_repr("ultimate_shard", ns),
					"P":ingr_repr(f"{panel}_solar_panel", ns),
					"X":ingr_repr(f"{X}_block", ns),
					"Y":ingr_repr("stardust_core", ns),
					"Z":ingr_repr(f"{Z}_block", ns)
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
			f"quarry_lv{i+1}": {
				"id": CUSTOM_BLOCK_VANILLA, CATEGORY: ENERGY,
				"custom_data": {"energy": {"usage":usage, "max_storage":storage}, ns: {"quarry": {"block_per_second":block_per_second}}},
				VANILLA_BLOCK: {"id":"minecraft:barrel", "apply_facing":False},
				"item_name": {"text":f"Quarry Lv.{i+1}","italic":False,"color":"white"},
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
				RESULT_OF_CRAFTING: QUARRY_CRAFTING_RECIPES[f"quarry_lv{i+1}"],
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
				VANILLA_BLOCK: {"id":"minecraft:barrel", "apply_facing":False},
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
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shapeless","result_count":1,"category":"misc","ingredients":[
					ingr_repr("ultimate_shard", ns),ingr_repr("ultimate_shard", ns),ingr_repr("ultimate_shard", ns),
					ingr_repr("ultimate_frame", ns),ingr_repr("stardust_dungeon_portal", ns),ingr_repr("ultimate_frame", ns),
					ingr_repr("minecraft:crying_obsidian"),ingr_repr("minecraft:crying_obsidian"),ingr_repr("minecraft:crying_obsidian"),
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
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["EEE","DSD","FFF"],"ingredients":{"E":ingr_repr("stardust_essence", ns),"D":ingr_repr("dog_excrement", ns),"S":ingr_repr("diamond_seed", ns),"F":ingr_repr("stardust_frame", ns)}},
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["FFF","DSD","EEE"],"ingredients":{"E":ingr_repr("stardust_essence", ns),"D":ingr_repr("dog_excrement", ns),"S":ingr_repr("diamond_seed", ns),"F":ingr_repr("stardust_frame", ns)}},
			]
		},
		"mob_grinder": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: ENERGY,
			"custom_data": {"energy": {"usage":100, "max_storage":15000}},
			VANILLA_BLOCK: {"id":"minecraft:barrel", "apply_facing":False},
			"item_name": {"text":"Mob Grinder","italic":False,"color":"white"},
			WIKI_COMPONENT: [
				{"text":"Automated mob killing machine.","color":"yellow"},
				{"text":"\nKills mobs in a large area in front of it","color":"gray"},
				{"text":"\nConsumes 100 kW of power","color":"gray"},
			],
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["AAA","DSD","FFF"],"ingredients":{"A":ingr_repr("awakened_stardust_block", ns),"D":ingr_repr("ender_dragon_pearl", ns),"S":ingr_repr("minecraft:wither_skeleton_skull"),"F":ingr_repr("awakened_stardust_frame", ns)}},
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["FFF","DSD","AAA"],"ingredients":{"A":ingr_repr("awakened_stardust_block", ns),"D":ingr_repr("ender_dragon_pearl", ns),"S":ingr_repr("minecraft:wither_skeleton_skull"),"F":ingr_repr("awakened_stardust_frame", ns)}},
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
				{"text":"\nEnergy buffer: 30 MJ","color":"gray"},
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
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["SSS","CFC","BBB"],"ingredients":{"S":ingr_repr("stardust_frame", ns),"C":ingr_repr("compacted_stardust_shard", ns),"F":ingr_repr("advanced_furnace_generator", ns),"B":ingr_repr("stardust_block", ns)}},
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["BBB","CFC","SSS"],"ingredients":{"S":ingr_repr("stardust_frame", ns),"C":ingr_repr("compacted_stardust_shard", ns),"F":ingr_repr("advanced_furnace_generator", ns),"B":ingr_repr("stardust_block", ns)}},
			]
		},
		"awakened_furnace_generator": {
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
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["AAA","DFD","BBB"],"ingredients":{"A":ingr_repr("awakened_stardust_frame", ns),"D":ingr_repr("ender_dragon_pearl", ns),"F":ingr_repr("stardust_furnace_generator", ns),"B":ingr_repr("awakened_stardust_block", ns)}},
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["BBB","DFD","AAA"],"ingredients":{"A":ingr_repr("awakened_stardust_frame", ns),"D":ingr_repr("ender_dragon_pearl", ns),"F":ingr_repr("stardust_furnace_generator", ns),"B":ingr_repr("awakened_stardust_block", ns)}},
			]
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
				{"text":"\n\nWhen on Chest:","color":"gray"},
				{"text":"\n+10 Armor","color":"blue"},
				{"text":"\n+4 Armor Toughness","color":"blue"},
				{"text":"\n+1 Knockback Resistance","color":"blue"},
			],
		},
		"stardust_bow": {
			"id": "minecraft:bow", CATEGORY: EQUIPMENT,
			"max_damage": 768,	# x2 the durability of regular bow (384)
			WIKI_COMPONENT: [
				{"text":"Bow crafted from stardust materials.","color":"yellow"},
				{"text":"\nHigher durability (x2) and power (x1.5) than regular bows","color":"gray"},	# TODO: Implement power increase
				{"text":"\nShooting while sneaking makes no gravity arrows","color":"gray"},	# TODO: Implement this behavior
			],
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":[" CS","C S"," CS"],"ingredients":{"C":ingr_repr("compacted_stardust_shard", ns),"S":ingr_repr("minecraft:string")}},
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["SC ","S C","SC "],"ingredients":{"C":ingr_repr("compacted_stardust_shard", ns),"S":ingr_repr("minecraft:string")}},
			]
		},
		"awakened_stardust_bow": {
			"id": "minecraft:bow", CATEGORY: EQUIPMENT,
			"max_damage": 1536,	# x4 the durability of regular bow (384)
			WIKI_COMPONENT: [
				{"text":"Bow crafted from awakened stardust materials.","color":"yellow"},
				{"text":"\nHigher durability (x4) and power (x2) than regular bows","color":"gray"},
				{"text":"\nShooting while sneaking makes no gravity arrows","color":"gray"},
			],
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["ASA","SBS","ASA"],"ingredients":{"A":ingr_repr("awakened_stardust_frame", ns),"S":ingr_repr("sextuple_compressed_cobblestone", ns),"B":ingr_repr("stardust_bow", ns)}},
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["SAS","ABA","SAS"],"ingredients":{"A":ingr_repr("awakened_stardust_frame", ns),"S":ingr_repr("sextuple_compressed_cobblestone", ns),"B":ingr_repr("stardust_bow", ns)}},
			]
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
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shapeless","result_count":1,"category":"misc","ingredients":[
					ingr_repr("dragon_pearl", ns),ingr_repr("dragon_pearl", ns),ingr_repr("compacted_stardust_shard", ns),
					ingr_repr("compacted_stardust_shard", ns),ingr_repr("minecraft:diamond_spear"),ingr_repr("compacted_stardust_shard", ns),
					ingr_repr("compacted_stardust_shard", ns),ingr_repr("dragon_pearl", ns),ingr_repr("dragon_pearl", ns)
				]},
			]
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
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["ASA","SBS","ASA"],"ingredients":{"A":ingr_repr("awakened_stardust_frame", ns),"S":ingr_repr("sextuple_compressed_cobblestone", ns),"B":ingr_repr("stardust_sniper", ns)}},
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["SAS","ABA","SAS"],"ingredients":{"A":ingr_repr("awakened_stardust_frame", ns),"S":ingr_repr("sextuple_compressed_cobblestone", ns),"B":ingr_repr("stardust_sniper", ns)}},
			]
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
		**{
			f"{artifact}_artifact_lv{i+1 if i < 3 else 'max'}": {
				"id": CUSTOM_ITEM_VANILLA, CATEGORY: EQUIPMENT,
				"item_name": {"text":f"{artifact.capitalize()} Artifact Lv.{i+1 if i < 3 else 'Max'}"},
				"rarity": "epic" if i == 3 else "rare",
				"lore": [
					{"text":f"Hold in any hand to get the {artifact} effect","color":"gray","italic":False},
					{"text":f"[+{level}% {lore}]","color":"gray","italic":False},
				],
				"attribute_modifiers": [{"type":attribute,"amount":level/100,"operation":"add_multiplied_total" if artifact != "speed" else "add_multiplied_base","slot":"hand","id":f"stardust:base_{attribute}"}],
				WIKI_COMPONENT: [
					{"text":f"Lv.{i+1 if i < 3 else 'Max'} {artifact} Artifact","color":"yellow"},
					{"text":f"\nHold in any hand to get the {artifact} effect","color":"gray"},
					{"text":f"\n[+{level}% {lore}]","color":"gray"},
					*([] if i > 0 else [{"text":"\n\nCan be obtained from Lucky Artifact Bags only","color":"gray"}]),
				],
				RESULT_OF_CRAFTING: [
					{"type":"crafting_shapeless","result_count":1,"category":"misc","ingredients":2*[ingr_repr(f"{artifact}_artifact_lv{i}", ns)]},
				] if i > 0 else []
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
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shapeless","result_count":1,"category":"misc","ingredients":8*[ingr_repr("minecraft:leather")] + [ingr_repr("ultimate_shard", ns)]},
			]
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
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["U U","A A","AAA"],"ingredients":{"U":ingr_repr("ultimate_shard", ns),"A":ingr_repr("awakened_stardust_block", ns)}},
			]
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
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["D","S"],"ingredients":{"D":ingr_repr("dragon_pearl", ns),"S":ingr_repr("minecraft:stick")}},
			]
		},
		"wormhole_potion": {
			"id": CUSTOM_ITEM_VANILLA, CATEGORY: EQUIPMENT,
			"consumable": {"consume_seconds": 1024, "animation": "drink", "has_consume_particles": False},
			"max_stack_size": 16,
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shapeless","result_count":1,"category":"misc","ingredients":[
					ingr_repr("minecraft:cod"),ingr_repr("minecraft:salmon"),ingr_repr("minecraft:tropical_fish"),
					ingr_repr("minecraft:pufferfish"),ingr_repr("compacted_stardust_shard", ns),ingr_repr("minecraft:pufferfish"),
					ingr_repr("minecraft:tropical_fish"),ingr_repr("minecraft:salmon"),ingr_repr("minecraft:cod"),
				]},
			]
		},
		"stardust_apple": {
			"id": CUSTOM_ITEM_VANILLA, CATEGORY: EQUIPMENT,
			"food": {"can_always_eat": True, "nutrition": 4, "saturation": 9.6},	# Golden apple default
			"consumable": {
				"on_consume_effects": [{"type": "minecraft:apply_effects", "effects": [
					{"amplifier": 2, "duration": 100, "id": "minecraft:regeneration", "show_icon": True},	# Regeneration III for 5 seconds
					{"amplifier": 1, "duration": 2400, "id": "minecraft:absorption", "show_icon": True}		# Absorption II for 2 minutes
				]}]
			},
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shapeless","result_count":1,"category":"misc","ingredients":8*[ingr_repr("stardust_fragment", ns)] + [ingr_repr("minecraft:golden_apple")]},
			]
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
				"rarity": "rare" if i < 5 else "epic",
				"lore": [
					{"text":"Only mines cobblestone directly below","color":"white","italic":False},
					{"text":f"[x{9*(5**i):,} per minute]","color":"gray","italic":False},
				],
				WIKI_COMPONENT: [
					{"text":f"Cobblestone Miner Lv.{i+1}","color":"yellow"},
					{"text":"\nEvery minute, it will break the cobblestone directly below it","color":"gray"},
					{"text":f"\nProduction rate is {9*(4**i):,} cobblestone per minute","color":"gray"},
					{"text":"\nNo energy required","color":"gray"},
				],
			}
			for i in range(8)
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
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["EDE","DMD","EDE"],"ingredients":{"E":ingr_repr("minecraft:emerald"),"D":ingr_repr("minecraft:diamond"),"M":ingr_repr("empty_module", ns)}},
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["DED","EME","DED"],"ingredients":{"E":ingr_repr("minecraft:emerald"),"D":ingr_repr("minecraft:diamond"),"M":ingr_repr("empty_module", ns)}},
			]
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
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shapeless","result_count":1,"category":"misc","ingredients":8*[ingr_repr("minecraft:iron_ore")] + [ingr_repr("empty_module", ns)]},
				{"type":"crafting_shapeless","result_count":1,"category":"misc","ingredients":8*[ingr_repr("minecraft:deepslate_iron_ore")] + [ingr_repr("empty_module", ns)]},
			]
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
			{"type":"crafting_shapeless","result_count":1,"group":"manual","category":MISC,"ingredients":[ingr_repr("minecraft:book"), ingr_repr("stardust_fragment", ns)]},

			# Put the manual in the crafting grid to get the manual back (update the manual)
			{"type":"crafting_shapeless","result_count":1,"group":"manual","category":MISC,"ingredients":[ingr_repr("manual", ns)]},
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

