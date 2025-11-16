
# Imports
import json

from stewbeet import (
	COMMON_SIGNAL,
	Advancement,
	Conventions,
	JsonDict,
	LootTable,
	Mem,
	create_gradient_text,
	set_json_encoder,
	write_function,
	write_load_file,
)

from ...common import STARFRAG_TEXT


# Setup boss mob: Stoup Army
def main() -> None:
	STOUPY_MAX_HEALTH: int = 250
	BOSSBAR_LIST: list[JsonDict] = create_gradient_text("Stoup Army", "743D2B", "C68863")
	BOSSBAR_TEXT: str = json.dumps(BOSSBAR_LIST)
	ns: str = Mem.ctx.project_id

	# Load function
	write_load_file(f"""
# Stoup Army bossbar
bossbar add {ns}:stoup_army {BOSSBAR_TEXT}
bossbar set {ns}:stoup_army name {BOSSBAR_TEXT}
bossbar set {ns}:stoup_army style notched_6
bossbar set {ns}:stoup_army color white
bossbar set {ns}:stoup_army max {STOUPY_MAX_HEALTH}
""", prepend=True)
	write_function(f"{ns}:mobs/remove_bossbars", f"bossbar set {ns}:stoup_army players")

	# Consume StoupEgg item to summon Stoup Army
	Mem.ctx.data[ns].advancements["technical/consume_stoupegg"] = set_json_encoder(Advancement({
		"criteria": {
			"requirements": {
				"trigger": "minecraft:consume_item",
				"conditions": {
					"item": {
						"predicates": {
							"minecraft:custom_data": {ns: {"stoupegg": True}}
						}
					}
				}
			}
		},
		"rewards": {
			"function": f"{ns}:advancements/consume_stoupegg"
		}
	}), max_level=-1)
	write_function(f"{ns}:advancements/consume_stoupegg", f"""
# Revoke advancement
advancement revoke @s only {ns}:technical/consume_stoupegg

# Tellraw, playsound, and particles
tellraw @a[distance=..128] ["",{STARFRAG_TEXT},{{"text":" A "}},{BOSSBAR_TEXT},{{"text":" has been summoned!"}}]
execute as @a[distance=..128] at @s run playsound {ns}:wolf_howl ambient @s
particle minecraft:enchant ~ ~ ~ 0.5 0.5 0.5 0.5 500

# Summon Stoupy at world surface
execute positioned over world_surface run function {ns}:mobs/stoupy/summon

# Summon 5 waves of ally wolves
execute positioned over world_surface run function {ns}:mobs/stoupy/summon_wave
execute positioned over world_surface run function {ns}:mobs/stoupy/summon_wave
execute positioned over world_surface run function {ns}:mobs/stoupy/summon_wave
execute positioned over world_surface run function {ns}:mobs/stoupy/summon_wave
execute positioned over world_surface run function {ns}:mobs/stoupy/summon_wave
""")

	# Stoupy conversion
	write_function(f"{ns}:mobs/stoupy/summon", f"execute summon minecraft:wolf run function {ns}:mobs/stoupy/convert")
	write_function(f"{ns}:mobs/stoupy/convert", f"""
# Modify wolf type
data modify entity @s variant set value "minecraft:woods"

# Add tags & join team
{"\n".join([f"tag @s add {tag}" for tag in Conventions.ENTITY_TAGS])}
tag @s add {ns}.stoupy
tag @s add {ns}.mob_entity
tag @s add {ns}.update_health
team join {ns}.mob @s

# Mark as new mob for setup
tag @s add {ns}.new_mob

# Wolf armor and loot table
item replace entity @s armor.feet with minecraft:stone[equippable={{"slot":"feet"}},attribute_modifiers=[{{"type":"minecraft:max_health","amount":{STOUPY_MAX_HEALTH},"id":"{ns}:armor.body","operation":"add_value","slot":"feet"}}],{COMMON_SIGNAL}]
data modify entity @s DeathLootTable set value "{ns}:entities/stoupy"

# Set attributes (x2 damage, 0.9x scale, 10 knockback resistance)
attribute @s minecraft:attack_damage modifier add {ns}:damage_scale 1 add_multiplied_base
attribute @s minecraft:scale base set 0.9
attribute @s minecraft:knockback_resistance base set 10.0
effect give @s minecraft:regeneration 5 255 true

# Set custom name and other properties
data modify entity @s CustomName set value {{"text":"Stoupy","color":"white"}}
data modify entity @s PersistenceRequired set value true

# Create visual model
scoreboard players set #base_scale {ns}.data 0
execute summon item_display run function {ns}:mobs/create_model {{"entity":"stoupy"}}

# Setup bossbar
bossbar set {ns}:stoup_army name {BOSSBAR_TEXT}
bossbar set {ns}:stoup_army value {STOUPY_MAX_HEALTH}

# Remove new_mob tag after setup
tag @s remove {ns}.new_mob
""")  # noqa: E501

	# Mob looping behavior
	write_function(f"{ns}:mobs/loop/mob_second", f"execute if entity @s[tag={ns}.stoupy] run return run function {ns}:mobs/stoupy/second")

	# Stoupy's looping behavior
	write_function(f"{ns}:mobs/stoupy/second",
f"""
# If update health, set health to max
execute if entity @s[tag={ns}.update_health] run data modify entity @s Health set value {STOUPY_MAX_HEALTH}
tag @s remove {ns}.update_health

# High step height and jump boost to prevent getting stuck
attribute @s minecraft:step_height base set 16.0
effect give @s minecraft:jump_boost 10 4 true

# Always on world surface
execute positioned over world_surface run tp @s ~ ~ ~

# Particles
particle enchant ~ ~ ~ 2 2 2 0 10

# Set bossbar for nearby players & update value
bossbar set {ns}:stoup_army visible true
bossbar set {ns}:stoup_army players @a[distance=..200]
execute store result bossbar {ns}:stoup_army value run data get entity @s Health

# Glowing only if no players nearby
data modify entity @s Glowing set value false
execute unless entity @a[gamemode=!spectator,distance=..15] run data modify entity @s Glowing set value true
""")

	# Each time Stoupy is hurt, summon a wolf wave
	write_function(f"{ns}:mobs/loop/display", f"""
# If Stoupy, and hurt, summon ally wolf
execute if entity @s[tag={ns}.stoupy] if score @s {ns}.hurt_time matches 1 run function {ns}:mobs/stoupy/summon_wave
""")

	# Summon wave of ally wolves
	write_function(f"{ns}:mobs/stoupy/summon_wave", f"""
# Summon 4 wolves around Stoupy
execute positioned ~1 ~ ~ run function {ns}:mobs/stoupy/summon_mob
execute positioned ~-1 ~ ~ run function {ns}:mobs/stoupy/summon_mob
execute positioned ~ ~ ~1 run function {ns}:mobs/stoupy/summon_mob
execute positioned ~ ~ ~-1 run function {ns}:mobs/stoupy/summon_mob
""")

	# Summon mob function
	write_function(f"{ns}:mobs/stoupy/summon_mob", f"""
# Particles
particle minecraft:enchant ~ ~ ~ 0.5 0.5 0.5 0.05 25

# Summon a wolf
execute positioned ~ ~-2 ~ summon minecraft:wolf run return run function {ns}:mobs/stoupy/on_new_wolf
""")
	write_function(f"{ns}:mobs/stoupy/on_new_wolf", f"""
# Delay spawn function
function {ns}:mobs/delay/spawn

# Set loot table
data modify entity @s DeathLootTable set value "{ns}:entities/stoup_army"
""")

	# Death function
	write_function(f"{ns}:mobs/display/start_dying", f"""
# If Stoupy, run death function
execute if entity @s[tag={ns}.stoupy] run function {ns}:mobs/stoupy/death
""")
	write_function(f"{ns}:mobs/stoupy/death", f"""
# Remove bossbar (from all players)
bossbar set {ns}:stoup_army players

# Tellraw and playsound
tellraw @a[distance=..50] ["",{STARFRAG_TEXT},{{"text":" The "}},{BOSSBAR_TEXT},{{"text":" has been defeated!"}}]
playsound minecraft:entity.wolf_angry.death hostile @a[distance=..50]
""")

	# Loot table
	Mem.ctx.data[ns].loot_tables["entities/stoupy"] = set_json_encoder(LootTable({
		"type": "minecraft:entity",
		"pools": [
			{
				"rolls": 1,
				"bonus_rolls": 0,
				"entries": [
					{
						"type": "minecraft:loot_table",
						"value": f"{ns}:i/triple_compressed_cobblestone",
						"functions": [
							{
								"function": "minecraft:set_count",
								"count": {
									"type": "minecraft:uniform",
									"min": 12,
									"max": 24
								}
							}
						]
					}
				],
				"conditions": [
					{
						"condition": "minecraft:killed_by_player"
					}
				]
			},
			{
				"rolls": 1,
				"entries": [
					{
						"type": "minecraft:loot_table",
						"value": f"{ns}:i/stardust_ingot",
						"functions": [
							{
								"function": "minecraft:set_count",
								"count": {
									"type": "minecraft:uniform",
									"min": 1,
									"max": 8
								}
							}
						]
					}
				],
				"conditions": [
					{
						"condition": "minecraft:killed_by_player"
					},
					{
						"condition": "minecraft:random_chance",
						"chance": 0.5
					}
				]
			},
			{
				"rolls": 1,
				"entries": [
					{
						"type": "minecraft:item",
						"name": "minecraft:diamond_block",
						"functions": [
							{
								"function": "minecraft:set_count",
								"count": {
									"type": "minecraft:uniform",
									"min": 1,
									"max": 16
								}
							}
						]
					}
				],
				"conditions": [
					{
						"condition": "minecraft:killed_by_player"
					},
					{
						"condition": "minecraft:random_chance",
						"chance": 0.25
					}
				]
			}
		]
	}), max_level=-1)
	Mem.ctx.data[ns].loot_tables["entities/stoup_army"] = set_json_encoder(LootTable({
		"type": "minecraft:entity",
		"pools": [
			{
				"rolls": 1,
				"bonus_rolls": 0,
				"entries": [
					{
						"type": "minecraft:loot_table",
						"value": f"{ns}:i/stardust_fragment",
						"functions": [
							{
								"function": "minecraft:set_count",
								"count": {
									"type": "minecraft:uniform",
									"min": 0,
									"max": 15
								}
							},
							{
								"function": "minecraft:enchanted_count_increase",
								"count": {
									"min": 0,
									"max": 15
								},
								"enchantment": "minecraft:looting"
							}
						]
					}
				],
				"conditions": [
					{
						"condition": "minecraft:killed_by_player"
					}
				]
			}
		]
	}), max_level=-1)

