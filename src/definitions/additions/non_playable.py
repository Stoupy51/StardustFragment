
# ruff: noqa: E501
# Imports

import stouputils as stp
from stewbeet import (
	CATEGORY,
	CUSTOM_ITEM_VANILLA,
	OVERRIDE_MODEL,
	WIKI_COMPONENT,
	JsonDict,
	Mem,
	rainbow_gradient_text,
)

# Constants
ROOT: str = stp.get_root_path(__file__)
MOBS_MODELS_PATH: str = f"{ROOT}/mobs"
STARDUST_BAT_MODEL: JsonDict = stp.json_load(f"{MOBS_MODELS_PATH}/stardust_bat.json")
STARDUST_EVOKER_MODEL: JsonDict = stp.json_load(f"{MOBS_MODELS_PATH}/stardust_evoker.json")
STARDUST_GUARDIAN_MODEL: JsonDict = stp.json_load(f"{MOBS_MODELS_PATH}/stardust_guardian.json")
STARDUST_PILLAR_MODEL: JsonDict = stp.json_load(f"{MOBS_MODELS_PATH}/stardust_pillar.json")
STARDUST_SOLDIER_MODEL: JsonDict = stp.json_load(f"{MOBS_MODELS_PATH}/stardust_soldier.json")
# Main function
def main_additions() -> None:
	ns: str = Mem.ctx.project_id

	# Proper textures
	STARDUST_BAT_MODEL["textures"] = {"0":f"{ns}:item/stardust_bat","particle":f"{ns}:item/stardust_bat"}
	STARDUST_EVOKER_MODEL["textures"] = {"0":f"{ns}:item/stardust_evoker","particle":f"{ns}:item/stardust_evoker"}
	STARDUST_GUARDIAN_MODEL["textures"] = {"0":f"{ns}:item/stardust_guardian","particle":f"{ns}:item/stardust_guardian"}
	STARDUST_PILLAR_MODEL["textures"] = {"0":f"{ns}:item/stardust_pillar","particle":f"{ns}:item/stardust_pillar"}
	STARDUST_SOLDIER_MODEL["textures"] = {"0":f"{ns}:item/stardust_soldier","particle":f"{ns}:item/stardust_soldier"}

	# Give Additional data for every item
	additions: dict[str, JsonDict] = {

		# Mobs
		"stardust_soldier": {
			"id": CUSTOM_ITEM_VANILLA, CATEGORY: "mobs",
			OVERRIDE_MODEL: STARDUST_SOLDIER_MODEL,
			WIKI_COMPONENT: [
				{"text":"Stardust Soldier","color":"yellow"},
				{"text":"\nFound in the Stardust Dimension","color":"gray"},
				{"text":"\nCan be summoned by the Stardust Pillar","color":"gray"},
				{"text":"\n\nStats (compared to a vanilla Skeleton):","color":"aqua"},
				{"text":"\n➤ Health: ","color":"gray"}, {"text":"x2","color":"red"},
				{"text":"\n➤ Damage: ","color":"gray"}, {"text":"x3","color":"red"},
				{"text":"\n➤ Speed: ","color":"gray"}, {"text":"x1.25","color":"green"},
			],
		},
		"stardust_evoker": {
			"id": CUSTOM_ITEM_VANILLA, CATEGORY: "mobs",
			OVERRIDE_MODEL: STARDUST_EVOKER_MODEL,
			WIKI_COMPONENT: [
				{"text":"Stardust Evoker","color":"yellow"},
				{"text":"\nFound in the Stardust Dimension","color":"gray"},
				{"text":"\nCan be summoned by the Stardust Pillar","color":"gray"},
				{"text":"\n\nStats (compared to a vanilla Evoker):","color":"aqua"},
				{"text":"\n➤ Health: ","color":"gray"}, {"text":"x2","color":"red"},
				{"text":"\n➤ Damage: ","color":"gray"}, {"text":"x3","color":"red"},
				{"text":"\n➤ Speed: ","color":"gray"}, {"text":"x1.25","color":"green"},
			],
		},
		"stardust_bat": {
			"id": CUSTOM_ITEM_VANILLA, CATEGORY: "mobs",
			OVERRIDE_MODEL: STARDUST_BAT_MODEL,
			WIKI_COMPONENT: [
				{"text":"Stardust Bat","color":"yellow"},
				{"text":"\nFound in the Stardust Dimension","color":"gray"},
				{"text":"\nCan be summoned by the Stardust Pillar","color":"gray"},
				{"text":r"\n10% chance to summon lightning per second","color":"gray"},
				{"text":"\n\nStats (compared to a vanilla Bat):","color":"aqua"},
				{"text":"\n➤ Health: ","color":"gray"}, {"text":"x2","color":"red"},
				{"text":"\n➤ Damage: ","color":"gray"}, {"text":"x3","color":"red"},
				{"text":"\n➤ Speed: ","color":"gray"}, {"text":"x1.25","color":"green"},
			],
		},
		"stardust_pillar": {
			"id": CUSTOM_ITEM_VANILLA, CATEGORY: "mobs",
			OVERRIDE_MODEL: STARDUST_PILLAR_MODEL,
			WIKI_COMPONENT: [
				{"text":"Stardust Pillar","color":"yellow"},
				{"text":"\nBoss mob with active shield (Resistance V)","color":"gray"},
				{"text":"\nSummons waves of 5 mobs every 5 seconds","color":"gray"},
				{"text":"\nEach wave summoned reduces shield by 5 HP","color":"gray"},
				{"text":"\nMax mobs: 20 + 5 per player (within 96 blocks)","color":"gray"},
				{"text":"\nLoses shield and charges at players below 250 HP","color":"gray"},
				{"text":"\n\nStats (compared to a vanilla Vex):","color":"aqua"},
				{"text":"\n➤ Health: ","color":"gray"}, {"text":"500 points","color":"red"},
				{"text":"\n➤ Damage: ","color":"gray"}, {"text":"x3","color":"red"},
				{"text":"\n➤ Scale: ","color":"gray"}, {"text":"x5","color":"green"},
				{"text":"\n➤ NoAI: ","color":"gray"}, {"text":"true (until shield breaks)","color":"aqua"},
			],
		},
		"stardust_guardian": {
			"id": CUSTOM_ITEM_VANILLA, CATEGORY: "mobs",
			OVERRIDE_MODEL: STARDUST_GUARDIAN_MODEL,
			WIKI_COMPONENT: [
				{"text":"Stardust Guardian","color":"yellow"},
				{"text":"\nBoss that summons waves at half health (512 HP)","color":"gray"},
				{"text":"\nSummons 25 mobs in a circle around each player","color":"gray"},
				{"text":"\nGlows when no players are within 15 blocks","color":"gray"},
				{"text":"\nSummoned mobs: Skeleton, Magma Cube, Piglin Brute","color":"gray"},
				{"text":"\n\nStats (compared to a vanilla Skeleton):","color":"aqua"},
				{"text":"\n➤ Health: ","color":"gray"}, {"text":"1024 points","color":"red"},
				{"text":"\n➤ Damage: ","color":"gray"}, {"text":"x3","color":"red"},
				{"text":"\n➤ Scale: ","color":"gray"}, {"text":"x1.5","color":"green"},
				{"text":"\n➤ Knockback Resistance: ","color":"gray"}, {"text":"10","color":"aqua"},
			],
		},

		# GUI Items
		**{item: {"id": CUSTOM_ITEM_VANILLA} for item in ("quarry_placeholder_configurator", "quarry_placeholder_module", "quarry_placeholder_force_load", "quarry_information")},

		# Others
		"ultimate_poop": {"id": CUSTOM_ITEM_VANILLA, "item_name": rainbow_gradient_text("Ultimate Poop"), OVERRIDE_MODEL: {"parent":"minecraft:block/cube_all","textures":{"all":f"{ns}:item/rainbow","particle":f"{ns}:item/rainbow"},"elements":[{"name":"face","from":[2,2,0],"to":[14,14,16],"faces":{"north":{"uv":[0,0,1,1],"texture":"#all"},"east":{"uv":[0,0,1,1],"texture":"#all"},"south":{"uv":[0,0,1,1],"texture":"#all"},"west":{"uv":[0,0,1,1],"texture":"#all"},"up":{"uv":[0,0,1,1],"texture":"#all"},"down":{"uv":[0,0,1,1],"texture":"#all"}}},{"name":"face","from":[4,4,-2],"to":[12,12,18],"faces":{"north":{"uv":[0,0,1,1],"texture":"#all"},"east":{"uv":[0,0,1,1],"texture":"#all"},"south":{"uv":[0,0,1,1],"texture":"#all"},"west":{"uv":[0,0,1,1],"texture":"#all"},"up":{"uv":[0,0,1,1],"texture":"#all"},"down":{"uv":[0,0,1,1],"texture":"#all"}}},{"name":"face","from":[0,2,2],"to":[16,14,14],"faces":{"north":{"uv":[0,0,1,1],"texture":"#all"},"east":{"uv":[0,0,1,1],"texture":"#all"},"south":{"uv":[0,0,1,1],"texture":"#all"},"west":{"uv":[0,0,1,1],"texture":"#all"},"up":{"uv":[0,0,1,1],"rotation":90,"texture":"#all"},"down":{"uv":[0,0,1,1],"rotation":270,"texture":"#all"}}},{"name":"face","from":[-2,4,4],"to":[18,12,12],"faces":{"north":{"uv":[0,0,1,1],"texture":"#all"},"east":{"uv":[0,0,1,1],"texture":"#all"},"south":{"uv":[0,0,1,1],"texture":"#all"},"west":{"uv":[0,0,1,1],"texture":"#all"},"up":{"uv":[0,0,1,1],"rotation":90,"texture":"#all"},"down":{"uv":[0,0,1,1],"rotation":270,"texture":"#all"}}},{"name":"face","from":[2,0,2],"to":[14,16,14],"faces":{"north":{"uv":[0,0,1,1],"rotation":90,"texture":"#all"},"east":{"uv":[0,0,1,1],"rotation":180,"texture":"#all"},"south":{"uv":[0,0,1,1],"rotation":270,"texture":"#all"},"west":{"uv":[0,0,1,1],"texture":"#all"},"up":{"uv":[0,0,1,1],"rotation":270,"texture":"#all"},"down":{"uv":[0,0,1,1],"rotation":270,"texture":"#all"}}},{"name":"face","from":[4,-2,4],"to":[12,18,12],"faces":{"north":{"uv":[0,0,1,1],"rotation":90,"texture":"#all"},"east":{"uv":[0,0,1,1],"rotation":180,"texture":"#all"},"south":{"uv":[0,0,1,1],"rotation":270,"texture":"#all"},"west":{"uv":[0,0,1,1],"texture":"#all"},"up":{"uv":[0,0,1,1],"rotation":270,"texture":"#all"},"down":{"uv":[0,0,1,1],"rotation":270,"texture":"#all"}}}]}}
	}

	# Update the definitions with new data
	for k, v in additions.items():
		if k in Mem.definitions:
			Mem.definitions[k].update(v)
		else:
			Mem.definitions[k] = v

