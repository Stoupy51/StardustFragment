
# ruff: noqa: E501
# Imports
from typing import Any

from stewbeet import JsonDict, Mem, TextComponent, Texture, item_id_to_name, item_id_to_text_component, super_merge_dict, text_component_to_str, write_advancement
from stouputils.print import error

from ..definitions.additions.energy import QUARRY_STATS, quarry_display
from ..definitions.additions.equipments import ARTIFACTS, SNIPER_BULLETS, artifact_display
from ..definitions.additions.materials import COBBLESTONE_TIERS
from ..definitions.additions.miscellaneous import miner_display
from .common import ROMAN_NUMERALS, STARFRAG_LIST

# Constants
IMPOSSIBLE_CRITERIA: JsonDict = {"requirement": {"trigger": "minecraft:impossible", "conditions": {}}}

# Utility function to convert definition to icon
def def_to_icon(item: JsonDict | str, enchanted: bool = False) -> JsonDict:
	""" Convert a definition to an advancement icon.

	Args:
		data (JsonDict | str): Definition data or item name.
		enchanted (bool): Whether to add the enchanted glint effect.
	Returns:
		JsonDict: Advancement icon, e.g. {"id": "minecraft:stone", "components": {...}}
	"""
	if isinstance(item, str):
		if item.startswith("minecraft:"):
			return {"id": item}
		data = Mem.definitions.get(item, {})
	else:
		data = item
	if not data:
		error(f"Definition for item '{item}' not found during def_to_icon conversion.")
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

def criteria_item(item: str) -> JsonDict:
	criteria: dict[str, Any] = {"requirement": {"trigger": "minecraft:inventory_changed","conditions": {"items": [{"predicates": {}}]}}}
	criteria["requirement"]["conditions"]["items"][0]["predicates"]["minecraft:custom_data"] = {Mem.ctx.project_id:{item:True}}
	return criteria

def default_description(item: str) -> TextComponent:
	text: TextComponent = item_id_to_text_component(item)
	name: str = text_component_to_str(text)
	obtain: str = "a " if (name[0].lower() not in "aeiou") else "an "
	if isinstance(text, str):
		return {"text": f"Obtain {obtain}{name}", "color": "green"}
	else:
		return [{"text": f"Obtain {obtain}", "color": "green"}, text]

def sort_dict(d: JsonDict, order: list[str]) -> JsonDict:
	return dict(sorted(d.items(), key=lambda x: order.index(x[0]) if x[0] in order else len(order)))


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
		"root": {"display": {"icon": def_to_icon("stardust_fragment"), "title": STARFRAG_LIST[1], "description": {"text": "What's this little blue thing?", "color": "green"}, "background": background},"criteria": criteria_item("stardust_fragment")},

		## Adventure advancements
		# Artifacts
		**{
			f"adventure/artifacts/{item}": {"display": {"title": {"text": f"Increasing {name} {roman}", "color": "aqua"}}, "parent": parent}
			for artifact, _, attribute, levels in ARTIFACTS
			for name in (attribute.replace("_", " ").title(),)
			for i in range(len(levels))
			for item, _, roman in (artifact_display(artifact, i),)
			for parent in (f"{ns}:visible/adventure/lucky_artifact_bag" if i == 0 else f"{ns}:visible/adventure/artifacts/{artifact_display(artifact, i-1)[0]}",)
		},

		# Seeds
		**{
			f"adventure/seeds/{seed_id}": {"display": {"title": {"text": title, "color": "aqua"}, "description": {"text": f"Admire this {item_id_to_name(seed_id)}", "color": "green"}}, "parent": parent}
			for i, (seed_id, title) in enumerate(SEEDS)
			for parent in (f"{ns}:visible/root" if i == 0 else f"{ns}:visible/adventure/seeds/{SEEDS[i-1][0]}",)
		},

		# Sniper bullets
		**{
			f"adventure/bullets/{bullet.replace('minecraft:', '')}": {"display": {"icon": icon, "title": {"text": title, "color": "aqua"}, "description": {"text": f"Shoot a {name} Bullet using a Sniper", "color": "green"}}, "parent": parent, "criteria": IMPOSSIBLE_CRITERIA}
			for i, bullet in enumerate(SNIPER_BULLETS.keys())
			for name in (item_id_to_name(bullet),)
			for title in (f"{name.split(' ')[0]} Bullets" if bullet != "stardust_fragment" else "Shooting Stars",)
			for icon in (def_to_icon(bullet),)
			for parent in (f"{ns}:visible/stuff/stardust_sniper" if i == 0 else f"{ns}:visible/adventure/bullets/{list(SNIPER_BULLETS.keys())[i-1].replace('minecraft:', '')}",)
		},

		# No subcategories
		"adventure/enter_cavern": {"display": {"icon": def_to_icon("cavern_portal"), "title": {"text": "Return to monke", "color": "aqua"}, "description": {"text": "Travel to the Cavern Dimension", "color": "green"}}, "parent": f"{ns}:visible/root","criteria": {"requirement": {"trigger": "minecraft:changed_dimension", "conditions": {"to": f"{ns}:cavern"}}}},
		"adventure/enter_celestial": {"display": {"icon": def_to_icon("celestial_portal"), "title": {"text": "Skyblock, isn't it?", "color": "aqua"}, "description": {"text": "Enter the Celestial Dimension", "color": "green"}}, "parent": f"{ns}:visible/adventure/enter_cavern", "criteria": {"requirement": {"trigger": "minecraft:changed_dimension", "conditions": {"to": f"{ns}:celestial"}}}},
		"adventure/enter_stardust_dungeon_dim": {"display": {"icon": def_to_icon("stardust_dungeon_portal"), "title": {"text": "A dimension, a dungeon", "color": "aqua"}, "description": {"text": "Enter the Stardust Dungeon Dimension", "color": "green"}}, "parent": f"{ns}:visible/adventure/enter_stardust", "criteria": {"requirement": {"trigger": "minecraft:changed_dimension", "conditions": {"to": f"{ns}:dungeon"}}}},
		"adventure/enter_stardust_dungeon": {"display": {"icon": def_to_icon("stardust_dungeon_key"), "title": {"text": "Entering the dungeon", "color": "aqua"}, "description": {"text": "Use a Stardust Dungeon Key", "color": "green"}}, "parent": f"{ns}:visible/adventure/enter_stardust_dungeon_dim", "criteria": IMPOSSIBLE_CRITERIA},
		"adventure/enter_stardust": {"display": {"icon": def_to_icon("stardust_portal"), "title": {"text": "Everythin's blue", "color": "aqua"}, "description": {"text": "Travel to the Stardust Dimension", "color": "green"}}, "parent": f"{ns}:visible/adventure/enter_celestial", "criteria": {"requirement": {"trigger": "minecraft:changed_dimension", "conditions": {"to": f"{ns}:stardust"}}}},
		"adventure/enter_ultimate": {"display": {"icon": def_to_icon("ultimate_portal"), "title": {"text": "The Ultimate Dimension", "color": "aqua"}, "description": {"text": "Travel to the Ultimate Dimension", "color": "green"}}, "parent": f"{ns}:visible/adventure/enter_stardust_dungeon_dim", "criteria": {"requirement": {"trigger": "minecraft:changed_dimension", "conditions": {"to": f"{ns}:ultimate"}}}},
		"adventure/falling_celestial": {"display": {"icon": {"id": "minecraft:feather"}, "title": {"text": "Where did I put my bucket?"}, "description": {"text": "Fall from the Celestial dimension", "color": "green"}, "frame": "challenge", "hidden": True}, "parent": f"{ns}:visible/adventure/enter_celestial", "criteria": IMPOSSIBLE_CRITERIA},
		"adventure/falling_stardust": {"display": {"icon": {"id": "minecraft:feather"}, "title": {"text": "I did it wrong"}, "description": {"text": "Fall from the Stardust dimension", "color": "green"}, "frame": "challenge", "hidden": True}, "parent": f"{ns}:visible/adventure/enter_stardust", "criteria": IMPOSSIBLE_CRITERIA},
		"adventure/lucky_artifact_bag": {"display": {"icon": def_to_icon("lucky_artifact_bag"), "title": {"text": "What am I going to take out?", "color": "aqua"}, "description": {"text": "Find a Lucky Artifact Bag", "color": "green"}}, "parent": f"{ns}:visible/root"},
		"adventure/multiple_ultimate_boss": {"display": {"icon": {"id": "minecraft:dragon_head"}, "title": {"text": "Numbers don't affraid me"}, "description": {"text": "Summon two Ultimate Boss at the same time", "color": "green"}, "frame": "challenge", "hidden": True}, "parent": f"{ns}:visible/adventure/ultimate_boss", "criteria": IMPOSSIBLE_CRITERIA},
		"adventure/stardust_guardian": {"display": {"icon": {"id": "minecraft:wither_skeleton_skull"}, "title": {"text": "Making another step", "color": "aqua"}, "description": {"text": "Kill the Stardust Guardian", "color": "green"}}, "parent": f"{ns}:visible/adventure/enter_stardust_dungeon", "criteria": IMPOSSIBLE_CRITERIA},
		"adventure/stardust_pillar": {"display": {"icon": def_to_icon("starlight_infuser"), "title": {"text": "A Stardust Pillar", "color": "aqua"}, "description": {"text": "Summon the Stardust Pillar", "color": "green"}}, "parent": f"{ns}:visible/adventure/enter_stardust", "criteria": IMPOSSIBLE_CRITERIA},
		"adventure/stoup_army": {"display": {"icon": def_to_icon("stoupegg"), "title": {"text": "Fighting a mini-boss", "color": "aqua"}, "description": {"text": "Fight against your first Stoup Army", "color": "green"}}, "parent": f"{ns}:visible/adventure/enter_cavern", "criteria": IMPOSSIBLE_CRITERIA},
		"adventure/summon_ultimate_boss": {"display": {"icon": def_to_icon("ultimate_dragon_essence"), "title": {"text": "A journey to the end", "color": "aqua"}, "description": {"text": "Summon the Ultimate Boss", "color": "green"}}, "parent": f"{ns}:visible/adventure/enter_ultimate", "criteria": IMPOSSIBLE_CRITERIA},
		"adventure/not_like_this": {"display": {"icon": def_to_icon("ultimate_dragon_essence", enchanted=True), "title": {"text": "Not Like This..."}, "description": {"text": "Loose an Ultimate Dragon Essence by not throwing it in the Ultimate Dimension", "color": "green"}, "frame": "challenge", "hidden": True}, "parent": f"{ns}:visible/adventure/enter_ultimate", "criteria": IMPOSSIBLE_CRITERIA},
		"adventure/ultimate_boss_ez": {"display": {"icon": def_to_icon("ultimate_dragon_egg", enchanted=True), "title": {"text": "Star Fighter"}, "description": {"text": "Defeat the Ultimate Boss\\nby taking less than 10 hearts of damage", "color": "green"}, "frame": "challenge", "hidden": True}, "parent": f"{ns}:visible/adventure/ultimate_boss", "criteria": IMPOSSIBLE_CRITERIA},
		"adventure/ultimate_boss": {"display": {"icon": def_to_icon("ultimate_dragon_egg"), "title": {"text": "Stard'End", "color": "aqua"}, "description": {"text": "Defeat the Ultimate Boss", "color": "green"}, "frame": "goal"}, "parent": f"{ns}:visible/adventure/summon_ultimate_boss", "criteria": IMPOSSIBLE_CRITERIA},
		"adventure/use_awakened_forge": {"display": {"icon": {"id": "minecraft:dragon_egg"}, "title": {"text": "A new crafting structure", "color": "aqua"}, "description": {"text": "Use the Awakened Forge", "color": "green"}}, "parent": f"{ns}:visible/root", "criteria": IMPOSSIBLE_CRITERIA},



		## Stuff advancements
		# Compressed cobblestones
		**{
			f"stuff/cobblestone/{tier}": {"display": {"icon": def_to_icon(f"{tier}_cobblestone"), "title": {"text": title, "color": "aqua"}, "description": default_description(f"{tier}_cobblestone"), "frame": frame}, "parent": parent, "criteria": criteria_item(f"{tier}_cobblestone")}
			for i, tier in enumerate(COBBLESTONE_TIERS)
			for title in (f"Compressing {ROMAN_NUMERALS[i]}" if i < (len(COBBLESTONE_TIERS) - 1) else "43,046,721",)
			for frame in ("task" if i < (len(COBBLESTONE_TIERS) - 1) else "challenge",)
			for parent in (f"{ns}:visible/root" if i == 0 else f"{ns}:visible/stuff/cobblestone/{COBBLESTONE_TIERS[i-1]}",)
		},
		# Cobblestone Miners
		**{
			f"stuff/miners/{item}": {"display": {"title": {"text": f"Rockraiser {roman}", "color": "aqua"}, "frame": frame}, "parent": parent}
			for i in range(8)
			for frame in ("task" if i < 7 else "challenge",)
			for item, _, roman in (miner_display(i),)
			for parent in (f"{ns}:visible/stuff/cobblestone/compressed" if i == 0 else f"{ns}:visible/stuff/miners/{miner_display(i-1)[0]}",)
		},

		# Armor & Tools
		**{
			f"stuff/{material}_equipment": {
				"display": { "icon": def_to_icon(f"{material}_chestplate"),
					"title": {"text": title, "color": "aqua"},
					"description": {"text": desc, "color": "green"},
				},
				"criteria": {
					"has_armor": {"trigger": "minecraft:inventory_changed","conditions": {
						"items": [{"predicates": {"minecraft:custom_data": {"smithed": {"dict": {"armor": {material: True}}}}}}]
					}},
					"has_tools": {"trigger": "minecraft:inventory_changed","conditions": {
						"items": [{"predicates": {"minecraft:custom_data": {"smithed": {"dict": {"tools": {material: True}}}}}}]
					}}
				},
				"requirements": [["has_armor", "has_tools"]],
				"parent": f"{ns}:visible/{parent}"
			}
			for material, title, desc, parent in [
				("ancient_stardust", "I think it was like it", "Upgrade a Diamond equipment into Ancient Stardust", "stuff/stardust_block"),
				("original_stardust", "Yup that's it!", "Use the power of a Stardust Core to craft an Original Stardust equipment", "stuff/stardust_core"),
				("legendarium", "Taking a breath", "Choose the Legendarium path", "stuff/legendarium_block"),
				("solarium", "Burning your soul", "Choose the Solarium path", "stuff/solarium_block"),
				("darkium", "Be aware of your shadow", "Choose the Darkium path", "stuff/darkium_block")
			]
		},

		# Bow & Snipers
		"stuff/stardust_bow": {"display": {"title": {"text": "Bowing like a pro I", "color": "aqua"}, "description": {"text": "Craft a Stardust Bow", "color": "green"}}, "parent": f"{ns}:visible/adventure/use_awakened_forge"},
		"stuff/awakened_stardust_bow": {"display": {"title": {"text": "Bowing like a pro II", "color": "aqua"}, "description": {"text": "Upgrade your Stardust Bow in its Awakened form", "color": "green"}}, "parent": f"{ns}:visible/stuff/stardust_bow"},
		"stuff/ultimate_bow": {"display": {"title": {"text": "Bowing like a pro III", "color": "aqua"}, "description": {"text": "Awaken the magic of the stars using the Ultimate Bow", "color": "green"}, "frame": "challenge"}, "parent": f"{ns}:visible/stuff/awakened_stardust_bow"},
		"stuff/stardust_sniper": {"display": {"title": {"text": "Trick Shot I", "color": "aqua"}, "description": {"text": "Craft a Stardust Sniper", "color": "green"}}, "parent": f"{ns}:visible/adventure/use_awakened_forge"},
		"stuff/awakened_stardust_sniper": {"display": {"title": {"text": "Trick Shot II", "color": "aqua"}, "description": {"text": "Upgrade your Stardust Sniper in its Awakened form", "color": "green"}}, "parent": f"{ns}:visible/stuff/stardust_sniper"},
		"stuff/ultimate_sniper": {"display": {"title": {"text": "Trick Shot III", "color": "aqua"}, "description": {"text": "A whisper before the storm of bullets coming from the Ultimate Sniper", "color": "green"}, "frame": "challenge"}, "parent": f"{ns}:visible/stuff/awakened_stardust_sniper"},

		# Remaining equipments
		"stuff/item_magnet": {"display": {"title": {"text": "I'm Attractive", "color": "aqua"}}, "parent": f"{ns}:visible/stuff/ultimate_shard"},
		"stuff/home_travel_staff": {"display": {"title": {"text": "I'm Out of There", "color": "aqua"}, "description": {"text": "Use a Travel Staff for the first time", "color": "green"}}, "parent": f"{ns}:visible/stuff/dragon_pearl"},
		"stuff/wormhole_potion": {"display": {"title": {"text": "Where are you my friend", "color": "aqua"}, "description": {"text": "Use a Wormhole Potion for the first time", "color": "green"}}, "parent": f"{ns}:visible/stuff/compacted_stardust_shard"},
		"stuff/stardust_apple": {"display": {"title": {"text": "Cosmic Apple", "color": "aqua"}}, "parent": f"{ns}:visible/root"},
		"stuff/life_crystal": {"display": {"title": {"text": "Increasing Health", "color": "aqua"}, "description": {"text": "Eat your first Life Crystal", "color": "green"}}, "parent": f"{ns}:visible/stuff/stardust_apple", "criteria": IMPOSSIBLE_CRITERIA},
		"stuff/life_crystal_max": {"display": {"icon": def_to_icon("life_crystal", enchanted=True), "title": {"text": "Two Health Bars!", "color": "aqua"}, "description": {"text": "Consume your 20th and final Life Crystal", "color": "green"}}, "parent": f"{ns}:visible/stuff/life_crystal", "criteria": IMPOSSIBLE_CRITERIA},

		# Other stuff
		"stuff/dragon_pearl": {"display": {"title": {"text": "Faster and Farther", "color": "aqua"}}, "parent": f"{ns}:visible/stuff/stardust_essence"},
		"stuff/ender_dragon_pearl": {"display": {"title": {"text": "Even Faster and Farther", "color": "aqua"}}, "parent": f"{ns}:visible/stuff/dragon_pearl"},
		"stuff/stardust_block": {"display": {"title": {"text": "Is that Stardust Diamond?", "color": "aqua"}}, "parent": f"{ns}:visible/stuff/stardust_ingot"},
		"stuff/compacted_stardust_shard": {"display": {"title": {"text": "A costly Stardust Material", "color": "aqua"}}, "parent": f"{ns}:visible/stuff/stardust_block"},
		"stuff/stardust_ingot": {"display": {"title": {"text": "I feel like it's useful", "color": "aqua"}}, "parent": f"{ns}:visible/root"},
		"stuff/stardust_essence": {"display": {"title": {"text": "Feeling the Power", "color": "aqua"}}, "parent": f"{ns}:visible/stuff/stardust_ingot"},
		"stuff/stardust_core": {"display": {"title": {"text": "Stardust Technology", "color": "aqua"}}, "parent": f"{ns}:visible/stuff/stardust_essence"},
		"stuff/awakened_stardust_block": {"display": {"title": {"text": "A respectful Block Type", "color": "aqua"}}, "parent": f"{ns}:visible/stuff/awakened_stardust"},
		"stuff/awakened_stardust": {"display": {"title": {"text": "Stardust Evolution", "color": "aqua"}}, "parent": f"{ns}:visible/stuff/stardust_essence"},
		"stuff/ultimate_shard": {"display": {"title": {"text": "A Burst of Energy", "color": "aqua"}}, "parent": f"{ns}:visible/stuff/compacted_stardust_shard"},
		**{
			f"stuff/{material}_{form}": {"display": {"title": {"text": f"{title} {ROMAN_NUMERALS[i]}", "color": "aqua"}}, "parent": parent}
			for material, title in [
				("legendarium", "Feeling the Breeze"),
				("solarium", "Feeling the Sun"),
				("darkium", "Feeling the Shadow")
			]
			for i, form in enumerate(("fragment", "ingot", "block"))
			for parent in (f"{ns}:visible/stuff/original_stardust_equipment" if i == 0 else f"{ns}:visible/stuff/{material}_{('fragment' if i == 1 else 'ingot')}",)
		},



		## Technology advancements
		"technology/simplenergy_manual": {"display": {"icon": {"id": "minecraft:book", "components": {"minecraft:item_model":"simplenergy:manual"}}, "title": {"text": "Tecnología", "color": "aqua"}, "description": {"text": "Following advancements are related to technology", "color": "green"},"frame":"goal","show_toast":False,"announce_to_chat":False}, "parent": f"{ns}:visible/root", "criteria": criteria_item("stardust_fragment")},
		"technology/stardust_cable": {"display": {"title": {"text": "Energy Transfer I", "color": "aqua"}}, "parent": f"{ns}:visible/technology/simplenergy_manual"},
		"technology/awakened_stardust_cable": {"display": {"title": {"text": "Energy Transfer II", "color": "aqua"}}, "parent": f"{ns}:visible/technology/stardust_cable"},
		"technology/ultimate_cable": {"display": {"title": {"text": "Energy Transfer III", "color": "aqua"}}, "parent": f"{ns}:visible/technology/awakened_stardust_cable"},
		"technology/stardust_battery": {"display": {"title": {"text": "Stardust Energy I", "color": "aqua"}}, "parent": f"{ns}:visible/technology/simplenergy_manual"},
		"technology/awakened_stardust_battery": {"display": {"title": {"text": "Stardust Energy II", "color": "aqua"}}, "parent": f"{ns}:visible/technology/stardust_battery"},
		"technology/ultimate_battery": {"display": {"title": {"text": "Stardust Energy III", "color": "aqua"}}, "parent": f"{ns}:visible/technology/awakened_stardust_battery"},
		"technology/stardust_solar_panel": {"display": {"title": {"text": "Greater Photosensitivity I", "color": "aqua"}}, "parent": f"{ns}:visible/technology/simplenergy_manual"},
		"technology/awakened_stardust_solar_panel": {"display": {"title": {"text": "Greater Photosensitivity II", "color": "aqua"}}, "parent": f"{ns}:visible/technology/stardust_solar_panel"},
		"technology/legendarium_solar_panel": {"display": {"title": {"text": "Breeze Photosensitivity", "color": "aqua"}}, "parent": f"{ns}:visible/technology/awakened_stardust_solar_panel"},
		"technology/solarium_solar_panel": {"display": {"title": {"text": "Burning Photosensitivity", "color": "aqua"}}, "parent": f"{ns}:visible/technology/legendarium_solar_panel"},
		"technology/darkium_solar_panel": {"display": {"title": {"text": "Anti-Photosensitivity", "color": "aqua"}}, "parent": f"{ns}:visible/technology/solarium_solar_panel"},
		"technology/ultimate_solar_panel": {"display": {"title": {"text": "Ultimate Photosensitivity", "color": "aqua"}}, "parent": f"{ns}:visible/technology/darkium_solar_panel"},
		"technology/quarry_configurator": {"display": {"title": {"text": "Control of the Mining Industry", "color": "aqua"}}, "parent": f"{ns}:visible/technology/simplenergy_manual"},
		**{
			f"technology/quarry/{item}": {"display": {"title": {"text": f"Mining Industry {roman}", "color": "aqua"}, "frame": frame}, "parent": parent}
			for i in range(len(QUARRY_STATS))
			for frame in ("task" if i < (len(QUARRY_STATS) - 1) else "challenge",)
			for item, _, roman in (quarry_display(i),)
			for parent in (f"{ns}:visible/technology/quarry_configurator" if i == 0 else f"{ns}:visible/technology/quarry/{quarry_display(i-1)[0]}",)
		},
		"technology/growth_accelerator": {"display": {"title": {"text": "Speeding up Nature", "color": "aqua"}}, "parent": f"{ns}:visible/technology/simplenergy_manual"},
		"technology/mob_grinder": {"display": {"title": {"text": "Automated Combat", "color": "aqua"}}, "parent": f"{ns}:visible/technology/growth_accelerator"},
		"technology/nether_star_generator": {"display": {"title": {"text": "Nether Star Power", "color": "aqua"}}, "parent": f"{ns}:visible/technology/mob_grinder"},
		"technology/advanced_furnace_generator": {"display": {"title": {"text": "Carbon Dioxide I", "color": "aqua"}}, "parent": f"{ns}:visible/technology/simplenergy_manual"},
		"technology/stardust_furnace_generator": {"display": {"title": {"text": "Carbon Dioxide II", "color": "aqua"}}, "parent": f"{ns}:visible/technology/advanced_furnace_generator"},
		"technology/awakened_stardust_furnace_generator": {"display": {"title": {"text": "Carbon Dioxide III", "color": "aqua"}}, "parent": f"{ns}:visible/technology/stardust_furnace_generator"},
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
		advancement: dict[str, Any] = {"display":{}, "criteria": {}, "requirements": []}

		# If challenge, remove color from title
		if adv.get("display", {}).get("frame") == "challenge":
			title = adv["display"].get("title", {})
			if isinstance(title, dict):
				title.pop("color", None) # type: ignore

		# Set icon
		if not adv.get("display", {}).get("icon"):
			advancement["display"]["icon"] = def_to_icon(item)

		# Set description, if not already set
		if not adv.get("display", {}).get("description"):
			advancement["display"]["description"] = default_description(item)

		# Set the criteria, if not already set
		if not adv.get("criteria"):
			advancement["criteria"] = criteria_item(item)

		# Set the requirements, if not already set
		if not adv.get("requirements"):
			advancement["requirements"] = [["requirement"]]

		# Merge the advancement with specific order
		advancement = super_merge_dict(advancement, adv)
		advancement["display"] = sort_dict(advancement["display"], ["icon", "title", "description", "background", "frame", "show_toast", "announce_to_chat", "hidden"])
		advancement = sort_dict(advancement, ["display", "criteria", "requirements", "rewards", "parent"])

		# Set the advancement
		write_advancement(f"{ns}:visible/{full_path}", advancement, max_level=7)

	return

