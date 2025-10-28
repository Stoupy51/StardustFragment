
# ruff: noqa: E501
# Imports
from typing import cast

from stewbeet import (
	CATEGORY,
	CUSTOM_BLOCK_VANILLA,
	CUSTOM_ITEM_VANILLA,
	NO_SILK_TOUCH_DROP,
	OVERRIDE_MODEL,
	RESULT_OF_CRAFTING,
	SLOTS,
	VANILLA_BLOCK,
	WIKI_COMPONENT,
	JsonDict,
	Mem,
	TextComponent,
	ingr_repr,
)
from stouputils.print import info

from .common import DAMAGED_STARDUST_DURABILITY, DIAMOND_PICKAXE, ORES_CONFIGS, ORIGINAL_DURABILITY, EquipmentsConfig, NETHERITE_PICKAXE

# Constants
SNIPER_BULLETS_WIKI: list[TextComponent] = [
	{"text":"\nPossible bullet types:","color":"gray"},
	{"text":"\n- Copper nugget: +3 damage","color":"gray"},
	{"text":"\n- Iron nugget: +5 damage","color":"gray"},
	{"text":"\n- Gold nugget: +7 damage","color":"gray"},
	{"text":"\n- Stardust Essence: +10 damage","color":"gray"},
	{"text":"\n- Awakened Stardust: +20 damage","color":"gray"},
]

def main_additions() -> None:
	EQUIPMENT: str = "equipment"
	ns: str = Mem.ctx.project_id

	# Give Additional data for every item
	additions: dict[str, JsonDict] = {

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
			OVERRIDE_MODEL: {"parent":"block/cube_all","textures":{"all":"minecraft:block/glass","down":f"{ns}:item/life_crystal_block","particle":"minecraft:block/glass"},"elements":[{"name":"crystal","from":[2,2,8],"to":[14,14,8],"faces":{"north":{"uv":[0,0,16,16],"texture":"#down"},"south":{"uv":[16,0,0,16],"texture":"#down"}}},{"name":"glass","from":[0,0,0],"to":[16,16,16],"faces":{"north":{"uv":[0,0,16,16],"texture":"#all"},"east":{"uv":[0,0,16,16],"texture":"#all"},"south":{"uv":[0,0,16,16],"texture":"#all"},"west":{"uv":[0,0,16,16],"texture":"#all"},"up":{"uv":[0,0,16,16],"texture":"#all"},"down":{"uv":[0,0,16,16],"texture":"#all"}}}]},
			RESULT_OF_CRAFTING: [
				{"type":"crafting_shapeless","result_count":1,"category":"misc","ingredients":8*[ingr_repr("minecraft:glass")] + [ingr_repr("life_crystal", ns)]},
			]
		},
	}

	# Damaged Stardust Equipments
	damaged_attributes: dict[str, float] = cast(EquipmentsConfig, ORES_CONFIGS["damaged_stardust!"]).attributes
	for equipment_type in SLOTS.keys():
		key: str = f"damaged_stardust_{equipment_type}"
		if key in Mem.definitions:
			additions[key] = {
				RESULT_OF_CRAFTING: [
					{"type":"crafting_shapeless","result_count":1,"category":"misc","ingredients":4*[ingr_repr("minecraft:black_glazed_terracotta")] + 4*[ingr_repr("stardust_block", ns)] + [ingr_repr(f"minecraft:diamond_{equipment_type}", ns)]},
					{"type":"crafting_shapeless","result_count":1,"category":"misc","ingredients":4*[ingr_repr("minecraft:nether_wart_block")] + 4*[ingr_repr("stardust_block", ns)] + [ingr_repr(f"minecraft:diamond_{equipment_type}", ns)]},
					{"type":"crafting_shapeless","result_count":1,"category":"misc","ingredients":4*[ingr_repr("minecraft:blackstone")] + 4*[ingr_repr("stardust_block", ns)] + [ingr_repr(f"minecraft:diamond_{equipment_type}", ns)]},
				],
				WIKI_COMPONENT: [
					{"text":"Poorly crafted stardust equipment.","color":"yellow"},
					{"text":"\nCompared to regular diamond equipment:","color":"gray"},
					{"text":f"\n- Durability has been increased by x{DAMAGED_STARDUST_DURABILITY/DIAMOND_PICKAXE:.1f}","color":"gray"},
				]
			}

			# Add more info to WIKI_COMPONENT
			attribute_modifiers: list[JsonDict] = Mem.definitions[key].get("attribute_modifiers", [])
			if any(am["type"] == "armor" for am in attribute_modifiers):
				attribute_value: float = next(am["amount"] for am in attribute_modifiers if am["type"] == "armor")
				additions[key][WIKI_COMPONENT].extend([{"text":f"\n- Armor points has been increased by {damaged_attributes["armor"]:.1f} ","color":"gray"},{"text":f"({attribute_value:.1f} points)","color":"white"}])
			if any(am["type"] == "armor_toughness" for am in attribute_modifiers):
				attribute_value: float = next(am["amount"] for am in attribute_modifiers if am["type"] == "armor_toughness")
				additions[key][WIKI_COMPONENT].extend([{"text":f"\n- Armor Toughness has been increased by {damaged_attributes["armor_toughness"]:.1f} ","color":"gray"},{"text":f"({attribute_value:.1f} points)","color":"white"}])
			if any(am["type"] == "attack_damage" for am in attribute_modifiers):
				attack_increase: float = next(am["amount"] for am in attribute_modifiers if am["type"] == "attack_damage")
				additions[key][WIKI_COMPONENT].extend([{"text":f"\n- Attack Damage has been increased by {damaged_attributes["attack_damage"]+1:.1f} ","color":"gray"},{"text":f"({attack_increase:.1f} points)","color":"white"}])
			if any(am["type"] == "mining_efficiency" for am in attribute_modifiers):
				additions[key][WIKI_COMPONENT].append({"text":f"\n- Mining Efficiency has been increased by {damaged_attributes["mining_efficiency"]:.1f}","color":"gray"})

	# Original stardust equipments
	for equipment_type in SLOTS.keys():
		key: str = f"original_stardust_{equipment_type}"
		if key in Mem.definitions:
			additions[key] = {
				RESULT_OF_CRAFTING: [
				],
				WIKI_COMPONENT: [
					{"text":"Original stardust equipment.","color":"yellow"},
					{"text":"\nCompared to regular netherite equipment:","color":"gray"},
					{"text":f"\n- Durability has been increased by x{ORIGINAL_DURABILITY/NETHERITE_PICKAXE:.1f}","color":"gray"},
				]
			}

			# Add more info to WIKI_COMPONENT
			attribute_modifiers: list[JsonDict] = Mem.definitions[key].get("attribute_modifiers", [])
			if any(am["type"] == "armor" for am in attribute_modifiers):
				attribute_value: float = next(am["amount"] for am in attribute_modifiers if am["type"] == "armor")
				additions[key][WIKI_COMPONENT].extend([{"text":f"\n- Armor points has been increased by {damaged_attributes["armor"]:.1f} ","color":"gray"},{"text":f"({attribute_value:.1f} points)","color":"white"}])
			if any(am["type"] == "armor_toughness" for am in attribute_modifiers):
				attribute_value: float = next(am["amount"] for am in attribute_modifiers if am["type"] == "armor_toughness")
				additions[key][WIKI_COMPONENT].extend([{"text":f"\n- Armor Toughness has been increased by {damaged_attributes["armor_toughness"]:.1f} ","color":"gray"},{"text":f"({attribute_value:.1f} points)","color":"white"}])
			if any(am["type"] == "attack_damage" for am in attribute_modifiers):
				attack_increase: float = next(am["amount"] for am in attribute_modifiers if am["type"] == "attack_damage")
				additions[key][WIKI_COMPONENT].extend([{"text":f"\n- Attack Damage has been increased by {damaged_attributes["attack_damage"]+1:.1f} ","color":"gray"},{"text":f"({attack_increase:.1f} points)","color":"white"}])
			if any(am["type"] == "mining_efficiency" for am in attribute_modifiers):
				additions[key][WIKI_COMPONENT].append({"text":f"\n- Mining Efficiency has been increased by {damaged_attributes["mining_efficiency"]:.1f}","color":"gray"})
	# TODO: refactor above into a function (get_attribute_wiki(...))

	# Update the definitions with new data
	for k, v in additions.items():
		if k in Mem.definitions:
			Mem.definitions[k].update(v)
		else:
			Mem.definitions[k] = v

	# Log success message
	info("Applied StardustFragment equipments additions successfully!")

