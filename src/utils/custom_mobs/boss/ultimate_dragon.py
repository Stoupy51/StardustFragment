
# Imports
import json

from stewbeet import (
	COMMON_SIGNAL,
	Advancement,
	Conventions,
	JsonDict,
	LootTable,
	Mem,
	rainbow_gradient_text,
	set_json_encoder,
	write_function,
	write_load_file,
	write_versioned_function,
)

from ...common import STARFRAG_TEXT


# Setup boss mob: Ultimate Dragon
def main() -> None:
	DRAGON_MAX_HEALTH: int = 2048
	BOSSBAR_LIST: list[JsonDict] = rainbow_gradient_text("Ultimate Dragon")
	BOSSBAR_TEXT: str = json.dumps(BOSSBAR_LIST)
	ns: str = Mem.ctx.project_id

	# Load function
	write_load_file(f"""
# Ultimate Dragon bossbar & objective for throwing lingering potions
scoreboard objectives add {ns}.lingering_potion minecraft.used:minecraft.lingering_potion
bossbar add {ns}:ultimate_dragon {BOSSBAR_TEXT}
bossbar set {ns}:ultimate_dragon name {BOSSBAR_TEXT}
bossbar set {ns}:ultimate_dragon style notched_20
bossbar set {ns}:ultimate_dragon color yellow
bossbar set {ns}:ultimate_dragon max {DRAGON_MAX_HEALTH}
""", prepend=True)
	write_versioned_function("minute", f"""
# Remove bossbar
bossbar set {ns}:ultimate_dragon players
""")

	# Consume Ultimate Dragon Essence to summon Ultimate Dragon
	Mem.ctx.data[ns].advancements["technical/used_lingering_potion"] = set_json_encoder(Advancement({
		"criteria": {
			"requirements": {
				"trigger": "minecraft:tick",
				"conditions": {
					"player": [
						{
							"condition": "minecraft:entity_scores",
							"entity": "this",
							"scores": {f"{ns}.lingering_potion": {"min": 1}}
						}
					]
				}
			}
		},
		"rewards": {
			"function": f"{ns}:advancements/used_lingering_potion"
		}
	}), max_level=-1)
	write_function(f"{ns}:advancements/used_lingering_potion", f"""
# Revoke advancement
advancement revoke @s only {ns}:technical/used_lingering_potion
scoreboard players reset @s {ns}.lingering_potion

# Run summon essence function
execute as @e[type=minecraft:lingering_potion,tag=!{ns}.potion_checked] if data entity @s Item.components."minecraft:custom_data".{ns}.ultimate_dragon_essence run function {ns}:mobs/ultimate_dragon/essence/on_new_lingering_potion
""")  # noqa: E501
	write_function(f"{ns}:mobs/ultimate_dragon/essence/on_new_lingering_potion", f"""
# Add checked tag
tag @s add {ns}.potion_checked

# Add a passenger item_display to track when it lands
tag @s add {ns}.temp
execute summon item_display run function {ns}:mobs/ultimate_dragon/essence/add_passenger
tag @s remove {ns}.temp

# Start a schedule to check when it lands
schedule function {ns}:mobs/ultimate_dragon/essence/check_landing 1t append
""")
	write_function(f"{ns}:mobs/ultimate_dragon/essence/add_passenger", f"""
# Ride the lingering potion
ride @s mount @n[tag={ns}.temp]

# Add tags
{"\n".join([f"tag @s add {tag}" for tag in Conventions.ENTITY_TAGS_NO_KILL])}
tag @s add {ns}.check_ultimate_dragon_essence
""")

	# Check if lingering potion has landed
	write_function(f"{ns}:mobs/ultimate_dragon/essence/check_landing", f"""
# Check if lingering potion has landed (no vehicle)
scoreboard players set #remaining_potions {ns}.data 0
execute as @e[type=minecraft:lingering_potion,tag={ns}.check_ultimate_dragon_essence] run function {ns}:mobs/ultimate_dragon/essence/check_single_landing

# If any remaining potions, reschedule check
execute if score #remaining_potions {ns}.data matches 1.. run schedule function {ns}:mobs/ultimate_dragon/essence/check_landing 1t replace
""")
	write_function(f"{ns}:mobs/ultimate_dragon/essence/check_single_landing", f"""
# If vehicle is not gone, still flying (return)
execute on vehicle run return run scoreboard players add #remaining_potions {ns}.data 1

# Else, has landed, proceed to next step
function {ns}:mobs/ultimate_dragon/essence/has_landed
""")
	# TODO: Landed behavior (summon Ultimate Dragon or not depending on dimension)
	return

	write_function(f"{ns}:mobs/ultimate_dragon/essence/reached_max_size", f"""
# Tellraw, playsound, and particles
tellraw @a[distance=..128] ["",{STARFRAG_TEXT},{{"text":" An "}},{BOSSBAR_TEXT},{{"text":" has been summoned!"}}]
execute as @a[distance=..128] at @s run playsound {ns}:wolf_howl ambient @s
particle minecraft:enchant ~ ~ ~ 0.5 0.5 0.5 0.5 500

# Summon Ultimate Dragon at world surface
#execute positioned over world_surface run function {ns}:mobs/ultimate_dragon/summon
""")

	# Ultimate Dragon conversion
	write_function(f"{ns}:mobs/ultimate_dragon/summon", f"execute summon minecraft:ender_dragon run function {ns}:mobs/ultimate_dragon/convert")
	write_function(f"{ns}:mobs/ultimate_dragon/convert", f"""
# Modify wolf type
data modify entity @s variant set value "minecraft:woods"

# Add tags & join team
{"\n".join([f"tag @s add {tag}" for tag in Conventions.ENTITY_TAGS])}
tag @s add {ns}.ultimate_dragon
tag @s add {ns}.mob_entity
tag @s add {ns}.update_health
team join {ns}.mob @s

# Mark as new mob for setup
tag @s add {ns}.new_mob

# Wolf armor and loot table
item replace entity @s armor.feet with minecraft:stone[equippable={{"slot":"feet"}},attribute_modifiers=[{{"type":"minecraft:max_health","amount":{DRAGON_MAX_HEALTH},"id":"{ns}:armor.body","operation":"add_value","slot":"feet"}}],{COMMON_SIGNAL}]
data modify entity @s DeathLootTable set value "{ns}:entities/ultimate_dragon"

# Set attributes (x2 damage, 0.9x scale, 10 knockback resistance)
attribute @s minecraft:attack_damage modifier add {ns}:damage_scale 1 add_multiplied_base
attribute @s minecraft:scale base set 0.9
attribute @s minecraft:knockback_resistance base set 10.0
effect give @s minecraft:regeneration 5 255 true

# Set custom name and other properties
data modify entity @s CustomName set value {{"text":"Ultimate Dragon","color":"white"}}
data modify entity @s PersistenceRequired set value true

# Create visual model
scoreboard players set #base_scale {ns}.data 0
execute summon item_display run function {ns}:mobs/create_model {{"entity":"ultimate_dragon"}}

# Setup bossbar
bossbar set {ns}:ultimate_dragon name {BOSSBAR_TEXT}
bossbar set {ns}:ultimate_dragon value {DRAGON_MAX_HEALTH}

# Remove new_mob tag after setup
tag @s remove {ns}.new_mob
""")  # noqa: E501

	# Mob looping behavior
	write_function(f"{ns}:mobs/loop/mob_second", f"execute if entity @s[tag={ns}.ultimate_dragon] run return run function {ns}:mobs/ultimate_dragon/second")

	# Ultimate Dragon's looping behavior
	write_function(f"{ns}:mobs/ultimate_dragon/second",
f"""
# If update health, set health to max
execute if entity @s[tag={ns}.update_health] run data modify entity @s Health set value {DRAGON_MAX_HEALTH}
tag @s remove {ns}.update_health

# High step height and jump boost to prevent getting stuck
attribute @s minecraft:step_height base set 16.0
effect give @s minecraft:jump_boost 10 4 true

# Always on world surface
execute positioned over world_surface run tp @s ~ ~ ~

# Particles
particle enchant ~ ~ ~ 2 2 2 0 10

# Set bossbar for nearby players & update value
bossbar set {ns}:ultimate_dragon visible true
bossbar set {ns}:ultimate_dragon players @a[distance=..200]
execute store result bossbar {ns}:ultimate_dragon value run data get entity @s Health

# Glowing only if no players nearby
data modify entity @s Glowing set value false
execute unless entity @a[gamemode=!spectator,distance=..15] run data modify entity @s Glowing set value true
""")

	# Each time Ultimate Dragon is hurt, summon a wolf wave
	write_function(f"{ns}:mobs/loop/display", f"""
# If Ultimate Dragon, and hurt, summon ally wolf
execute if entity @s[tag={ns}.ultimate_dragon] if score @s {ns}.hurt_time matches 1 run function {ns}:mobs/ultimate_dragon/summon_wave
""")

	# Summon wave of ally wolves
	write_function(f"{ns}:mobs/ultimate_dragon/summon_wave", f"""
# Summon 4 wolves around Ultimate Dragon
execute positioned ~1 ~ ~ run function {ns}:mobs/ultimate_dragon/summon_mob
execute positioned ~-1 ~ ~ run function {ns}:mobs/ultimate_dragon/summon_mob
execute positioned ~ ~ ~1 run function {ns}:mobs/ultimate_dragon/summon_mob
execute positioned ~ ~ ~-1 run function {ns}:mobs/ultimate_dragon/summon_mob
""")

	# Summon mob function
	write_function(f"{ns}:mobs/ultimate_dragon/summon_mob", f"""
# Particles
particle minecraft:enchant ~ ~ ~ 0.5 0.5 0.5 0.05 25

# Summon a wolf
execute positioned ~ ~-2 ~ summon minecraft:wolf run return run function {ns}:mobs/ultimate_dragon/on_new_wolf
""")
	write_function(f"{ns}:mobs/ultimate_dragon/on_new_wolf", f"""
# Delay spawn function
function {ns}:mobs/delay/spawn

# Set loot table
data modify entity @s DeathLootTable set value "{ns}:entities/ultimate_dragon"
""")

	# Death function
	write_function(f"{ns}:mobs/display/start_dying", f"""
# If Ultimate Dragon, run death function
execute if entity @s[tag={ns}.ultimate_dragon] run function {ns}:mobs/ultimate_dragon/death
""")
	write_function(f"{ns}:mobs/ultimate_dragon/death", f"""
# Remove bossbar (from all players)
bossbar set {ns}:ultimate_dragon players

# Tellraw and playsound
tellraw @a[distance=..50] ["",{STARFRAG_TEXT},{{"text":" The "}},{BOSSBAR_TEXT},{{"text":" has been defeated!"}}]
playsound minecraft:entity.wolf_angry.death hostile @a[distance=..50]
""")

	# Loot table
	Mem.ctx.data[ns].loot_tables["entities/ultimate_dragon"] = set_json_encoder(LootTable({
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
	Mem.ctx.data[ns].loot_tables["entities/ultimate_dragon"] = set_json_encoder(LootTable({
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

