
# ruff: noqa: E501
# Imports
from stewbeet import (
	CATEGORY,
	CUSTOM_BLOCK_ALTERNATIVE,
	CUSTOM_BLOCK_VANILLA,
	CUSTOM_ITEM_VANILLA,
	GROWING_SEED,
	RESULT_OF_CRAFTING,
	VANILLA_BLOCK,
	WIKI_COMPONENT,
	JsonDict,
	Mem,
	ingr_repr,
)
from stouputils.print import info


def main_additions() -> None:
	MISC: str = "miscellaneous"
	ns: str = Mem.ctx.project_id

	# Prepare some recipes
	MINERS_CRAFTING_RECIPES: dict[str, list[JsonDict]] = {
		"cobblestone_miner_lv1": [
			{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["TTT","PMP","BBB"],"ingredients":{"T":ingr_repr("minecraft:coal"),"P":ingr_repr("minecraft:wooden_pickaxe"),"M":ingr_repr("minecraft:redstone_block"),"B":ingr_repr("compressed_cobblestone", ns)}},
			{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["TTT","PMP","BBB"],"ingredients":{"T":ingr_repr("minecraft:charcoal"),"P":ingr_repr("minecraft:wooden_pickaxe"),"M":ingr_repr("minecraft:redstone_block"),"B":ingr_repr("compressed_cobblestone", ns)}},
		],
		"cobblestone_miner_lv2": [
			{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["TTT","PMP","BBB"],"ingredients":{"T":ingr_repr("minecraft:flint"),"P":ingr_repr("minecraft:stone_pickaxe"),"M":ingr_repr("cobblestone_miner_lv1", ns),"B":ingr_repr("compressed_cobblestone", ns)}},
		],
		"cobblestone_miner_lv3": [
			{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["TTT","PMP","BBB"],"ingredients":{"T":ingr_repr("minecraft:copper_block"),"P":ingr_repr("minecraft:copper_pickaxe"),"M":ingr_repr("cobblestone_miner_lv2", ns),"B":ingr_repr("double_compressed_cobblestone", ns)}},
		],
		"cobblestone_miner_lv4": [
			{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["TTT","PMP","BBB"],"ingredients":{"T":ingr_repr("minecraft:iron_block"),"P":ingr_repr("minecraft:iron_pickaxe"),"M":ingr_repr("cobblestone_miner_lv3", ns),"B":ingr_repr("double_compressed_cobblestone", ns)}},
		],
		"cobblestone_miner_lv5": [
			{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["TTT","PMP","BBB"],"ingredients":{"T":ingr_repr("minecraft:gold_block"),"P":ingr_repr("minecraft:golden_pickaxe"),"M":ingr_repr("cobblestone_miner_lv4", ns),"B":ingr_repr("triple_compressed_cobblestone", ns)}},
		],
		"cobblestone_miner_lv6": [
			{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["TTT","PMP","BBB"],"ingredients":{"T":ingr_repr("minecraft:diamond_block"),"P":ingr_repr("minecraft:diamond_pickaxe"),"M":ingr_repr("cobblestone_miner_lv5", ns),"B":ingr_repr("triple_compressed_cobblestone", ns)}},
		],
		"cobblestone_miner_lv7": [
			{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["TTT","PMP","BBB"],"ingredients":{"T":ingr_repr("minecraft:netherite_block"),"P":ingr_repr("minecraft:netherite_pickaxe"),"M":ingr_repr("cobblestone_miner_lv6", ns),"B":ingr_repr("quadruple_compressed_cobblestone", ns)}},
		],
		"cobblestone_miner_lv8": [
			{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["TTT","PMP","BBB"],"ingredients":{"T":ingr_repr("stardust_core", ns),"P":ingr_repr("original_stardust_pickaxe", ns),"M":ingr_repr("cobblestone_miner_lv7", ns),"B":ingr_repr("quadruple_compressed_cobblestone", ns)}},
		],
	}


	# Give Additional data for every item
	additions: dict[str, JsonDict] = {

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
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shapeless","result_count":1,"category":"misc","ingredients":8*[ingr_repr("minecraft:wheat_seeds")] + [ingr_repr("minecraft:diamond")]},
				{"type":"crafting_shapeless","result_count":1,"category":"misc","ingredients":8*[ingr_repr("minecraft:pumpkin_seeds")] + [ingr_repr("minecraft:diamond")]},
				{"type":"crafting_shapeless","result_count":1,"category":"misc","ingredients":8*[ingr_repr("minecraft:melon_seeds")] + [ingr_repr("minecraft:diamond")]},
				{"type":"crafting_shapeless","result_count":1,"category":"misc","ingredients":8*[ingr_repr("minecraft:beetroot_seeds")] + [ingr_repr("minecraft:diamond")]},
			]
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
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shapeless","result_count":1,"category":"misc","ingredients":8*[ingr_repr("minecraft:diamond")] + [ingr_repr("diamond_seed", ns)]},
			]
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
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shapeless","result_count":1,"category":"misc","ingredients":8*[ingr_repr("minecraft:wheat_seeds")] + [ingr_repr("stardust_fragment", ns)]},
				{"type":"crafting_shapeless","result_count":1,"category":"misc","ingredients":8*[ingr_repr("minecraft:pumpkin_seeds")] + [ingr_repr("stardust_fragment", ns)]},
				{"type":"crafting_shapeless","result_count":1,"category":"misc","ingredients":8*[ingr_repr("minecraft:melon_seeds")] + [ingr_repr("stardust_fragment", ns)]},
				{"type":"crafting_shapeless","result_count":1,"category":"misc","ingredients":8*[ingr_repr("minecraft:beetroot_seeds")] + [ingr_repr("stardust_fragment", ns)]},
			]
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
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shapeless","result_count":1,"category":"misc","ingredients":8*[ingr_repr("stardust_fragment", ns)] + [ingr_repr("stardust_seed", ns)]},
			]
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
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shapeless","result_count":1,"category":"misc","ingredients":4*[ingr_repr("stardust_ingot", ns)] + [ingr_repr("advanced_stardust_seed", ns)]},
			]
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
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shapeless","result_count":1,"category":"misc","ingredients":4*[ingr_repr("minecraft:emerald")] + 4*[ingr_repr("minecraft:feather")] + [ingr_repr("elite_stardust_seed", ns)]},
			]
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
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shapeless","result_count":1,"category":"misc","ingredients":4*[ingr_repr("minecraft:magma_cream")] + 4*[ingr_repr("minecraft:blaze_powder")] + [ingr_repr("elite_stardust_seed", ns)]},
			]
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
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shapeless","result_count":1,"category":"misc","ingredients":4*[ingr_repr("minecraft:ink_sac")] + 4*[ingr_repr("minecraft:wither_rose")] + [ingr_repr("elite_stardust_seed", ns)]},
			]
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
				RESULT_OF_CRAFTING: MINERS_CRAFTING_RECIPES[f"cobblestone_miner_lv{i+1}"],
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
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shapeless","result_count":1,"category":"misc","ingredients":[
					ingr_repr("dog_excrement", ns),ingr_repr("dog_excrement", ns),ingr_repr("dog_excrement", ns),
					ingr_repr("stardust_fragment", ns),ingr_repr("minecraft:wolf_armor", ns),ingr_repr("stardust_fragment", ns),
					ingr_repr("dog_excrement", ns),ingr_repr("dog_excrement", ns),ingr_repr("dog_excrement", ns),
				]},
			]
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
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shapeless","result_count":1,"category":"misc","ingredients":4*[ingr_repr("minecraft:breeze_rod")] + 4*[ingr_repr("compacted_stardust_shard", ns)] + [ingr_repr("minecraft:nether_star", ns)]},
			]
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
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["DD","QQ","QQ"],"ingredients":{"D":ingr_repr("minecraft:diamond"),"Q":ingr_repr("minecraft:quartz")}},
			]
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

	# Manual item and recipes
	additions["manual"] = {
		"id": "minecraft:written_book", "category": MISC, "item_name": "Stardust Manual",
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

