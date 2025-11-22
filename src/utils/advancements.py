
# ruff: noqa: E501
# Imports
from typing import Any

from stewbeet import Advancement, JsonDict, Mem, Texture, set_json_encoder, super_merge_dict

from ..definitions.additions.energy import quarry_display
from ..definitions.additions.equipments import ARTIFACTS, SNIPER_BULLETS, artifact_display
from ..definitions.additions.materials import COBBLESTONE_TIERS
from ..definitions.additions.miscellaneous import miner_display
from .common import ROMAN_NUMERALS, STARFRAG_LIST

# Constants
IMPOSSIBLE_CRITERIA: JsonDict = {"requirement": {"trigger": "minecraft:impossible", "conditions": {}}}


# Utility function to convert definition to icon
def def_to_icon(data: JsonDict | str, enchanted: bool = False) -> JsonDict:
	""" Convert a definition to an advancement icon.

	Args:
		data (JsonDict | str): Definition data or item name.
		enchanted (bool): Whether to add the enchanted glint effect.
	Returns:
		JsonDict: Advancement icon, e.g. {"id": "minecraft:stone", "components": {...}}
	"""
	if isinstance(data, str):
		if data.startswith("minecraft:"):
			return {"id": data}
		data = Mem.definitions[data]
	icon: dict[str, Any] = {"id": data["id"]}
	components_to_copy: list[str] = ["item_model", "profile"]
	for component in components_to_copy:
		if data.get(component):
			if not icon.get("components"):
				icon["components"] = {}
			icon["components"][f"minecraft:{component}"] = data[component]
	if enchanted:
		if not icon.get("components"):
			icon["components"] = {}
		icon["components"]["minecraft:enchantment_glint_override"] = True
	return icon

# Add visible advancements to the datapack
def add_visible_advancements() -> None:
	ns: str = Mem.ctx.project_id
	textures_folder: str = Mem.ctx.meta.get("stewbeet", {}).get("textures_folder", "textures")

	# Copy advancement texture
	source: str = f"{textures_folder}/advancement_background.png"
	Mem.ctx.assets[ns].textures["block/gui/advancement_background"] = Texture(source_path=source)

	# Seeds helper
	SEEDS: list[tuple[str, str]] = [
		("diamond_seed", "Farming diamonds"),
		("advanced_diamond_seed", "More diamonds!"),
		("stardust_seed", "Farming stardust"),
		("advanced_stardust_seed", "More stardust!"),
		("elite_stardust_seed", "Even more stardust!"),
		("legendarium_seed", "Nature and Wind"),
		("solarium_seed", "Fire and Light"),
		("darkium_seed", "Darkness and Shadow"),
	]

	# Advancements list
	background: str = f"{ns}:block/gui/advancement_background"
	advancements: dict[str, JsonDict] = {
		"stardust_fragment": {"display": {"title": STARFRAG_LIST[1], "description": {"text": "What's this little blue thing?", "color": "green"}, "background": background}},

		## Adventure advancements
		# Artifacts
		**{
			f"adventure/artifacts/{item}": {"display": {"title": {"text": f"Increasing {name} {roman}", "color": "aqua"}, "description": {"text": f"Obtain a level {i+1} {artifact.title()} Artifact", "color": "green"}}, "parent": parent}
			for artifact, _, attribute, levels in ARTIFACTS
			for name in (attribute.replace("_", " ").title(),)
			for i in range(len(levels))
			for item, _, roman in (artifact_display(artifact, i),)
			for parent in (f"{ns}:visible/stardust_fragment" if i == 0 else f"{ns}:visible/adventure/artifacts/{artifact_display(artifact, i-1)[0]}",)
		},

		# Seeds
		**{
			f"adventure/seeds/{seed_id}": {"display": {"title": {"text": title, "color": "aqua"}, "description": {"text": f"Admire this {name} Seed", "color": "green"}}, "parent": parent}
			for i, (seed_id, title) in enumerate(SEEDS)
			for name in (seed_id.replace("_", " ").title(),)
			for parent in (f"{ns}:visible/stardust_fragment" if i == 0 else f"{ns}:visible/adventure/seeds/{SEEDS[i-1][0]}",)
		},

		# Sniper bullets
		**{
			f"adventure/bullets/{bullet.replace('minecraft:', '')}": {"display": {"icon": icon, "title": {"text": title, "color": "aqua"}, "description": {"text": f"Shoot a {name} Bullet using a Sniper", "color": "green"}}, "parent": parent, "criteria": IMPOSSIBLE_CRITERIA}
			for i, bullet in enumerate(SNIPER_BULLETS.keys())
			for name in (bullet.replace("minecraft:", "").replace("_", " ").title(),)
			for title in (f"{name.split(' ')[0]} Bullets" if bullet != "stardust_fragment" else "Shooting Stars",)
			for icon in (def_to_icon(bullet),)
			for parent in (f"{ns}:visible/stuff/stardust_sniper" if i == 0 else f"{ns}:visible/adventure/bullets/{list(SNIPER_BULLETS.keys())[i-1].replace('minecraft:', '')}",)
		},

		# No subcategories
		"adventure/enter_cavern": {"display": {"icon": def_to_icon("cavern_portal"), "title": {"text": "Return to monke", "color": "aqua"}, "description": {"text": "Travel to the Cavern Dimension", "color": "green"}}, "parent": f"{ns}:visible/stardust_fragment","criteria": {"requirement": {"trigger": "minecraft:changed_dimension", "conditions": {"to": f"{ns}:cavern"}}}},
		"adventure/enter_celestial": {"display": {"icon": def_to_icon("celestial_portal"), "title": {"text": "Skyblock, isn't it?", "color": "aqua"}, "description": {"text": "Enter the Celestial Dimension", "color": "green"}}, "parent": f"{ns}:visible/adventure/enter_cavern", "criteria": {"requirement": {"trigger": "minecraft:changed_dimension", "conditions": {"to": f"{ns}:celestial"}}}},
		"adventure/enter_stardust_dungeon_dim": {"display": {"icon": def_to_icon("stardust_dungeon_portal"), "title": {"text": "A dimension, a dungeon", "color": "aqua"}, "description": {"text": "Enter the Stardust Dungeon Dimension", "color": "green"}}, "parent": f"{ns}:visible/adventure/enter_stardust", "criteria": {"requirement": {"trigger": "minecraft:changed_dimension", "conditions": {"to": f"{ns}:dungeon"}}}},
		"adventure/enter_stardust_dungeon": {"display": {"icon": def_to_icon("stardust_dungeon_key"), "title": {"text": "Entering the dungeon", "color": "aqua"}, "description": {"text": "Use a Stardust Dungeon Key", "color": "green"}}, "parent": f"{ns}:visible/adventure/enter_stardust_dungeon_dim", "criteria": IMPOSSIBLE_CRITERIA},
		"adventure/enter_stardust": {"display": {"icon": def_to_icon("stardust_portal"), "title": {"text": "Everythin's blue", "color": "aqua"}, "description": {"text": "Travel to the Stardust Dimension", "color": "green"}}, "parent": f"{ns}:visible/adventure/enter_celestial", "criteria": {"requirement": {"trigger": "minecraft:changed_dimension", "conditions": {"to": f"{ns}:stardust"}}}},
		"adventure/enter_ultimate": {"display": {"icon": def_to_icon("ultimate_portal"), "title": {"text": "The Ultimate Dimension", "color": "aqua"}, "description": {"text": "Travel to the Ultimate Dimension", "color": "green"}}, "parent": f"{ns}:visible/adventure/enter_stardust_dungeon_dim", "criteria": {"requirement": {"trigger": "minecraft:changed_dimension", "conditions": {"to": f"{ns}:ultimate"}}}},
		"adventure/falling_celestial": {"display": {"icon": {"id": "minecraft:feather"}, "title": {"text": "Where did I put my bucket?"}, "description": {"text": "Fall from the Celestial dimension", "color": "green"}, "frame": "challenge", "hidden": True}, "parent": f"{ns}:visible/adventure/enter_celestial", "criteria": IMPOSSIBLE_CRITERIA},
		"adventure/falling_stardust": {"display": {"icon": {"id": "minecraft:feather"}, "title": {"text": "I did it wrong"}, "description": {"text": "Fall from the Stardust dimension", "color": "green"}, "frame": "challenge", "hidden": True}, "parent": f"{ns}:visible/adventure/enter_stardust", "criteria": IMPOSSIBLE_CRITERIA},
		"adventure/lucky_artifact_bag": {"display": {"icon": def_to_icon("lucky_artifact_bag"), "title": {"text": "What am I going to take out?", "color": "aqua"}, "description": {"text": "Find a Lucky Artifact Bag", "color": "green"}}, "parent": f"{ns}:visible/stardust_fragment"},
		"adventure/multiple_ultimate_boss": {"display": {"icon": {"id": "minecraft:dragon_head"}, "title": {"text": "Numbers don't affraid me"}, "description": {"text": "Summon two Ultimate Boss at the same time", "color": "green"}, "frame": "challenge", "hidden": True}, "parent": f"{ns}:visible/adventure/ultimate_boss", "criteria": IMPOSSIBLE_CRITERIA},
		"adventure/stardust_guardian": {"display": {"icon": {"id": "minecraft:wither_skeleton_skull"}, "title": {"text": "Making another step", "color": "aqua"}, "description": {"text": "Kill the Stardust Guardian", "color": "green"}}, "parent": f"{ns}:visible/adventure/enter_stardust_dungeon", "criteria": IMPOSSIBLE_CRITERIA},
		"adventure/stardust_pillar": {"display": {"icon": def_to_icon("starlight_infuser"), "title": {"text": "A Stardust Pillar", "color": "aqua"}, "description": {"text": "Summon the Stardust Pillar", "color": "green"}}, "parent": f"{ns}:visible/adventure/enter_stardust", "criteria": IMPOSSIBLE_CRITERIA},
		"adventure/stoup_army": {"display": {"icon": def_to_icon("stoupegg"), "title": {"text": "Fighting a mini-boss", "color": "aqua"}, "description": {"text": "Fight against your first Stoup Army", "color": "green"}}, "parent": f"{ns}:visible/adventure/enter_cavern", "criteria": IMPOSSIBLE_CRITERIA},
		"adventure/summon_ultimate_boss": {"display": {"icon": def_to_icon("ultimate_dragon_essence"), "title": {"text": "A journey to the end", "color": "aqua"}, "description": {"text": "Summon the Ultimate Boss", "color": "green"}}, "parent": f"{ns}:visible/adventure/enter_ultimate", "criteria": IMPOSSIBLE_CRITERIA},
		"adventure/ultimate_boss_ez": {"display": {"icon": def_to_icon("ultimate_dragon_egg"), "title": {"text": "Star Fighter"}, "description": {"text": "Defeat the Ultimate Boss\\nby taking less than 10 hearts of damage", "color": "green"}, "frame": "challenge", "hidden": True}, "parent": f"{ns}:visible/adventure/ultimate_boss", "criteria": IMPOSSIBLE_CRITERIA},
		"adventure/ultimate_boss": {"display": {"icon": def_to_icon("ultimate_dragon_egg", enchanted=True), "title": {"text": "Stard'End", "color": "aqua"}, "description": {"text": "Defeat the Ultimate Boss", "color": "green"}, "frame": "goal"}, "parent": f"{ns}:visible/adventure/summon_ultimate_boss", "criteria": IMPOSSIBLE_CRITERIA},
		"adventure/use_awakened_forge": {"display": {"icon": {"id": "minecraft:dragon_egg"}, "title": {"text": "A new crafting structure", "color": "aqua"}, "description": {"text": "Use the Awakened Forge", "color": "green"}}, "parent": f"{ns}:visible/stardust_fragment", "criteria": IMPOSSIBLE_CRITERIA},



		## Equipments advancements
		# Compressed cobblestones
		**{
			f"stuff/cobblestone/{tier}": {"display": {"icon": def_to_icon(f"{tier}_cobblestone"), "title": {"text": title, "color": "aqua"}, "description": {"text": f"Obtain a {tier.replace('_', ' ').title()} Cobblestone", "color": "green"}, "frame": frame}, "parent": parent}
			for i, tier in enumerate(COBBLESTONE_TIERS)
			for title in (f"Compressing {ROMAN_NUMERALS[i]}" if i < (len(COBBLESTONE_TIERS) - 1) else "43,046,721",)
			for frame in ("task" if i < (len(COBBLESTONE_TIERS) - 1) else "challenge",)
			for parent in (f"{ns}:visible/stuff/stardust_ingot" if i == 0 else f"{ns}:visible/stuff/cobblestone/{COBBLESTONE_TIERS[i-1]}",)
		},
		# Cobblestone Miners
		**{
			f"stuff/miners/{item}": {"display": {"title": {"text": f"Rockraiser {roman}", "color": "aqua"}, "description": {"text": f"Obtain a {name}", "color": "green"}, "frame": frame}, "parent": parent}
			for i in range(8)
			for frame in ("task" if i < 7 else "challenge",)
			for item, name, roman in (miner_display(i),)
			for parent in (f"{ns}:visible/stuff/cobblestone/compressed" if i == 0 else f"{ns}:visible/stuff/miners/{miner_display(i-1)[0]}",)
		},

		# Armor & Tools
		**{
			f"stuff/{material}_equipment": {
				"display": { "icon": def_to_icon(f"{material}_chestplate"),
					"title": {"text": title, "color": "aqua"},
					"description": {"text": desc, "color": "green"},
				},
				"criteria": {"requirement": {"trigger": "minecraft:inventory_changed","conditions": {
					"items": [
						{"predicates": {"minecraft:custom_data": {"smithed": {"dict": {"armor": {material: True}}}}}},
						{"predicates": {"minecraft:custom_data": {"smithed": {"dict": {"tools": {material: True}}}}}},
				]}}},
				"parent": parent
			}
			for materials in ([
				("ancient_stardust", "I think it was like it", "Upgrade a Diamond equipment into Ancient Stardust"),
				("original_stardust", "Yup that's it!", "Use the power of a Stardust Core to craft an Original Stardust equipment"),
				("legendarium", "Taking a breath", "Choose the Legendarium path"),
				("solarium", "Burning your soul", "Choose the Solarium path"),
				("darkium", "Be aware of your shadow", "Choose the Darkium path")
			],)
			for i, (material, title, desc) in enumerate(materials)
			for parent in (f"{ns}:visible/stuff/stardust_ingot" if i == 0 else f"{ns}:visible/stuff/{materials[i-1][0]}_equipment",)
		},

		# Other equipments
		"stuff/stardust_ingot": {"display": {"title": {"text": "I feel like it's useful", "color": "aqua"}, "description": {"text": "Obtain a Stardust Ingot", "color": "green"}}, "parent": f"{ns}:visible/stardust_fragment"},

		# Technology advancements
		# TODO
	}

	# Add default display options
	display_options: dict[str, bool | str] = {"frame": "task", "show_toast": True, "announce_to_chat": True, "hidden": False}
	for advancement in advancements.values():
		for key, value in display_options.items():
			if not advancement.get("display", {}).get(key):
				advancement["display"][key] = value


	# For each advancement,
	for full_path, adv in advancements.items():
		item: str = full_path.split("/")[-1]
		data: JsonDict = Mem.definitions.get(item, {})
		advancement: dict[str, Any] = {"display":{}, "criteria": {}, "requirements": [["requirement"]]}

		# If challenge, remove color from title
		if adv.get("display", {}).get("frame") == "challenge":
			title = adv["display"].get("title", {})
			if isinstance(title, dict):
				title.pop("color", None) # type: ignore

		# Set icon
		if not adv.get("display", {}).get("icon"):
			icon: dict[str, Any] = {"id": data["id"]}
			components_to_copy: list[str] = ["item_model", "profile"]
			for component in components_to_copy:
				if data.get(component):
					if not icon.get("components"):
						icon["components"] = {}
					icon["components"][f"minecraft:{component}"] = data[component]
			advancement["display"]["icon"] = icon

		# Set the criteria, if not already set
		if not adv.get("criteria"):
			criteria: dict[str, Any] = {"requirement": {"trigger": "minecraft:inventory_changed","conditions": {"items": [{"predicates": {}}]}}}
			criteria["requirement"]["conditions"]["items"][0]["predicates"]["minecraft:custom_data"] = {ns:{item:True}}
			advancement["criteria"] = criteria

		# Set the advancement
		advancement = super_merge_dict(advancement, adv)
		Mem.ctx.data[ns].advancements[f"visible/{full_path}"] = set_json_encoder(Advancement(advancement), max_level = 7)

	return

