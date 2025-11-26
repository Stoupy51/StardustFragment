
# ruff: noqa: E501
# Imports
from typing import cast

from stewbeet import (
	CATEGORY,
	CUSTOM_BLOCK_ALTERNATIVE,
	CUSTOM_BLOCK_VANILLA,
	CUSTOM_ITEM_VANILLA,
	GROWING_SEED,
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

from ...utils.common import ROMAN_NUMERALS


# Utility functions
@simple_cache
def miner_display(i: int) -> tuple[str, str, str]:
	""" Generate the ID, name, and roman numeral for a cobblestone miner.

	Args:
		i (int): The level of the miner (Starting from 0).
	"""
	return f"cobblestone_miner_lv{i+1}", f"Cobblestone Miner Lv.{i+1}", ROMAN_NUMERALS[i]

def miners_formula(i: int) -> int:
	return 9*(4**i)

# Main function
def main_additions() -> None:
	MISC: str = "miscellaneous"

	# Prepare some recipes
	MINERS_CRAFTING_RECIPES = cast(dict[str, list[JsonDict]], {
		"cobblestone_miner_lv1": [
			{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["TTT","PMP","BBB"],"ingredients":{"T":ingr_repr("minecraft:coal"),"P":ingr_repr("minecraft:wooden_pickaxe"),"M":ingr_repr("minecraft:redstone_block"),"B":ingr_repr("compressed_cobblestone")}},
			{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["TTT","PMP","BBB"],"ingredients":{"T":ingr_repr("minecraft:charcoal"),"P":ingr_repr("minecraft:wooden_pickaxe"),"M":ingr_repr("minecraft:redstone_block"),"B":ingr_repr("compressed_cobblestone")}},
		],
		"cobblestone_miner_lv2": [
			{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["TTT","PMP","BBB"],"ingredients":{"T":ingr_repr("minecraft:flint"),"P":ingr_repr("minecraft:stone_pickaxe"),"M":ingr_repr("cobblestone_miner_lv1"),"B":ingr_repr("compressed_cobblestone")}},
		],
		"cobblestone_miner_lv3": [
			{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["TTT","PMP","BBB"],"ingredients":{"T":ingr_repr("minecraft:copper_block"),"P":ingr_repr("minecraft:copper_pickaxe"),"M":ingr_repr("cobblestone_miner_lv2"),"B":ingr_repr("double_compressed_cobblestone")}},
		],
		"cobblestone_miner_lv4": [
			{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["TTT","PMP","BBB"],"ingredients":{"T":ingr_repr("minecraft:iron_block"),"P":ingr_repr("minecraft:iron_pickaxe"),"M":ingr_repr("cobblestone_miner_lv3"),"B":ingr_repr("double_compressed_cobblestone")}},
		],
		"cobblestone_miner_lv5": [
			{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["TTT","PMP","BBB"],"ingredients":{"T":ingr_repr("minecraft:gold_block"),"P":ingr_repr("minecraft:golden_pickaxe"),"M":ingr_repr("cobblestone_miner_lv4"),"B":ingr_repr("triple_compressed_cobblestone")}},
		],
		"cobblestone_miner_lv6": [
			{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["TTT","PMP","BBB"],"ingredients":{"T":ingr_repr("minecraft:diamond_block"),"P":ingr_repr("minecraft:diamond_pickaxe"),"M":ingr_repr("cobblestone_miner_lv5"),"B":ingr_repr("triple_compressed_cobblestone")}},
		],
		"cobblestone_miner_lv7": [
			{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["TTT","PMP","BBB"],"ingredients":{"T":ingr_repr("minecraft:netherite_block"),"P":ingr_repr("minecraft:netherite_pickaxe"),"M":ingr_repr("cobblestone_miner_lv6"),"B":ingr_repr("quadruple_compressed_cobblestone")}},
		],
		"cobblestone_miner_lv8": [
			{"type":"crafting_shaped","result_count":1,"category":"misc","shape":["TTT","PMP","BBB"],"ingredients":{"T":ingr_repr("stardust_core"),"P":ingr_repr("original_stardust_pickaxe"),"M":ingr_repr("cobblestone_miner_lv7"),"B":ingr_repr("quadruple_compressed_cobblestone")}},
		],
	})


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
				{"type":"crafting_shapeless","result_count":1,"category":"misc","ingredients":8*[ingr_repr("minecraft:diamond")] + [ingr_repr("diamond_seed")]},
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
				{"type":"crafting_shapeless","result_count":1,"category":"misc","ingredients":8*[ingr_repr("minecraft:wheat_seeds")] + [ingr_repr("stardust_fragment")]},
				{"type":"crafting_shapeless","result_count":1,"category":"misc","ingredients":8*[ingr_repr("minecraft:pumpkin_seeds")] + [ingr_repr("stardust_fragment")]},
				{"type":"crafting_shapeless","result_count":1,"category":"misc","ingredients":8*[ingr_repr("minecraft:melon_seeds")] + [ingr_repr("stardust_fragment")]},
				{"type":"crafting_shapeless","result_count":1,"category":"misc","ingredients":8*[ingr_repr("minecraft:beetroot_seeds")] + [ingr_repr("stardust_fragment")]},
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
				{"type":"crafting_shapeless","result_count":1,"category":"misc","ingredients":8*[ingr_repr("stardust_fragment")] + [ingr_repr("stardust_seed")]},
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
				{"type":"crafting_shapeless","result_count":1,"category":"misc","ingredients":4*[ingr_repr("stardust_ingot")] + [ingr_repr("advanced_stardust_seed")]},
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
				{"type":"crafting_shapeless","result_count":1,"category":"misc","ingredients":4*[ingr_repr("minecraft:emerald")] + 4*[ingr_repr("minecraft:feather")] + [ingr_repr("elite_stardust_seed")]},
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
				{"type":"crafting_shapeless","result_count":1,"category":"misc","ingredients":4*[ingr_repr("minecraft:magma_cream")] + 4*[ingr_repr("minecraft:blaze_powder")] + [ingr_repr("elite_stardust_seed")]},
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
				{"type":"crafting_shapeless","result_count":1,"category":"misc","ingredients":4*[ingr_repr("minecraft:ink_sac")] + 4*[ingr_repr("minecraft:wither_rose")] + [ingr_repr("elite_stardust_seed")]},
			]
		},
		**{
			miner_display(i)[0]: {
				"id": CUSTOM_BLOCK_VANILLA, CATEGORY: MISC,
				VANILLA_BLOCK: {"id":"minecraft:deepslate", "apply_facing":False},
				"item_name": {"text": miner_display(i)[1]},
				"rarity": "rare" if i < 5 else "epic",
				"lore": [
					{"text":"Only mines cobblestone directly below","color":"white","italic":False},
					{"text":f"[x{per_minute:,} per minute]","color":"gray","italic":False},
				],
				WIKI_COMPONENT: [
					{"text": miner_display(i)[1],"color":"yellow"},
					{"text":"\nEvery minute, it will break the cobblestone directly below it","color":"gray"},
					{"text":f"\nProduction rate is {per_minute:,} cobblestone per minute","color":"gray"},
					{"text":"\nNo energy required","color":"gray"},
				],
				RESULT_OF_CRAFTING: MINERS_CRAFTING_RECIPES[miner_display(i)[0]],
			}
			for i in range(8) for per_minute in [miners_formula(i)]
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
				{"text":"\nConsume to summon Stoupy and 4 enhanced wolves","color":"gray"},
				{"text":"\nSpawns at world surface","color":"gray"},
				{"text":"\n\nStoupy Stats (based on vanilla Wolf):","color":"aqua"},
				{"text":"\n➤ Health: ","color":"gray"}, {"text":"250 points","color":"red"},
				{"text":"\n➤ Damage: ","color":"gray"}, {"text":"x2","color":"red"},
				{"text":"\n➤ Scale: ","color":"gray"}, {"text":"x0.9","color":"green"},
				{"text":"\n➤ Knockback Resistance: ","color":"gray"}, {"text":"10","color":"aqua"},
				{"text":"\n➤ Step Height: ","color":"gray"}, {"text":"16 blocks","color":"green"},
				{"text":"\n➤ Jump Boost V","color":"light_purple"},
				{"text":"\n\nDrops valuable early-game resources","color":"yellow"},
				{"text":"\nGlows when no players are within 15 blocks","color":"gray"},
			],
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shapeless","result_count":1,"category":"misc","ingredients":[
					ingr_repr("dog_excrement"),ingr_repr("dog_excrement"),ingr_repr("dog_excrement"),
					ingr_repr("stardust_fragment"),ingr_repr("minecraft:wolf_armor"),ingr_repr("stardust_fragment"),
					ingr_repr("dog_excrement"),ingr_repr("dog_excrement"),ingr_repr("dog_excrement"),
				]},
			]
		},
		"starlight_infuser": {
			"id": CUSTOM_ITEM_VANILLA, CATEGORY: MISC,
			"consumable": {"animation": "bow", "has_consume_particles": False, "sound": {"sound_id": "stardust:starlight_infuser_consuming"}},	# TODO: Sound
			"rarity": "epic",
			"lore": [
				{"text":"Summoner of the Stardust Pillar boss","italic":False,"color":"white"},
			],
			WIKI_COMPONENT: [
				{"text":"Mystical summoner of the Stardust Pillar boss.","color":"yellow"},
				{"text":"\nConsume to summon the Stardust Pillar","color":"gray"},
				{"text":"\nSpawns at world surface above your position","color":"gray"},
				{"text":"\n\nCheck the Mobs category for full boss stats and behavior","color":"aqua"},
				{"text":"\n\nDrops Stardust Dungeon Key + mid-game resources","color":"yellow"},
			],
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shapeless","result_count":1,"category":"misc","ingredients":4*[ingr_repr("minecraft:breeze_rod")] + 4*[ingr_repr("compacted_stardust_shard")] + [ingr_repr("minecraft:nether_star")]},
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
		"ultimate_dragon_essence": {
			"id": "minecraft:lingering_potion", CATEGORY: MISC,
			"custom_name": rainbow_gradient_text("Ultimate Dragon Essence"),	# Lingering Potion bypass item_name
			"potion_contents": {
				"custom_effects":[{"id":"minecraft:unluck","amplifier":4,"duration":100,"show_particles":True,"show_icon":False}]
			},
			#"tooltip_display": {"hidden_components":["potion_contents"]},
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shapeless","result_count":1,"category":"misc","ingredients":4*[ingr_repr("minecraft:dragon_egg")] + 4*[ingr_repr("ultimate_shard")] + [ingr_repr("minecraft:lingering_potion")]},
			],
			"lore": [
				{"text":"One-time use summoner of the Ultimate Dragon.","italic":False,"color":"gray"},
				{"text":"Needs to be thrown in the Ultimate dimension.","italic":False,"color":"gray"},
			],
			WIKI_COMPONENT: [
				{"text":"Powerful essence that summons the Ultimate Dragon.","color":"yellow"},
				{"text":"\nThrow in the Ultimate Dimension to summon","color":"gray"},
				{"text":"\nWARNING: Only works in Ultimate Dimension!","color":"red"},
				{"text":"\n\nMain Boss Stats (based on Ender Dragon):","color":"aqua"},
				{"text":"\n➤ Health: ","color":"gray"}, {"text":"1024 points","color":"red"},
				{"text":"\n➤ Damage: ","color":"gray"}, {"text":"x4","color":"red"},
				{"text":"\n➤ Resistance IV (80% damage reduction)","color":"light_purple"},
				{"text":"\n➤ Always glowing","color":"aqua"},
				{"text":"\n\n3 Slave Dragons (512 HP each, x4 damage)","color":"aqua"},
				{"text":"\nEnd Crystals heal the main dragon","color":"gray"},
				{"text":"\nDragons use various attacks (20% chance/sec)","color":"gray"},
				{"text":"\nDragons limited to Y=150 max height","color":"gray"},
				{"text":"\n\nThis is the final challenge!","color":"yellow"},
				{"text":"\nDrops Ultimate Dragon Egg trophy on defeat","color":"gold"},
			],
		},
		"ultimate_dragon_egg": {
			"id": CUSTOM_ITEM_VANILLA,
			"item_name": rainbow_gradient_text("Ultimate Dragon Egg"),
			OVERRIDE_MODEL: {"parent": "minecraft:block/dragon_egg","display":{"head":{"translation": [0, 13, 0]}}},
			WIKI_COMPONENT: [
				{"text":"Trophy item dropped by the Ultimate Dragon.","color":"yellow"},
				{"text":"\nA symbol of your triumph over the ultimate challenge.","color":"gray"},
				{"text":"\nNot placeable but equippable","color":"gray"},
			],
		},
	}

	# Manual item and recipes
	additions["manual"] = {
		"id": "minecraft:written_book", "category": MISC, "item_name": "Stardust Manual",
		RESULT_OF_CRAFTING: [
			# Put a book and a steel ingot in the crafting grid to get the manual
			{"type":"crafting_shapeless","result_count":1,"group":"manual","category":MISC,"ingredients":[ingr_repr("minecraft:book"), ingr_repr("stardust_fragment")]},

			# Put the manual in the crafting grid to get the manual back (update the manual)
			{"type":"crafting_shapeless","result_count":1,"group":"manual","category":MISC,"ingredients":[ingr_repr("manual")]},
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

