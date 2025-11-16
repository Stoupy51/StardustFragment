
# ruff: noqa: E501
# Imports
from stewbeet import (
	CATEGORY,
	CUSTOM_BLOCK_VANILLA,
	CUSTOM_ITEM_VANILLA,
	NO_SILK_TOUCH_DROP,
	PULVERIZING,
	RESULT_OF_CRAFTING,
	USED_FOR_CRAFTING,
	VANILLA_BLOCK,
	VANILLA_BLOCK_FOR_ORES,
	WIKI_COMPONENT,
	JsonDict,
	Mem,
	ingr_repr,
	rainbow_gradient_text,
)

# Constants
COBBLESTONE_TIERS: list[str] = [
	"compressed", "double_compressed", "triple_compressed", "quadruple_compressed",
	"quintuple_compressed", "sextuple_compressed", "septuple_compressed", "octuple_compressed",
]

def main_additions() -> None:
	MATERIALS: str = "materials"
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
				{"text":"\nMined from Stardust Ore found in the overworld","color":"gray"},
				{"text":"\nUsed to craft ingots, tools, armor, and machines","color":"gray"},
			],
			RESULT_OF_CRAFTING: [
				{"type":"smelting","result_count":2,"category":"misc","experience":0.8,"cookingtime":200,"ingredient":ingr_repr("stardust_ore", ns)},
				{"type":"blasting","result_count":2,"category":"misc","experience":0.8,"cookingtime":100,"ingredient":ingr_repr("stardust_ore", ns)},
				{"type":"smelting","result_count":4,"category":"misc","experience":0.8,"cookingtime":200,"ingredient":ingr_repr("deepslate_stardust_ore", ns)},
				{"type":"blasting","result_count":4,"category":"misc","experience":0.8,"cookingtime":100,"ingredient":ingr_repr("deepslate_stardust_ore", ns)},
				{"type":PULVERIZING,"result_count":8,"ingredient":ingr_repr("stardust_ingot", ns)},
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
				{"type":"crafting_shapeless","result_count":9,"category":"misc","ingredients":[ingr_repr("stardust_block", ns)]},
				{"type":PULVERIZING,"result_count":8,"ingredient":ingr_repr("stardust_essence", ns)},
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
				{"type":PULVERIZING,"result_count":8,"ingredient":ingr_repr("stardust_core", ns)},
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
				{"type":PULVERIZING,"result_count":8,"ingredient":ingr_repr("awakened_stardust_block", ns)},
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
				{"type":PULVERIZING,"result_count":1,"ingredient":ingr_repr("ender_dragon_pearl", ns)},
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
				{"type":PULVERIZING,"result_count":8,"ingredient":ingr_repr("legendarium_ingot", ns)},
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
				{"type":PULVERIZING,"result_count":8,"ingredient":ingr_repr("legendarium_block", ns)},
			]
		},
		"legendarium_block": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: MATERIALS,
			VANILLA_BLOCK: {"id":"minecraft:emerald_block", "apply_facing":False},
			WIKI_COMPONENT: [
				{"text":"Compressed legendarium storage block.","color":"yellow"},
				{"text":"\nCrafted from 8Legendarium Ingots","color":"gray"},
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
				{"type":PULVERIZING,"result_count":8,"ingredient":ingr_repr("solarium_ingot", ns)},
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
				{"type":PULVERIZING,"result_count":8,"ingredient":ingr_repr("solarium_block", ns)},
			]
		},
		"solarium_block": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: MATERIALS,
			VANILLA_BLOCK: {"id":"minecraft:waxed_copper_block", "apply_facing":False},
			WIKI_COMPONENT: [
				{"text":"Compressed solarium storage block.","color":"yellow"},
				{"text":"\nCrafted from 8Solarium Ingots","color":"gray"},
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
				{"type":PULVERIZING,"result_count":8,"ingredient":ingr_repr("darkium_ingot", ns)},
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
				{"type":PULVERIZING,"result_count":8,"ingredient":ingr_repr("darkium_block", ns)},
			]
		},
		"darkium_block": {
			"id": CUSTOM_BLOCK_VANILLA, CATEGORY: MATERIALS,
			VANILLA_BLOCK: {"id":"minecraft:netherite_block", "apply_facing":False},
			WIKI_COMPONENT: [
				{"text":"Compressed darkium storage block.","color":"yellow"},
				{"text":"\nCrafted from 8Darkium Ingots","color":"gray"},
			],
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shapeless","result_count":1,"category":"misc","ingredients":[ingr_repr("stardust_block", ns)] + 8*[ingr_repr("darkium_ingot", ns)]},
			]
		},
		"ultimate_shard": {
			"id": CUSTOM_ITEM_VANILLA, CATEGORY: MATERIALS,
			"item_name": rainbow_gradient_text("Ultimate Shard"),
			WIKI_COMPONENT: [
				{"text":"The ultimate refined material.","color":"yellow"},
				{"text":"\nMain component for ultimate crafting","color":"gray"},
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
				{"type":PULVERIZING,"result_count":{"type":"minecraft:uniform","min":4,"max":6},"result":ingr_repr("minecraft:bone_meal")},
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
					{"type":"crafting_shapeless","result_count": 9,"category":"misc","ingredients":[ingr_repr(f"{next_t}_cobblestone", ns)]},
					{"type":PULVERIZING,"result_count": 9,"ingredient":ingr_repr(f"{next_t}_cobblestone", ns)},
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
			"item_name": rainbow_gradient_text("Ultimate Frame"),
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
		"awakened_stardust_photovoltaic_cell": {
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
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["III","AAA","III"],"ingredients":{"I":ingr_repr("legendarium_ingot", ns),"A":ingr_repr("awakened_stardust_photovoltaic_cell", ns)}},
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["IAI","IAI","IAI"],"ingredients":{"I":ingr_repr("legendarium_ingot", ns),"A":ingr_repr("awakened_stardust_photovoltaic_cell", ns)}},
			]
		},
		"solarium_photovoltaic_cell": {
			"id": CUSTOM_ITEM_VANILLA, CATEGORY: MATERIALS,
			WIKI_COMPONENT: [
				{"text":"Solarium photovoltaic cell made from solar energy.","color":"yellow"},
				{"text":"\nUsed to convert sunlight into energy even more efficiently","color":"gray"},
			],
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["III","AAA","III"],"ingredients":{"I":ingr_repr("solarium_ingot", ns),"A":ingr_repr("awakened_stardust_photovoltaic_cell", ns)}},
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["IAI","IAI","IAI"],"ingredients":{"I":ingr_repr("solarium_ingot", ns),"A":ingr_repr("awakened_stardust_photovoltaic_cell", ns)}},
			]
		},
		"darkium_photovoltaic_cell": {
			"id": CUSTOM_ITEM_VANILLA, CATEGORY: MATERIALS,
			WIKI_COMPONENT: [
				{"text":"Darkium photovoltaic cell made from dark energy.","color":"yellow"},
				{"text":"\nUsed to convert sunlight into energy even more efficiently","color":"gray"},
			],
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["III","AAA","III"],"ingredients":{"I":ingr_repr("darkium_ingot", ns),"A":ingr_repr("awakened_stardust_photovoltaic_cell", ns)}},
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["IAI","IAI","IAI"],"ingredients":{"I":ingr_repr("darkium_ingot", ns),"A":ingr_repr("awakened_stardust_photovoltaic_cell", ns)}},
			]
		},
		"ultimate_photovoltaic_cell": {
			"id": CUSTOM_ITEM_VANILLA, CATEGORY: MATERIALS,
			"item_name": rainbow_gradient_text("Ultimate Photovoltaic Cell"),
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
	}

	# Update the definitions with new data
	for k, v in additions.items():
		if k in Mem.definitions:
			Mem.definitions[k].update(v)
		else:
			Mem.definitions[k] = v

