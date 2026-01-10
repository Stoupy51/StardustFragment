
# ruff: noqa: E501
# Imports
from stewbeet import (
	SLOTS,
	AwakenedForgeRecipe,
	Block,
	CraftingShapedRecipe,
	CraftingShapelessRecipe,
	Ingr,
	Item,
	JsonDict,
	Mem,
	NoSilkTouchDrop,
	TextComponent,
	VanillaBlock,
	rainbow_gradient_text,
	write_function,
	write_versioned_function,
)
from stouputils import simple_cache

from ...utils.common import ROMAN_NUMERALS
from .common import ORES_CONFIGS, EquipmentsConfig, VanillaEquipments

# Constants
SNIPER_BULLETS: dict[str, int] = {
	"minecraft:copper_nugget": 1,
	"minecraft:iron_nugget": 4,
	"minecraft:gold_nugget": 7,
	"stardust_essence": 10,
	"legendarium_fragment": 16,
	"solarium_fragment": 16,
	"darkium_fragment": 16,
}
SNIPER_BULLETS_WIKI: list[TextComponent] = [
	{"text":"\nPossible bullet types:","color":"gray"},
	*[
		{"text":f"\n- {name.replace('minecraft:', '').replace('_', ' ').title()}: +{damage} damage","color":"gray"}
		for name, damage in SNIPER_BULLETS.items()
	]
]
ARTIFACTS: list[tuple[str, str, str, tuple[int, ...]]] = [
	("health", "Health Points", "max_health", (10, 20, 30, 50)),
	("damage", "Damage", "attack_damage", (10, 20, 30, 50)),
	("speed", "Base Speed", "movement_speed", (10, 15, 20, 25))
]


# Utility Functions
@simple_cache
def artifact_display(artifact: str, i: int, maximum: int = 4) -> tuple[str, str, str]:
	""" Generate the ID, name, and roman numeral for an artifact based on its type and level.

	Args:
		artifact (str): The type of the artifact (e.g. "health", "damage", "speed").
		i (int): The level of the artifact (Starting from 0).
	"""
	item_id = f"{artifact}_artifact_lv" + (str(i+1) if i < (maximum - 1) else "max")
	return item_id, item_id.replace("_", " ").replace("lv", "Lv.").title(), ROMAN_NUMERALS[i]

def get_attribute_wiki(key: str, equipment_config: EquipmentsConfig | None) -> list[TextComponent]:
	""" Generate wiki components for a given equipment based on its attribute modifiers.

	Args:
		key (str): The key of the equipment in Mem.definitions (e.g. "original_stardust_sword").
		given_attributes (dict[str, float]): The attributes provided by the equipment.
	"""
	if equipment_config is None:
		return []
	given_attributes: dict[str, float] = equipment_config.attributes
	item_obj = Item.from_id(key)
	attribute_modifiers: list[JsonDict] = item_obj.components.get("attribute_modifiers", [])

	# Prepare base wiki component
	durability_increase: float = equipment_config.pickaxe_durability / VanillaEquipments.PICKAXE.value[equipment_config.equivalent_to]["durability"]
	wiki: list[TextComponent] = [
		{"text":f"\nCompared to regular {equipment_config.equivalent_to.name.lower()} equipment:","color":"gray"},
		{"text":f"\n- Durability has been increased by x{durability_increase:.1f}","color":"gray"},
	]

	# Add attribute modifiers info
	if any(am["type"] == "armor" for am in attribute_modifiers):
		attribute_value: float = next(am["amount"] for am in attribute_modifiers if am["type"] == "armor")
		wiki.extend([{"text":f"\n- Armor points has been increased by {given_attributes["armor"]:.1f} ","color":"gray"},{"text":f"({attribute_value:.1f} points)","color":"white"}])
	if any(am["type"] == "armor_toughness" for am in attribute_modifiers):
		attribute_value: float = next(am["amount"] for am in attribute_modifiers if am["type"] == "armor_toughness")
		wiki.extend([{"text":f"\n- Armor Toughness has been increased by {given_attributes["armor_toughness"]:.1f} ","color":"gray"},{"text":f"({attribute_value:.1f} points)","color":"white"}])
	if any(am["type"] == "attack_damage" for am in attribute_modifiers):
		attack_increase: float = next(am["amount"] for am in attribute_modifiers if am["type"] == "attack_damage")
		wiki.extend([{"text":f"\n- Attack Damage has been increased by {given_attributes["attack_damage"]+1:.1f} ","color":"gray"},{"text":f"({attack_increase:.1f} points)","color":"white"}])
	if any(am["type"] == "mining_efficiency" for am in attribute_modifiers):
		wiki.append({"text":f"\n- Mining Efficiency has been increased by {given_attributes["mining_efficiency"]:.1f}","color":"gray"})
	return wiki


# Main Function
def main_additions() -> None:
	EQUIPMENT: str = "equipment"
	ns: str = Mem.ctx.project_id

	# Give Additional data for every item

	# Equipments
	Item(
		id="ultimate_elytra",
		base_item="minecraft:elytra",
		manual_category=EQUIPMENT,
		components={
			"item_name": rainbow_gradient_text("Ultimate Elytra"),
			"max_damage": 3456,  # x8 the durability of regular elytra (432)
			"attribute_modifiers": [
				{"type":"armor","amount": 10,"operation":"add_value","slot":"chest","id":"stardust:armor.chest"},
				{"type":"armor_toughness","amount": 4,"operation":"add_value","slot":"chest","id":"stardust:armor_toughness.chest"},
				{"type":"knockback_resistance","amount": 0.1,"operation":"add_value","slot":"chest","id":"stardust:knockback_resistance.chest"}
			],
		},
		wiki_buttons=[
			{"text":"Elytra dropped by the Ultimate Boss.","color":"yellow"},
			{"text":"\nHigher durability (x8) than regular elytra","color":"gray"},
			{"text":"\n\nWhen on Chest:","color":"gray"},
			{"text":"\n+10 Armor","color":"blue"},
			{"text":"\n+4 Armor Toughness","color":"blue"},
			{"text":"\n+1 Knockback Resistance","color":"blue"},
		],
	)
	Item(
		id="stardust_bow",
		base_item="minecraft:bow",
		manual_category=EQUIPMENT,
		components={
			"max_damage": 768,  # x2 the durability of regular bow (384)
		},
		wiki_buttons=[
			{"text":"Bow crafted from stardust materials.","color":"yellow"},
			{"text":"\nHigher durability (x2) and power (x2) than regular bows","color":"gray"},
			{"text":"\nShooting while sneaking makes no gravity arrows","color":"gray"},
		],
		recipes=[
			AwakenedForgeRecipe(particle=r"minecraft:dust{color:[0,0,1],scale:2}", result_count=1, ingredients=[
				Ingr("compacted_stardust_shard", count=4),
				Ingr("minecraft:bow", count=1),
				Ingr("minecraft:blue_stained_glass", count=4),
				Ingr("minecraft:arrow", count=1),
				Ingr("minecraft:string", count=96),
				Ingr("minecraft:spectral_arrow", count=1),
				Ingr("minecraft:lapis_block", count=4),
				Ingr("minecraft:tipped_arrow", count=1),
				Ingr("dragon_pearl", count=4),
			]),
		]
	)
	Item(
		id="awakened_stardust_bow",
		base_item="minecraft:bow",
		manual_category=EQUIPMENT,
		components={
			"max_damage": 1536,  # x4 the durability of regular bow (384)
		},
		wiki_buttons=[
			{"text":"Bow crafted from awakened stardust materials.","color":"yellow"},
			{"text":"\nHigher durability (x4) and power (x3) than regular bows","color":"gray"},
			{"text":"\nShooting while sneaking makes no gravity arrows","color":"gray"},
		],
		recipes=[
			AwakenedForgeRecipe(particle=r"minecraft:dust{color:[1,0,0],scale:2}", result_count=1, ingredients=[
				Ingr("minecraft:redstone_block", count=64),
				Ingr("awakened_stardust_frame", count=8),
				Ingr("minecraft:red_glazed_terracotta", count=64),
				Ingr("ender_dragon_pearl", count=8),
				Ingr("stardust_bow", count=1),
				Ingr("sextuple_compressed_cobblestone", count=8),
				Ingr("minecraft:red_nether_bricks", count=64),
				Ingr("awakened_stardust_block", count=8),
				Ingr("minecraft:red_mushroom_block", count=64),
			]),
		]
	)
	Item(
		id="ultimate_bow",
		base_item="minecraft:bow",
		manual_category=EQUIPMENT,
		components={
			"item_name": rainbow_gradient_text("Ultimate Bow"),
			"max_damage": 3072,  # x8 the durability of regular bow (384)
		},
		wiki_buttons=[
			{"text":"Bow crafted from ultimate stardust materials.","color":"yellow"},
			{"text":"\nHigher durability (x8) and power (x4) than regular bows","color":"gray"},
			{"text":"\nShooting while sneaking makes no gravity arrows","color":"gray"},
		],
		recipes=[
			AwakenedForgeRecipe(particle=r"minecraft:dust{color:[1,0.69,0.69],scale:2}", result_count=1, ingredients=[
				Ingr("compacted_stardust_shard", count=64),
				Ingr("minecraft:dragon_egg", count=2),
				Ingr("minecraft:echo_shard", count=32),
				Ingr("minecraft:emerald_block", count=96),
				Ingr("awakened_stardust_bow", count=1),
				Ingr("minecraft:amethyst_block", count=64),
				Ingr("minecraft:heavy_core", count=1),
				Ingr("awakened_stardust_block", count=16),
				Ingr("septuple_compressed_cobblestone", count=1),
			]),
		]
	)
	Item(
		id="stardust_sniper",
		base_item="minecraft:warped_fungus_on_a_stick",
		manual_category=EQUIPMENT,
		components={
			"max_damage": 672,
			"custom_data": {ns: {"sniper":{"damage":6, "cooldown":20, "playsound": f"{ns}:stardust_sniper_shot"}}},
		},
		wiki_buttons=[
			{"text":"Sniper crafted from stardust materials.","color":"yellow"},
			{"text":"\nBase damage: 6","color":"gray"},
			{"text":"\nCooldown: 1.00s","color":"gray"},
			*SNIPER_BULLETS_WIKI,
		],
		recipes=[
			AwakenedForgeRecipe(particle=r"minecraft:dust{color:[0,0,1],scale:2}", result_count=1, ingredients=[
				Ingr("compacted_stardust_shard", count=4),
				Ingr("minecraft:netherite_spear", count=1),
				Ingr("minecraft:blue_stained_glass", count=4),
				Ingr("minecraft:diamond_spear", count=1),
				Ingr("minecraft:lapis_lazuli", count=96),
				Ingr("minecraft:golden_spear", count=1),
				Ingr("minecraft:raw_gold_block", count=4),
				Ingr("minecraft:iron_spear", count=1),
				Ingr("dragon_pearl", count=4),
			]),
		]
	)
	Item(
		id="awakened_stardust_sniper",
		base_item="minecraft:warped_fungus_on_a_stick",
		manual_category=EQUIPMENT,
		components={
			"max_damage": 1344,
			"custom_data": {ns: {"sniper":{"damage":12, "cooldown":15, "playsound": f"{ns}:awakened_stardust_sniper_shot"}}},
		},
		wiki_buttons=[
			{"text":"Sniper crafted from awakened stardust materials.","color":"yellow"},
			{"text":"\nBase damage: 12","color":"gray"},
			{"text":"\nCooldown: 0.75s","color":"gray"},
			*SNIPER_BULLETS_WIKI,
		],
		recipes=[
			AwakenedForgeRecipe(particle=r"minecraft:dust{color:[1,0,0],scale:2}", result_count=1, ingredients=[
				Ingr("minecraft:redstone_block", count=64),
				Ingr("awakened_stardust_frame", count=8),
				Ingr("minecraft:red_glazed_terracotta", count=64),
				Ingr("ender_dragon_pearl", count=8),
				Ingr("stardust_sniper", count=1),
				Ingr("sextuple_compressed_cobblestone", count=8),
				Ingr("minecraft:red_nether_bricks", count=64),
				Ingr("awakened_stardust_block", count=8),
				Ingr("minecraft:red_mushroom_block", count=64),
			]),
		]
	)
	Item(
		id="ultimate_sniper",
		base_item="minecraft:warped_fungus_on_a_stick",
		manual_category=EQUIPMENT,
		components={
			"item_name": rainbow_gradient_text("Ultimate Sniper"),
			"max_damage": 2688,
			"custom_data": {ns: {"sniper":{"damage":18, "cooldown":10, "playsound": f"{ns}:ultimate_sniper_shot"}}},
		},
		wiki_buttons=[
			{"text":"Sniper crafted from ultimate stardust materials.","color":"yellow"},
			{"text":"\nBase damage: 18","color":"gray"},
			{"text":"\nCooldown: 0.50s","color":"gray"},
			*SNIPER_BULLETS_WIKI,
		],
		recipes=[
			AwakenedForgeRecipe(particle=r"minecraft:dust{color:[1,0.69,0.69],scale:2}", result_count=1, ingredients=[
				Ingr("compacted_stardust_shard", count=64),
				Ingr("minecraft:dragon_egg", count=2),
				Ingr("minecraft:echo_shard", count=32),
				Ingr("minecraft:emerald_block", count=96),
				Ingr("awakened_stardust_sniper", count=1),
				Ingr("minecraft:amethyst_block", count=64),
				Ingr("minecraft:heavy_core", count=1),
				Ingr("awakened_stardust_block", count=16),
				Ingr("septuple_compressed_cobblestone", count=1),
			]),
		]
	)

	# Artifacts
	for artifact, lore, attribute, levels in ARTIFACTS:
		for i, level in enumerate(levels):
			artifact_id, artifact_name, _ = artifact_display(artifact, i)
			Item(
				id=artifact_id,
				manual_category=EQUIPMENT,
				components={
					"item_name": {"text":artifact_name},
					"rarity": "epic" if i == 3 else "rare",
					"lore": [
						{"text":f"Hold in any hand to get the {artifact} effect","color":"gray","italic":False},
						{"text":f"[+{level}% {lore}]","color":"gray","italic":False},
					],
					"attribute_modifiers": [{"type":attribute,"amount":level/100,"operation":"add_multiplied_total" if artifact != "speed" else "add_multiplied_base","slot":"hand","id":f"stardust:base_{attribute}"}],
				},
				wiki_buttons=[
					{"text":artifact_name,"color":"yellow"},
					{"text":f"\nHold in any hand to get the {artifact} effect","color":"gray"},
					{"text":f"\n[+{level}% {lore}]","color":"gray"},
					*([] if i > 0 else [{"text":"\n\nCan be obtained from Lucky Artifact Bags only","color":"gray"}]),
				],
				recipes=[
					CraftingShapelessRecipe(result_count=1, category="equipment", ingredients=2*[Ingr(artifact_display(artifact, i-1)[0], ns)]),
				] if i > 0 else []
			)

	Item(
		id="lucky_artifact_bag",
		base_item="minecraft:warped_fungus_on_a_stick",
		manual_category=EQUIPMENT,
		components={
			"max_stack_size": 42,
			"!max_damage": {},
			"lore": [
				{"text":"Right-click to open and receive a random artifact.","italic":False,"color":"gray"},
			],
		},
		wiki_buttons=[
			{"text":"A mysterious bag containing a random artifact.","color":"yellow"},
			{"text":"\nRight-click to open and receive a random artifact","color":"gray"},
			{"text":"\nCan contain Health, Damage, or Speed Artifacts","color":"gray"},
			{"text":"\nThis can be found in various structures","color":"gray"},
		],
		recipes=[
			CraftingShapelessRecipe(result_count=1, category="equipment", ingredients=8*[Ingr("minecraft:leather")] + [Ingr("ultimate_shard")]),
		]
	)
	Item(
		id="item_magnet",
		manual_category=EQUIPMENT,
		components={
			"max_stack_size": 1,
			"lore": [
				{"text":"Hold in offhand to attract items","color":"gray","italic":False},
				{"text":"within a 4 blocks radius","color":"gray","italic":False},
			],
		},
		wiki_buttons=[
			{"text":"Magnet that attracts nearby items.","color":"yellow"},
			{"text":"\nHold in offhand to attract items within a 4 blocks radius","color":"gray"},
			{"text":"\nUseful for collecting dropped items","color":"gray"},
		],
		recipes=[
			CraftingShapedRecipe(result_count=1, category="equipment", shape=["U U","A A","AAA"], ingredients={"U":Ingr("ultimate_shard"),"A":Ingr("awakened_stardust_block")}),
		]
	)
	Item(
		id="home_travel_staff",
		base_item="minecraft:warped_fungus_on_a_stick",
		manual_category=EQUIPMENT,
		components={
			"max_stack_size": 1,
			"max_damage": 64,
		},
		wiki_buttons=[
			{"text":"Staff that teleports you to your spawn point.","color":"yellow"},
			{"text":"\nRight-click to teleport to your bed or world spawn","color":"gray"},
			{"text":"\nHas 64 uses before breaking","color":"gray"},
		],
		recipes=[
			CraftingShapedRecipe(result_count=1, category="equipment", shape=["D","S"], ingredients={"D":Ingr("dragon_pearl"),"S":Ingr("minecraft:stick")}),
		]
	)
	Item(
		id="wormhole_potion",
		base_item="minecraft:warped_fungus_on_a_stick",
		manual_category=EQUIPMENT,
		components={
			"max_stack_size": 16,
			"!max_damage": {},
		},
		recipes=[
			CraftingShapelessRecipe(result_count=1, category="equipment", ingredients=[
				Ingr("minecraft:cod"),Ingr("minecraft:salmon"),Ingr("minecraft:tropical_fish"),
				Ingr("minecraft:pufferfish"),Ingr("compacted_stardust_shard"),Ingr("minecraft:pufferfish"),
				Ingr("minecraft:tropical_fish"),Ingr("minecraft:salmon"),Ingr("minecraft:cod"),
			]),
		]
	)
	Item(
		id="stardust_apple",
		manual_category=EQUIPMENT,
		components={
			"food": {"can_always_eat": True, "nutrition": 4, "saturation": 9.6},  # Golden apple default
			"consumable": {
				"on_consume_effects": [{"type": "minecraft:apply_effects", "effects": [
					{"amplifier": 2, "duration": 100, "id": "minecraft:regeneration", "show_icon": True},  # Regeneration III for 5 seconds
					{"amplifier": 1, "duration": 2400, "id": "minecraft:absorption", "show_icon": True}  # Absorption II for 2 minutes
				]}]
			},
		},
		recipes=[
			CraftingShapelessRecipe(result_count=1, category="equipment", ingredients=8*[Ingr("stardust_fragment")] + [Ingr("minecraft:golden_apple")]),
		]
	)

	Item(
		id="life_crystal",
		base_item="minecraft:goat_horn",
		manual_category=EQUIPMENT,
		components={
			"instrument": f"{ns}:life_crystal",
			"max_stack_size": 64,
			"tooltip_display": {"hidden_components":["instrument"]},
			"lore": [
				{"text":"Right-click to permanently increase","italic":False,"color":"gray"},
				{"text":"your max health by 1 (0.5 heart)","italic":False,"color":"gray"},
				{"text":"(Max 20 uses: +10 hearts)","italic":False,"color":"gray"},
			],
		},
		wiki_buttons=[
			{"text":"Crystal that increases your maximum health.","color":"yellow"},
			{"text":"\nFound in underground caves in the overworld","color":"gray"},
			{"text":"\nRight-click to permanently increase max health by 1 (0.5 heart)","color":"gray"},
			{"text":"\nMaximum of 20 uses (+10 hearts)","color":"gray"},
		],
	)
	Block(
		id="life_crystal_block",
		manual_category=EQUIPMENT,
		vanilla_block=VanillaBlock(id="minecraft:glass", apply_facing="entity"),
		no_silk_touch_drop=NoSilkTouchDrop(id="life_crystal", count=1),
		override_model={"parent":"block/cube_all","textures":{"all":"minecraft:block/glass","down":f"{ns}:item/life_crystal_block","particle":"minecraft:block/glass"},"elements":[{"name":"crystal","from":[2,2,8],"to":[14,14,8],"faces":{"north":{"uv":[0,0,16,16],"texture":"#down"},"south":{"uv":[16,0,0,16],"texture":"#down"}}},{"name":"glass","from":[0,0,0],"to":[16,16,16],"faces":{"north":{"uv":[0,0,16,16],"texture":"#all"},"east":{"uv":[0,0,16,16],"texture":"#all"},"south":{"uv":[0,0,16,16],"texture":"#all"},"west":{"uv":[0,0,16,16],"texture":"#all"},"up":{"uv":[0,0,16,16],"texture":"#all"},"down":{"uv":[0,0,16,16],"texture":"#all"}}}]},
		wiki_buttons=[
			{"text":"Decorative block made from life crystals.","color":"yellow"},
			{"text":"\nFound in underground caves in the overworld","color":"gray"},
			{"text":"\nCan be broken to retrieve a life crystal","color":"gray"},
		],
		recipes=[
			CraftingShapelessRecipe(result_count=1, category="equipment", ingredients=8*[Ingr("minecraft:glass")] + [Ingr("life_crystal")]),
		]
	)

	# Ancient Stardust Equipments
	for equipment_type in SLOTS.keys():
		key: str = f"ancient_stardust_{equipment_type}"
		if key in Mem.definitions:
			obj = Item.from_id(key)
			obj.recipes = [
				CraftingShapelessRecipe(result_count=1, category="equipment", ingredients=4*[Ingr("minecraft:black_glazed_terracotta")] + 4*[Ingr("stardust_block")] + [Ingr(f"minecraft:diamond_{equipment_type}")]),
				CraftingShapelessRecipe(result_count=1, category="equipment", ingredients=4*[Ingr("minecraft:nether_wart_block")] + 4*[Ingr("stardust_block")] + [Ingr(f"minecraft:diamond_{equipment_type}")]),
				CraftingShapelessRecipe(result_count=1, category="equipment", ingredients=4*[Ingr("minecraft:blackstone")] + 4*[Ingr("stardust_block")] + [Ingr(f"minecraft:diamond_{equipment_type}")]),
			]
			obj.wiki_buttons = [
				{"text":"Poorly crafted stardust equipment.","color":"yellow"},
				*get_attribute_wiki(key, ORES_CONFIGS["ancient_stardust!"])
			]

	# Original stardust equipments
	for equipment_type in SLOTS.keys():
		key: str = f"original_stardust_{equipment_type}"
		if key in Mem.definitions:
			obj = Item.from_id(key)
			obj.recipes = [
				CraftingShapelessRecipe(result_count=1, category="equipment", ingredients=4*[Ingr("stardust_core")] + 4*[Ingr("compacted_stardust_shard")] + [Ingr(f"ancient_stardust_{equipment_type}")]),
			]
			obj.wiki_buttons = [
				{"text":"Original stardust equipment.","color":"yellow"},
				*get_attribute_wiki(key, ORES_CONFIGS["original_stardust!"])
			]

	# Legendarium equipments
	for equipment_type in SLOTS.keys():
		key: str = f"legendarium_{equipment_type}"
		if key in Mem.definitions:
			obj = Item.from_id(key)
			obj.recipes = [
				AwakenedForgeRecipe(particle=r"minecraft:dust{color:[0,1,0],scale:2}", result_count=1, ingredients=[
					Ingr(f"original_stardust_{equipment_type}", count=1),
					Ingr("legendarium_block", count=4),
					Ingr("minecraft:wind_charge", count=64),
					Ingr("minecraft:feather", count=96),
					Ingr("ender_dragon_pearl", count=6),
					Ingr("awakened_stardust_block", count=8),
					Ingr("legendarium_ingot", count=12),
					Ingr("sextuple_compressed_cobblestone", count=1)
				]),
			]
			obj.wiki_buttons = [
				{"text":"Legendarium equipment.","color":"yellow"},
				*get_attribute_wiki(key, ORES_CONFIGS["legendarium_ingot"]),
				{"text":"\n\nFull Set Bonus:","color":"gray"},
				{"text":"\n- Jump Boost III","color":"blue"}
			]

	# Solarium equipments
	for equipment_type in SLOTS.keys():
		key: str = f"solarium_{equipment_type}"
		if key in Mem.definitions:
			obj = Item.from_id(key)
			obj.recipes = [
				AwakenedForgeRecipe(particle=r"minecraft:dust{color:[1,0.5,0],scale:2}", result_count=1, ingredients=[
					Ingr(f"original_stardust_{equipment_type}", count=1),
					Ingr("solarium_block", count=4),
					Ingr("minecraft:orange_candle", count=64),
					Ingr("minecraft:blaze_powder", count=96),
					Ingr("ender_dragon_pearl", count=6),
					Ingr("awakened_stardust_block", count=8),
					Ingr("solarium_ingot", count=12),
					Ingr("sextuple_compressed_cobblestone", count=1)
				]),
			]
			obj.wiki_buttons = [
				{"text":"Solarium equipment.","color":"yellow"},
				*get_attribute_wiki(key, ORES_CONFIGS["solarium_ingot"]),
				{"text":"\n\nFull Set Bonus:","color":"gray"},
				{"text":"\n- Fire Resistance","color":"blue"}
			]

	# Darkium equipments
	for equipment_type in SLOTS.keys():
		key: str = f"darkium_{equipment_type}"
		if key in Mem.definitions:
			obj = Item.from_id(key)
			obj.recipes = [
				AwakenedForgeRecipe(particle=r"minecraft:dust{color:[0,0,0],scale:2}", result_count=1, ingredients=[
					Ingr(f"original_stardust_{equipment_type}", count=1),
					Ingr("darkium_block", count=4),
					Ingr("minecraft:respawn_anchor", count=64),
					Ingr("minecraft:ink_sac", count=96),
					Ingr("ender_dragon_pearl", count=6),
					Ingr("awakened_stardust_block", count=8),
					Ingr("darkium_ingot", count=12),
					Ingr("sextuple_compressed_cobblestone", count=1),
				]),
			]
			obj.wiki_buttons = [
				{"text":"Darkium equipment.","color":"yellow"},
				*get_attribute_wiki(key, ORES_CONFIGS["darkium_ingot"]),
				{"text":"\n\nFull Set Bonus:","color":"gray"},
				{"text":"\n- Resistance I","color":"blue"}
			]

	# Full armor effects
	for armor_type, effect, level in [
		("legendarium", "minecraft:jump_boost", 3),
		("solarium", "minecraft:fire_resistance", 1),
		("darkium", "minecraft:resistance", 1),
	]:
		write_function(f"{ns}:advancements/inventory_changed", f"""
# Grant {armor_type.title()} full armor effect
scoreboard players set #success {ns}.data 0
execute if items entity @s armor.head *[custom_data~{{{ns}:{{"{armor_type}_helmet":true}}}}] if items entity @s armor.chest *[custom_data~{{{ns}:{{"{armor_type}_chestplate":true}}}}] if items entity @s armor.legs *[custom_data~{{{ns}:{{"{armor_type}_leggings":true}}}}] if items entity @s armor.feet *[custom_data~{{{ns}:{{"{armor_type}_boots":true}}}}] run scoreboard players set #success {ns}.data 1
execute if score #success {ns}.data matches 1 if entity @s[tag=!{ns}.{armor_type}_full_armor] run tag @s add {ns}.{armor_type}_full_armor
execute if score #success {ns}.data matches 0 if entity @s[tag={ns}.{armor_type}_full_armor] run tag @s remove {ns}.{armor_type}_full_armor
""")
		write_versioned_function("second_5", f"""
# Apply {armor_type.title()} full armor effect
effect give @a[tag={ns}.{armor_type}_full_armor] {effect} 6 {level-1} true
""")
