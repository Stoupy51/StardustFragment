
# ruff: noqa: E501
# Imports
from typing import Any

from stewbeet import Advancement, JsonDict, Mem, Texture, set_json_encoder, super_merge_dict

from .common import STARFRAG_LIST
from ..definitions.additions.equipments import ARTIFACTS, artifact_id


# Utility function to convert definition to icon
def def_to_icon(data: JsonDict | str) -> JsonDict:
	""" Convert a definition to an advancement icon.

	Args:
		data (JsonDict | str): Definition data or item name.
	Returns:
		JsonDict: Advancement icon, e.g. {"id": "minecraft:stone", "components": {...}}
	"""
	if isinstance(data, str):
		data = Mem.definitions[data]
	icon: dict[str, Any] = {"id": data["id"]}
	components_to_copy: list[str] = ["item_model", "profile"]
	for component in components_to_copy:
		if data.get(component):
			if not icon.get("components"):
				icon["components"] = {}
			icon["components"][f"minecraft:{component}"] = data[component]
	return icon

# Add visible advancements to the datapack
def add_visible_advancements() -> None:
	ns: str = Mem.ctx.project_id
	textures_folder: str = Mem.ctx.meta.get("stewbeet", {}).get("textures_folder", "textures")

	# Copy advancement texture
	source: str = f"{textures_folder}/advancement_background.png"
	Mem.ctx.assets[ns].textures["block/gui/advancement_background"] = Texture(source_path=source)

	# Advancements list
	background: str = f"{ns}:block/gui/advancement_background"
	advancements: dict[str, JsonDict] = {
		"stardust_fragment": {"display": {"title": STARFRAG_LIST[1], "description": {"text": "What's this little blue thing?", "color": "green"}, "background": background}},

		## Adventure advancements
		# Artifacts
		**{
			f"adventure/artifacts/{artifact_id(artifact, i)}": {"display": {"title": {"text": f"Increasing {name} {roman}", "color": "aqua"}, "description": {"text": f"Get a level {i+1} {artifact.title()} Artifact", "color": "green"}}, "parent": f"{ns}:visible/stardust_fragment","criteria": {"requirement": {"trigger": "minecraft:inventory_changed", "conditions": {"items": [{"predicates": {"minecraft:custom_data": {ns: {artifact_id(artifact, i): True}}}}]}}}}
			for artifact, _, attribute, levels in ARTIFACTS
			for name in (attribute.replace("_", " ").title(),)
			for i in range(len(levels))
			for roman in (('I'*(i+1)).replace('IIII', 'IV'),)
		},

		# No subcategories
		"adventure/enter_cavern": {"display": {"icon": def_to_icon("cavern_portal"), "title": {"text": "Return to monke", "color": "aqua"}, "description": {"text": "Travel to the Cavern Dimension", "color": "green"}}, "parent": f"{ns}:visible/stardust_fragment","criteria": {"requirement": {"trigger": "minecraft:changed_dimension", "conditions": {"to": f"{ns}:cavern"}}}},
		"adventure/enter_celestial": {"display": {"icon": def_to_icon("celestial_portal"), "title": {"text": "Skyblock, isn't it?", "color": "aqua"}, "description": {"text": "Enter the Celestial Dimension", "color": "green"}}, "parent": f"{ns}:visible/adventure/enter_cavern", "criteria": {"requirement": {"trigger": "minecraft:changed_dimension", "conditions": {"to": f"{ns}:celestial"}}}},
		"adventure/enter_stardust": {"display": {"icon": def_to_icon("stardust_portal"), "title": {"text": "Everythin's blue", "color": "aqua"}, "description": {"text": "Travel to the Stardust Dimension", "color": "green"}}, "parent": f"{ns}:visible/adventure/enter_celestial", "criteria": {"requirement": {"trigger": "minecraft:changed_dimension", "conditions": {"to": f"{ns}:stardust"}}}},
		"adventure/enter_stardust_dungeon_dim": {"display": {"icon": def_to_icon("stardust_dungeon_portal"), "title": {"text": "A dimension, a dungeon", "color": "aqua"}, "description": {"text": "Enter the Stardust Dungeon Dimension", "color": "green"}}, "parent": f"{ns}:visible/adventure/enter_stardust", "criteria": {"requirement": {"trigger": "minecraft:changed_dimension", "conditions": {"to": f"{ns}:dungeon"}}}},
		"adventure/enter_stardust_dungeon": {"display": {"icon": def_to_icon("stardust_dungeon_key"), "title": {"text": "Entering the dungeon", "color": "aqua"}, "description": {"text": "Use a Stardust Dungeon Key", "color": "green"}}, "parent": f"{ns}:visible/adventure/enter_stardust_dungeon_dim", "criteria": {"requirement": {"trigger": "minecraft:impossible", "conditions": {}}}},
		"adventure/enter_ultimate": {"display": {"icon": def_to_icon("ultimate_portal"), "title": {"text": "The Ultimate Dimension", "color": "aqua"}, "description": {"text": "Travel to the Ultimate Dimension", "color": "green"}}, "parent": f"{ns}:visible/adventure/enter_stardust_dungeon_dim", "criteria": {"requirement": {"trigger": "minecraft:changed_dimension", "conditions": {"to": f"{ns}:ultimate"}}}},
		"use_awakened_forge": {"display": {"icon": {"id": "minecraft:dragon_egg"}, "title": {"text": "A new crafting structure", "color": "aqua"}, "description": {"text": "Use the Awakened Forge", "color": "green"}}, "parent": f"{ns}:visible/stardust_fragment", "criteria": {"requirement": {"trigger": "minecraft:impossible", "conditions": {}}}},
		"stoup_army": {"display": {"icon": def_to_icon("stoupegg"), "title": {"text": "Fighting a mini-boss", "color": "aqua"}, "description": {"text": "Fight against your first Stoup Army", "color": "green"}}, "parent": f"{ns}:visible/adventure/enter_cavern", "criteria": {"requirement": {"trigger": "minecraft:impossible", "conditions": {}}}},
		"stardust_guardian": {"display": {"icon": {"id": "minecraft:wither_skeleton_skull"}, "title": {"text": "Making another step", "color": "aqua"}, "description": {"text": "Kill the Stardust Guardian", "color": "green"}}, "parent": f"{ns}:visible/adventure/enter_stardust_dungeon", "criteria": {"requirement": {"trigger": "minecraft:player_killed_entity", "conditions": {"entity": [{"condition": "minecraft:entity_properties", "entity": "this", "predicate": {"type": "minecraft:wither_skeleton", "nbt": f"{{DeathLootTable:\"{ns}:entities/stardust_guardian\",Tags:[\"{ns}.stardust_guardian\"]}}"}}]}}}},
		"stardust_pillar": {"display": {"icon": def_to_icon("starlight_infuser"), "title": {"text": "A Stardust Pillar", "color": "aqua"}, "description": {"text": "Summon the Stardust Pillar", "color": "green"}}, "parent": f"{ns}:visible/adventure/enter_stardust", "criteria": {"requirement": {"trigger": "minecraft:impossible", "conditions": {}}}},
		"summon_ultimate_boss": {"display": {"icon": def_to_icon("ultimate_dragon_essence"), "title": {"text": "A journey to the end", "color": "aqua"}, "description": {"text": "Summon the Ultimate Boss", "color": "green"}}, "parent": f"{ns}:visible/adventure/enter_ultimate", "criteria": {"requirement": {"trigger": "minecraft:impossible", "conditions": {}}}},
		"ultimate_boss": {"display": {"icon": def_to_icon("ultimate_dragon_egg"), "title": {"text": "Stard'End", "color": "aqua"}, "description": {"text": "Defeat the Ultimate Boss", "color": "green"}, "frame": "goal"}, "parent": f"{ns}:visible/adventure/summon_ultimate_boss", "criteria": {"requirement": {"trigger": "minecraft:impossible", "conditions": {}}}},
		"lucky_artifact_bag": {"display": {"icon": def_to_icon("lucky_artifact_bag"), "title": {"text": "What am I going to take out?", "color": "aqua"}, "description": {"text": "Find a Lucky Artifact Bag", "color": "green"}}, "parent": f"{ns}:visible/stardust_fragment", "criteria": {"requirement": {"trigger": "minecraft:inventory_changed", "conditions": {"items": [{"predicates": {"minecraft:custom_data": {ns: {"lucky_artifact_bag": True}}}}]}}}},
		"falling_celestial": {"display": {"icon": {"id": "minecraft:feather"}, "title": {"text": "Where did I put my bucket?"}, "description": {"text": "Fall from the Celestial dimension", "color": "green"}, "frame": "challenge", "hidden": True}, "parent": f"{ns}:visible/adventure/enter_celestial", "criteria": {"requirement": {"trigger": "minecraft:impossible", "conditions": {}}}},
		"falling_stardust": {"display": {"icon": {"id": "minecraft:feather"}, "title": {"text": "I did it wrong"}, "description": {"text": "Fall from the Stardust dimension", "color": "green"}, "frame": "challenge", "hidden": True}, "parent": f"{ns}:visible/adventure/enter_stardust", "criteria": {"requirement": {"trigger": "minecraft:impossible", "conditions": {}}}},
		"multiple_ultimate_boss": {"display": {"icon": {"id": "minecraft:dragon_head"}, "title": {"text": "Numbers don't affraid me"}, "description": {"text": "Summon two Ultimate Boss at the same time", "color": "green"}, "frame": "challenge", "hidden": True}, "parent": f"{ns}:visible/adventure/ultimate_boss", "criteria": {"requirement": {"trigger": "minecraft:impossible", "conditions": {}}}},
		"ultimate_boss_ez": {"display": {"icon": def_to_icon("ultimate_dragon_egg"), "title": {"text": "Star Fighter"}, "description": {"text": "Defeat the Ultimate Boss\\nby taking less than 10 hearts of damage", "color": "green"}, "frame": "challenge", "hidden": True}, "parent": f"{ns}:visible/adventure/ultimate_boss", "criteria": {"requirement": {"trigger": "minecraft:impossible", "conditions": {}}}},

		# Equipments advancements
		# TODO

		# Technology advancements
		# TODO
	}

	# TODO: enchant dragon egg for ultimate_boss_ez

	# Add default display options
	display_options: dict[str, bool | str] = {"frame": "task", "show_toast": True, "announce_to_chat": True, "hidden": False}
	for advancement in advancements.values():
		for key, value in display_options.items():
			if not advancement.get("display", {}).get(key):
				advancement["display"][key] = value


	# For each advancement,
	for item, adv in advancements.items():
		data: JsonDict = Mem.definitions.get(item, {})
		advancement: dict[str, Any] = {"display":{}, "criteria": {}, "requirements": [["requirement"]]}

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
		Mem.ctx.data[ns].advancements[f"visible/{item}"] = set_json_encoder(Advancement(advancement), max_level = 7)

	return

