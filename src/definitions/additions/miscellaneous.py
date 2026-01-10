
# Imports
from stewbeet import (
	CUSTOM_BLOCK_VANILLA,
	CUSTOM_ITEM_VANILLA,
	Block,
	BlockAlternative,
	CraftingShapedRecipe,
	CraftingShapelessRecipe,
	GrowingSeed,
	GrowingSeedLoot,
	Ingr,
	Item,
	RecipeBase,
	VanillaBlock,
	WikiButton,
	rainbow_gradient_text,
)
from stouputils import simple_cache

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
	MINERS_CRAFTING_RECIPES: dict[str, list[RecipeBase]] = {
		"cobblestone_miner_lv1": [
			CraftingShapedRecipe(
				result_count=1, category="misc", shape=["TTT","PMP","BBB"],
				ingredients={
					"T": Ingr("minecraft:coal"), "P": Ingr("minecraft:wooden_pickaxe"),
					"M": Ingr("minecraft:redstone_block"), "B": Ingr("compressed_cobblestone")
				}
			),
			CraftingShapedRecipe(
				result_count=1, category="misc", shape=["TTT","PMP","BBB"],
				ingredients={
					"T": Ingr("minecraft:charcoal"), "P": Ingr("minecraft:wooden_pickaxe"),
					"M": Ingr("minecraft:redstone_block"), "B": Ingr("compressed_cobblestone")
				}
			),
		],
		"cobblestone_miner_lv2": [
			CraftingShapedRecipe(
				result_count=1, category="misc", shape=["TTT","PMP","BBB"],
				ingredients={
					"T": Ingr("minecraft:flint"), "P": Ingr("minecraft:stone_pickaxe"),
					"M": Ingr("cobblestone_miner_lv1"), "B": Ingr("compressed_cobblestone")
				}
			),
		],
		"cobblestone_miner_lv3": [
			CraftingShapedRecipe(
				result_count=1, category="misc", shape=["TTT","PMP","BBB"],
				ingredients={
					"T": Ingr("minecraft:copper_block"), "P": Ingr("minecraft:copper_pickaxe"),
					"M": Ingr("cobblestone_miner_lv2"), "B": Ingr("double_compressed_cobblestone")
				}
			),
		],
		"cobblestone_miner_lv4": [
			CraftingShapedRecipe(
				result_count=1, category="misc", shape=["TTT","PMP","BBB"],
				ingredients={
					"T": Ingr("minecraft:iron_block"), "P": Ingr("minecraft:iron_pickaxe"),
					"M": Ingr("cobblestone_miner_lv3"), "B": Ingr("double_compressed_cobblestone")
				}
			),
		],
		"cobblestone_miner_lv5": [
			CraftingShapedRecipe(
				result_count=1, category="misc", shape=["TTT","PMP","BBB"],
				ingredients={
					"T": Ingr("minecraft:gold_block"), "P": Ingr("minecraft:golden_pickaxe"),
					"M": Ingr("cobblestone_miner_lv4"), "B": Ingr("triple_compressed_cobblestone")
				}
			),
		],
		"cobblestone_miner_lv6": [
			CraftingShapedRecipe(
				result_count=1, category="misc", shape=["TTT","PMP","BBB"],
				ingredients={
					"T": Ingr("minecraft:diamond_block"), "P": Ingr("minecraft:diamond_pickaxe"),
					"M": Ingr("cobblestone_miner_lv5"), "B": Ingr("triple_compressed_cobblestone")
				}
			),
		],
		"cobblestone_miner_lv7": [
			CraftingShapedRecipe(
				result_count=1, category="misc", shape=["TTT","PMP","BBB"],
				ingredients={
					"T": Ingr("minecraft:netherite_block"), "P": Ingr("minecraft:netherite_pickaxe"),
					"M": Ingr("cobblestone_miner_lv6"), "B": Ingr("quadruple_compressed_cobblestone")
				}
			),
		],
		"cobblestone_miner_lv8": [
			CraftingShapedRecipe(
				result_count=1, category="misc", shape=["TTT","PMP","BBB"],
				ingredients={
					"T": Ingr("stardust_core"), "P": Ingr("original_stardust_pickaxe"),
					"M": Ingr("cobblestone_miner_lv7"), "B": Ingr("quadruple_compressed_cobblestone")
				}
			),
		],
	}

	# Miscellaneous
	BlockAlternative(
		id="diamond_seed",
		manual_category=MISC,
		vanilla_block=VanillaBlock(id="minecraft:moss_carpet", apply_facing=False),
		growing_seed=GrowingSeed(texture_basename="diamond", seconds=1200, planted_on="stone", loots=[
			GrowingSeedLoot(id="minecraft:diamond", rolls={"type":"minecraft:uniform","min":0,"max":2}, fortune={"extra":0,"probability":0.1})
		]), # TODO: Add GROWING SEED to the manual (both this and the results)
		wiki_buttons=[
			{"text":"Magical seed that grows diamonds.","color":"yellow"},
			{"text":"\nCan only be planted on stone blocks","color":"gray"},
			{"text":"\nGrows fully after 20 minutes","color":"gray"},
			{"text":"\nYields 0-2 diamonds when harvested","color":"gray"},
			{"text":"\nFortune effect applies (+10% per level)","color":"gray"},
		],
		recipes=[
			CraftingShapelessRecipe(result_count=1, category="misc", ingredients=8*[Ingr("minecraft:wheat_seeds")] + [Ingr("minecraft:diamond")]),
			CraftingShapelessRecipe(result_count=1, category="misc", ingredients=8*[Ingr("minecraft:pumpkin_seeds")] + [Ingr("minecraft:diamond")]),
			CraftingShapelessRecipe(result_count=1, category="misc", ingredients=8*[Ingr("minecraft:melon_seeds")] + [Ingr("minecraft:diamond")]),
			CraftingShapelessRecipe(result_count=1, category="misc", ingredients=8*[Ingr("minecraft:beetroot_seeds")] + [Ingr("minecraft:diamond")]),
		],
		components={
			"lore": [
				{"text":"Can only be planted on stone.","italic":False,"color":"gray"},
			]
		},
	)
	BlockAlternative(
		id="advanced_diamond_seed",
		manual_category=MISC,
		vanilla_block=VanillaBlock(id="minecraft:moss_carpet", apply_facing=False),
		growing_seed=GrowingSeed(texture_basename="advanced_diamond", seconds=1200, planted_on="stone", loots=[
			GrowingSeedLoot(id="minecraft:diamond", rolls={"type":"minecraft:uniform","min":0,"max":24}, fortune={"extra":0,"probability":0.1})
		]),
		wiki_buttons=[
			{"text":"Magical seed that grows diamonds.","color":"yellow"},
			{"text":"\nCan only be planted on stone blocks","color":"gray"},
			{"text":"\nGrows fully after 20 minutes","color":"gray"},
			{"text":"\nYields 0-24 diamonds when harvested","color":"gray"},
			{"text":"\nFortune effect applies (+10% per level)","color":"gray"},
		],
		recipes=[
			CraftingShapelessRecipe(result_count=1, category="misc", ingredients=8*[Ingr("minecraft:diamond")] + [Ingr("diamond_seed")]),
		],
		components={
			"lore": [
				{"text":"Can only be planted on stone.","italic":False,"color":"gray"},
			]
		},
	)
	BlockAlternative(
		id="stardust_seed",
		manual_category=MISC,
		vanilla_block=VanillaBlock(id="minecraft:moss_carpet", apply_facing=False),
		growing_seed=GrowingSeed(texture_basename="stardust", seconds=480, planted_on="diamond_block", loots=[
			GrowingSeedLoot(id="stardust_fragment", rolls={"type":"minecraft:uniform","min":3,"max":9}, fortune={"extra":0,"probability":0.5})
		]),
		wiki_buttons=[
			{"text":"Magical seed that grows stardust fragments.","color":"yellow"},
			{"text":"\nCan only be planted on diamond blocks","color":"gray"},
			{"text":"\nGrows fully after 8 minutes","color":"gray"},
			{"text":"\nYields 3-9 stardust fragments when harvested","color":"gray"},
			{"text":"\nFortune effect applies (+50% per level)","color":"gray"},
		],
		recipes=[
			CraftingShapelessRecipe(result_count=1, category="misc", ingredients=8*[Ingr("minecraft:wheat_seeds")] + [Ingr("stardust_fragment")]),
			CraftingShapelessRecipe(result_count=1, category="misc", ingredients=8*[Ingr("minecraft:pumpkin_seeds")] + [Ingr("stardust_fragment")]),
			CraftingShapelessRecipe(result_count=1, category="misc", ingredients=8*[Ingr("minecraft:melon_seeds")] + [Ingr("stardust_fragment")]),
			CraftingShapelessRecipe(result_count=1, category="misc", ingredients=8*[Ingr("minecraft:beetroot_seeds")] + [Ingr("stardust_fragment")]),
		],
		components={
			"lore": [
				{"text":"Can only be planted on diamond block.","italic":False,"color":"gray"},
			]
		},
	)
	BlockAlternative(
		id="advanced_stardust_seed",
		manual_category=MISC,
		vanilla_block=VanillaBlock(id="minecraft:moss_carpet", apply_facing=False),
		growing_seed=GrowingSeed(texture_basename="advanced_stardust", seconds=960, planted_on="diamond_block", loots=[
			GrowingSeedLoot(id="stardust_ingot", rolls={"type":"minecraft:uniform","min":1,"max":4}, fortune={"extra":0,"probability":0.3})
		]),
		wiki_buttons=[
			{"text":"Magical seed that grows stardust ingots.","color":"yellow"},
			{"text":"\nCan only be planted on diamond blocks","color":"gray"},
			{"text":"\nGrows fully after 16 minutes","color":"gray"},
			{"text":"\nYields 1-4 stardust ingots when harvested","color":"gray"},
			{"text":"\nFortune effect applies (+30% per level)","color":"gray"},
		],
		recipes=[
			CraftingShapelessRecipe(result_count=1, category="misc", ingredients=8*[Ingr("stardust_fragment")] + [Ingr("stardust_seed")]),
		],
		components={
			"lore": [
				{"text":"Can only be planted on diamond block.","italic":False,"color":"gray"},
			]
		},
	)
	BlockAlternative(
		id="elite_stardust_seed",
		manual_category=MISC,
		vanilla_block=VanillaBlock(id="minecraft:moss_carpet", apply_facing=False),
		growing_seed=GrowingSeed(texture_basename="elite_stardust", seconds=1920, planted_on="diamond_block", loots=[
			GrowingSeedLoot(id="stardust_essence", rolls={"type":"minecraft:uniform","min":1,"max":2}, fortune={"extra":0,"probability":0.2})
		]),
		wiki_buttons=[
			{"text":"Magical seed that grows stardust essences.","color":"yellow"},
			{"text":"\nCan only be planted on diamond blocks","color":"gray"},
			{"text":"\nGrows fully after 32 minutes","color":"gray"},
			{"text":"\nYields 1-2 stardust essences when harvested","color":"gray"},
			{"text":"\nFortune effect applies (+20% per level)","color":"gray"},
		],
		recipes=[
			CraftingShapelessRecipe(result_count=1, category="misc", ingredients=4*[Ingr("stardust_ingot")] + [Ingr("advanced_stardust_seed")]),
		],
		components={
			"lore": [
				{"text":"Can only be planted on diamond block.","italic":False,"color":"gray"},
			]
		},
	)
	BlockAlternative(
		id="legendarium_seed",
		manual_category=MISC,
		vanilla_block=VanillaBlock(id="minecraft:moss_carpet", apply_facing=False),
		growing_seed=GrowingSeed(texture_basename="legendarium", seconds=3840, planted_on="emerald_block", loots=[
			GrowingSeedLoot(id="legendarium_fragment", rolls={"type":"minecraft:uniform","min":1,"max":2}, fortune={"extra":0,"probability":0.1})
		]),
		wiki_buttons=[
			{"text":"Magical seed that grows legendarium.","color":"yellow"},
			{"text":"\nCan only be planted on emerald blocks","color":"gray"},
			{"text":"\nGrows fully after 64 minutes","color":"gray"},
			{"text":"\nYields 1-2 legendarium fragments when harvested","color":"gray"},
			{"text":"\nFortune effect applies (+10% per level)","color":"gray"},
		],
		recipes=[
			CraftingShapelessRecipe(result_count=1, category="misc", ingredients=4*[Ingr("minecraft:emerald")] + 4*[Ingr("minecraft:feather")] + [Ingr("elite_stardust_seed")]),
		],
		components={
			"lore": [
				{"text":"Can only be planted on emerald block.","italic":False,"color":"gray"},
			]
		},
	)
	BlockAlternative(
		id="solarium_seed",
		manual_category=MISC,
		vanilla_block=VanillaBlock(id="minecraft:moss_carpet", apply_facing=False),
		growing_seed=GrowingSeed(texture_basename="solarium", seconds=3840, planted_on="magma_block", loots=[
			GrowingSeedLoot(id="solarium_fragment", rolls={"type":"minecraft:uniform","min":1,"max":2}, fortune={"extra":0,"probability":0.1})
		]),
		wiki_buttons=[
			{"text":"Magical seed that grows solarium.","color":"yellow"},
			{"text":"\nCan only be planted on magma blocks","color":"gray"},
			{"text":"\nGrows fully after 64 minutes","color":"gray"},
			{"text":"\nYields 1-2 solarium fragments when harvested","color":"gray"},
			{"text":"\nFortune effect applies (+10% per level)","color":"gray"},
		],
		recipes=[
			CraftingShapelessRecipe(result_count=1, category="misc", ingredients=4*[Ingr("minecraft:magma_cream")] + 4*[Ingr("minecraft:blaze_powder")] + [Ingr("elite_stardust_seed")]),
		],
		components={
			"lore": [
				{"text":"Can only be planted on magma block.","italic":False,"color":"gray"},
			]
		},
	)
	BlockAlternative(
		id="darkium_seed",
		manual_category=MISC,
		vanilla_block=VanillaBlock(id="minecraft:moss_carpet", apply_facing=False),
		growing_seed=GrowingSeed(texture_basename="darkium", seconds=3840, planted_on="obsidian", loots=[
			GrowingSeedLoot(id="darkium_fragment", rolls={"type":"minecraft:uniform","min":1,"max":2}, fortune={"extra":0,"probability":0.1})
		]),
		wiki_buttons=[
			{"text":"Magical seed that grows darkium.","color":"yellow"},
			{"text":"\nCan only be planted on obsidian","color":"gray"},
			{"text":"\nGrows fully after 64 minutes","color":"gray"},
			{"text":"\nYields 1-2 darkium fragments when harvested","color":"gray"},
			{"text":"\nFortune effect applies (+10% per level)","color":"gray"},
		],
		recipes=[
			CraftingShapelessRecipe(result_count=1, category="misc", ingredients=4*[Ingr("minecraft:ink_sac")] + 4*[Ingr("minecraft:wither_rose")] + [Ingr("elite_stardust_seed")]),
		],
		components={
			"lore": [
				{"text":"Can only be planted on obsidian.","italic":False,"color":"gray"},
			]
		},
	)

	# Create miners as Block instances
	for i in range(8):
		per_minute = miners_formula(i)
		miner_id, miner_name, _ = miner_display(i)
		Block(
			id=miner_id,
			base_item=CUSTOM_BLOCK_VANILLA,
			manual_category=MISC,
			vanilla_block=VanillaBlock(id="minecraft:cobbled_deepslate", apply_facing=False),
			recipes=MINERS_CRAFTING_RECIPES[miner_id],
			components={
				"item_name": {"text": miner_name},
				"rarity": "rare" if i < 5 else "epic",
				"lore": [
					{"text":"Only mines cobblestone directly below","color":"white","italic":False},
					{"text":f"[x{per_minute:,} per minute]","color":"gray","italic":False},
				],
			},
			wiki_buttons=[
				WikiButton({"text": miner_name,"color":"yellow"}),
				WikiButton({"text":"\nEvery minute, it will break the cobblestone directly below it","color":"gray"}),
				WikiButton({"text":f"\nProduction rate is {per_minute:,} cobblestone per minute","color":"gray"}),
				WikiButton({"text":"\nNo energy required","color":"gray"}),
			],
		)

	# StoupEgg
	Item(
		id="stoupegg",
		base_item=CUSTOM_ITEM_VANILLA,
		manual_category=MISC,
		recipes=[
			CraftingShapelessRecipe(
				result_count=1,
				category="misc",
				ingredients=[
					Ingr("dog_excrement"),Ingr("dog_excrement"),Ingr("dog_excrement"),
					Ingr("stardust_fragment"),Ingr("minecraft:wolf_armor"),Ingr("stardust_fragment"),
					Ingr("dog_excrement"),Ingr("dog_excrement"),Ingr("dog_excrement"),
				]
			)
		],
		components={
			"consumable": {"animation": "bow", "has_consume_particles": False, "sound": {"sound_id": "stardust:stoupegg_consuming"}},
			"item_name": {"text":"StoupEgg"},
			"rarity": "epic",
			"lore": [
				{"text":"Summoner of the StoupArmy mini-boss","italic":False,"color":"white"},
			],
		},
		wiki_buttons=[
			WikiButton({"text":"Mystical egg that summons the StoupArmy mini-boss.","color":"yellow"}),
			WikiButton({"text":"\nConsume to summon Stoupy and 4 enhanced wolves","color":"gray"}),
			WikiButton({"text":"\nSpawns at world surface","color":"gray"}),
			WikiButton({"text":"\n\nStoupy Stats (based on vanilla Wolf):","color":"aqua"}),
			WikiButton({"text":"\n➤ Health: ","color":"gray"}), WikiButton({"text":"250 points","color":"red"}),
			WikiButton({"text":"\n➤ Damage: ","color":"gray"}), WikiButton({"text":"x2","color":"red"}),
			WikiButton({"text":"\n➤ Scale: ","color":"gray"}), WikiButton({"text":"x0.9","color":"green"}),
			WikiButton({"text":"\n➤ Knockback Resistance: ","color":"gray"}), WikiButton({"text":"10","color":"aqua"}),
			WikiButton({"text":"\n➤ Step Height: ","color":"gray"}), WikiButton({"text":"16 blocks","color":"green"}),
			WikiButton({"text":"\n➤ Jump Boost V","color":"light_purple"}),
			WikiButton({"text":"\n\nDrops valuable early-game resources","color":"yellow"}),
			WikiButton({"text":"\nGlows when no players are within 15 blocks","color":"gray"}),
		],
	)

	# Starlight Infuser
	Item(
		id="starlight_infuser",
		base_item=CUSTOM_ITEM_VANILLA,
		manual_category=MISC,
		recipes=[
			CraftingShapelessRecipe(
				result_count=1,
				category="misc",
				ingredients=4*[Ingr("minecraft:breeze_rod")] + 4*[Ingr("compacted_stardust_shard")] + [Ingr("minecraft:nether_star")]
			)
		],
		components={
			"consumable": {"animation": "bow", "has_consume_particles": False, "sound": {"sound_id": "stardust:starlight_infuser_consuming"}},
			"rarity": "epic",
			"lore": [
				{"text":"Summoner of the Stardust Pillar boss","italic":False,"color":"white"},
			],
		},
		wiki_buttons=[
			WikiButton({"text":"Mystical summoner of the Stardust Pillar boss.","color":"yellow"}),
			WikiButton({"text":"\nConsume to summon the Stardust Pillar","color":"gray"}),
			WikiButton({"text":"\nSpawns at world surface above your position","color":"gray"}),
			WikiButton({"text":"\n\nCheck the Mobs category for full boss stats and behavior","color":"aqua"}),
			WikiButton({"text":"\n\nDrops Stardust Dungeon Key + mid-game resources","color":"yellow"}),
		],
	)

	# Stardust Dungeon Key
	Item(
		id="stardust_dungeon_key",
		base_item=CUSTOM_ITEM_VANILLA,
		manual_category=MISC,
		components={
			"rarity": "epic",
			"lore": [
				{"text":"One-time use key for the Stardust Dungeon","italic":False,"color":"gray"},
			],
		},
		wiki_buttons=[
			WikiButton({"text":"Key that allows access to the Stardust Dungeon.","color":"yellow"}),
			WikiButton({"text":"\nObtained by defeating the Stardust Pillar boss","color":"gray"}),
			WikiButton({"text":"\nOnce used, the key will be consumed","color":"gray"}),
			WikiButton({"text":"\nInside the dungeon, face challenging enemies and traps","color":"gray"}),
			WikiButton({"text":"\nto earn valuable rewards","color":"gray"}),
		],
	)

	# Ultimate Dragon Essence
	Item(
		id="ultimate_dragon_essence",
		base_item="minecraft:lingering_potion",
		manual_category=MISC,
		recipes=[
			CraftingShapelessRecipe(
				result_count=1,
				category="misc",
				ingredients=4*[Ingr("minecraft:dragon_egg")] + 4*[Ingr("ultimate_shard")] + [Ingr("minecraft:lingering_potion")]
			)
		],
		components={
			"custom_name": rainbow_gradient_text("Ultimate Dragon Essence"),  # Lingering Potion bypass item_name
			"potion_contents": {
				"custom_effects":[{"id":"minecraft:unluck","amplifier":4,"duration":100,"show_particles":True,"show_icon":False}]
			},
			"lore": [
				{"text":"One-time use summoner of the Ultimate Dragon.","italic":False,"color":"gray"},
				{"text":"Needs to be thrown in the Ultimate dimension.","italic":False,"color":"gray"},
			],
		},
		wiki_buttons=[
			WikiButton({"text":"Powerful essence that summons the Ultimate Dragon.","color":"yellow"}),
			WikiButton({"text":"\nThrow in the Ultimate Dimension to summon","color":"gray"}),
			WikiButton({"text":"\nWARNING: Only works in Ultimate Dimension!","color":"red"}),
			WikiButton({"text":"\n\nMain Boss Stats (based on Ender Dragon):","color":"aqua"}),
			WikiButton({"text":"\n➤ Health: ","color":"gray"}), WikiButton({"text":"1024 points","color":"red"}),
			WikiButton({"text":"\n➤ Damage: ","color":"gray"}), WikiButton({"text":"x4","color":"red"}),
			WikiButton({"text":"\n➤ Resistance IV (80% damage reduction)","color":"light_purple"}),
			WikiButton({"text":"\n➤ Always glowing","color":"aqua"}),
			WikiButton({"text":"\n\n3 Slave Dragons (512 HP each, x4 damage)","color":"aqua"}),
			WikiButton({"text":"\nEnd Crystals heal the main dragon","color":"gray"}),
			WikiButton({"text":"\nDragons use various attacks (20% chance/sec)","color":"gray"}),
			WikiButton({"text":"\nDragons limited to Y=150 max height","color":"gray"}),
			WikiButton({"text":"\n\nThis is the final challenge!","color":"yellow"}),
			WikiButton({"text":"\nDrops Ultimate Dragon Egg trophy on defeat","color":"gold"}),
		],
	)

	# Ultimate Dragon Egg
	Item(
		id="ultimate_dragon_egg",
		base_item=CUSTOM_ITEM_VANILLA,
		override_model={"parent": "minecraft:block/dragon_egg","display":{"head":{"translation": [0, 13, 0]}}},
		components={
			"item_name": rainbow_gradient_text("Ultimate Dragon Egg"),
		},
		wiki_buttons=[
			WikiButton({"text":"Trophy item dropped by the Ultimate Dragon.","color":"yellow"}),
			WikiButton({"text":"\nA symbol of your triumph over the ultimate challenge.","color":"gray"}),
			WikiButton({"text":"\nNot placeable but equippable","color":"gray"}),
		],
	)

	# Manual
	Item(
		id="manual",
		base_item="minecraft:written_book",
		manual_category=MISC,
		recipes=[
			# Put a book and a steel ingot in the crafting grid to get the manual
			CraftingShapelessRecipe(
				result_count=1,
				group="manual",
				category=MISC,
				ingredients=[Ingr("minecraft:book"), Ingr("stardust_fragment")]
			),
			# Put the manual in the crafting grid to get the manual back (update the manual)
			CraftingShapelessRecipe(
				result_count=1,
				group="manual",
				category=MISC,
				ingredients=[Ingr("manual")]
			),
		],
		components={
			"item_name": "Stardust Manual",
		},
		wiki_buttons=[
			WikiButton({"text":"Complete guide to Stardust Fragment technology.","color":"yellow"}),
			WikiButton({"text":"\nContains all recipes and information","color":"gray"}),
			WikiButton({"text":"\nYour comprehensive reference manual","color":"gray"}),
		],
	)

