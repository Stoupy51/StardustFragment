
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
	write_versioned_function,
)

from ...common import STARFRAG_TEXT


# Setup boss mob: Stardust Pillar
def main() -> None:
	PILLAR_MAX_HEALTH: int = 500
	ACTIVE_LIST: list[JsonDict] = create_gradient_text("Stardust Pillar (Active Shield)", "198534", "249d9f")
	NO_SHIELD_LIST: list[JsonDict] = ACTIVE_LIST[:len("Stardust Pillar")]	# Shorten to just the name
	BOSSBAR_ACTIVE_SHIELD_TEXT: str = json.dumps(ACTIVE_LIST)
	BOSSBAR_NO_SHIELD_TEXT: str = json.dumps(NO_SHIELD_LIST)
	ns: str = Mem.ctx.project_id

	# Load function
	write_load_file(f"""
# Stardust Pillar bossbar
bossbar add {ns}:stardust_pillar {BOSSBAR_ACTIVE_SHIELD_TEXT}
bossbar set {ns}:stardust_pillar style notched_10
bossbar set {ns}:stardust_pillar color blue
bossbar set {ns}:stardust_pillar max {PILLAR_MAX_HEALTH}
""", prepend=True)
	write_versioned_function("minute", f"""
# Remove bossbar
bossbar set {ns}:stardust_pillar players
""")

	# Consume Starlight Infuser item to summon Stardust Pillar
	Mem.ctx.data[ns].advancements["technical/consume_starlight_infuser"] = set_json_encoder(Advancement({
		"criteria": {
			"requirements": {
				"trigger": "minecraft:consume_item",
				"conditions": {
					"item": {
						"predicates": {
							"minecraft:custom_data": {ns: {"starlight_infuser": True}}
						}
					}
				}
			}
		},
		"rewards": {
			"function": f"{ns}:advancements/consume_starlight_infuser"
		}
	}), max_level=-1)
	write_function(f"{ns}:advancements/consume_starlight_infuser", f"""
# Revoke advancement
advancement revoke @s only {ns}:technical/consume_starlight_infuser

# Tellraw, playsound, and particles
tellraw @a[distance=..128] ["",{STARFRAG_TEXT},{{"text":" A "}},{BOSSBAR_NO_SHIELD_TEXT},{{"text":" has been summoned!"}}]
execute as @a[distance=..128] at @s run playsound minecraft:entity.wither.spawn ambient @s
particle minecraft:sculk_soul ~ ~ ~ 0.5 0.5 0.5 0.5 500

# Summon Stardust Pillar at world surface + 15
execute positioned over world_surface positioned ~ ~15 ~ run function {ns}:mobs/stardust_pillar/summon
""")

	# Stardust Pillar conversion
	write_function(f"{ns}:mobs/stardust_pillar/convert", f"""
# Make invisible, reset nbt, set custom name and tags
effect give @s invisibility infinite 255 true

# Add tags & join team
{"\n".join([f"tag @s add {tag}" for tag in Conventions.ENTITY_TAGS])}
tag @s add {ns}.stardust_pillar
tag @s add {ns}.mob_entity
team join {ns}.mob @s

# Mark as new mob for setup
tag @s add {ns}.new_mob

# No equipment or loot table
item replace entity @s weapon.mainhand with stone[item_model="minecraft:air",{COMMON_SIGNAL}]
data modify entity @s DeathLootTable set value "none"

# Set attributes ({PILLAR_MAX_HEALTH} health, x2 damage, 5x scale)
attribute @s minecraft:attack_damage modifier add {ns}:damage_scale 2 add_multiplied_base
attribute @s minecraft:max_health base set {PILLAR_MAX_HEALTH}
attribute @s minecraft:scale base set 5.0
data modify entity @s Health set value 2048.0f

# Set custom name and other properties
data modify entity @s CustomName set value {{"text":"Stardust Pillar","color":"aqua"}}
data modify entity @s PersistenceRequired set value true
data modify entity @s Silent set value true
data modify entity @s NoAI set value true

# Create visual model
execute store result score #base_scale {ns}.data run attribute @s minecraft:scale base get 500
execute summon item_display run function {ns}:mobs/create_model {{"entity":"stardust_pillar"}}

# Playsound on summon #TODO: Add the sound
execute as @a[distance=..200] at @s facing entity @n[tag={ns}.new_mob] eyes run playsound {ns}:stardust_pillar_spawn hostile @s ^ ^ ^5

# Setup bossbar
bossbar set {ns}:stardust_pillar name {BOSSBAR_ACTIVE_SHIELD_TEXT}
bossbar set {ns}:stardust_pillar value {PILLAR_MAX_HEALTH}

# Remove new_mob tag after setup
tag @s remove {ns}.new_mob
""")

	# Mob looping behavior
	write_function(f"{ns}:mobs/loop/mob_second", f"execute if entity @s[tag={ns}.stardust_pillar] run return run function {ns}:mobs/stardust_pillar/second")

	# Stardust Pillar's looping behavior (summon mobs nearby players with a spawn animation)
	write_function(f"{ns}:mobs/stardust_pillar/second",
f"""
# Particles
particle dust{{color:[0,0,1],scale:1}} ~ ~-1 ~ 2 2 2 0 100

# Kill all vexes
tp @e[type=minecraft:vex,{Conventions.AVOID_ENTITY_TAGS_NO_KILL},distance=..96] ~ -10000 ~

# Check if angry (not in Stardust Dimension)
scoreboard players set #is_angry {ns}.data 0
execute unless dimension {ns}:stardust run scoreboard players set #is_angry {ns}.data 3

# Count the number of custom mobs around and decrease that count if angry
execute store result score #mob_count {ns}.data if entity @e[tag={ns}.mob_entity,distance=..40]
execute if score #is_angry {ns}.data matches 1.. run scoreboard players operation #mob_count {ns}.data /= #is_angry {ns}.data

# Compute max allowed mobs based on players nearby (20 + 5 per player)
scoreboard players set #max_mobs {ns}.data 20
scoreboard players set #per_player_mob_limit {ns}.data 5
execute store result score #player_count {ns}.data if entity @a[gamemode=!spectator,gamemode=!creative,distance=..96]
scoreboard players operation #per_player_mob_limit {ns}.data *= #player_count {ns}.data
scoreboard players operation #max_mobs {ns}.data += #per_player_mob_limit {ns}.data

# If under the limit, summon a wave of mobs on a random nearby player (every 5 seconds)
scoreboard players set #modulo_divisor {ns}.data 5
scoreboard players operation #temp {ns}.data = #global_seconds {ns}.data
scoreboard players operation #temp {ns}.data %= #modulo_divisor {ns}.data
execute if score #temp {ns}.data matches 0 if score #mob_count {ns}.data < #max_mobs {ns}.data at @r[gamemode=!spectator,gamemode=!creative,distance=..96] rotated ~ 0 run function {ns}:mobs/stardust_pillar/summon_wave

# If lost half health, remove NoAI and remove shield (resistance effect)
execute store result score #health {ns}.data run data get entity @s Health
execute if score #health {ns}.data matches {PILLAR_MAX_HEALTH // 2 + 1}.. run effect give @s minecraft:resistance 5 4 true
execute if score #health {ns}.data matches ..{PILLAR_MAX_HEALTH // 2} if data entity @s {{NoAI:true}} run function {ns}:mobs/stardust_pillar/remove_shield

# Launch towards nearest player if shield is down
execute if score #health {ns}.data matches ..{PILLAR_MAX_HEALTH // 2} if entity @p[gamemode=!spectator,gamemode=!creative,distance=..96] run function {ns}:mobs/stardust_pillar/launch_towards_player

# Set bossbar for nearby players & update value
bossbar set {ns}:stardust_pillar visible true
bossbar set {ns}:stardust_pillar players @a[distance=..200]
execute store result bossbar {ns}:stardust_pillar value run scoreboard players get #health {ns}.data
""")  # noqa: E501

	# Remove shield function
	write_function(f"{ns}:mobs/stardust_pillar/remove_shield", f"""
# Remove NoAI to allow movement, and clear resistance effect
data modify entity @s NoAI set value false
effect clear @s minecraft:resistance

# Update bossbar text
bossbar set {ns}:stardust_pillar name {BOSSBAR_NO_SHIELD_TEXT}

# Playsound on shield break #TODO: Add the sound
tag @s add {ns}.temp
execute as @a[distance=..200] at @s facing entity @n[tag={ns}.temp] eyes run playsound minecraft:entity.warden.sonic_boom hostile @s ^ ^ ^5
tag @s remove {ns}.temp

# Particle effect
particle minecraft:sculk_soul ~ ~ ~ 0.5 0.5 0.5 0.5 500
""")

	# Summon wave function
	write_function(f"{ns}:mobs/stardust_pillar/summon_wave",
f"""
# Audio feedback meaning you're the target
playsound minecraft:entity.zombie.break_wooden_door hostile @a[distance=..25]
playsound minecraft:block.lava.extinguish ambient @a[distance=..25]

# Summon 5 mobs in a pentagon around the player
execute positioned ^ ^ ^-2 run function {ns}:mobs/stardust_pillar/summon_mob
execute positioned ^1.5 ^ ^2 run function {ns}:mobs/stardust_pillar/summon_mob
execute positioned ^-1.5 ^ ^2 run function {ns}:mobs/stardust_pillar/summon_mob
execute positioned ^2 ^ ^-0.7 run function {ns}:mobs/stardust_pillar/summon_mob
execute positioned ^-2 ^ ^-0.7 run function {ns}:mobs/stardust_pillar/summon_mob

# Decrease health by 5 if shield is still active
execute if score #health {ns}.data matches {PILLAR_MAX_HEALTH // 2 + 1}.. run function {ns}:mobs/stardust_pillar/deal_shield_damage
""")
	write_function(f"{ns}:mobs/stardust_pillar/summon_mob", f"""
# Particles
particle minecraft:soul_fire_flame ~ ~ ~ 0.5 0.5 0.5 0.05 25

# Summon a random stardust mob
execute store result score #random {ns}.data run random value 1..15
execute if score #random {ns}.data matches 1 positioned ~ ~-2 ~ summon minecraft:bat run return run function {ns}:mobs/delay/convert {{"entity":"stardust_bat"}}
execute if score #random {ns}.data matches 2..5 positioned ~ ~-2 ~ summon minecraft:evoker run return run function {ns}:mobs/delay/convert {{"entity":"stardust_evoker"}}
execute if score #random {ns}.data matches 6.. positioned ~ ~-2 ~ summon minecraft:skeleton run return run function {ns}:mobs/delay/convert {{"entity":"stardust_soldier"}}
""")

	# Deal shield damage function
	write_function(f"{ns}:mobs/stardust_pillar/deal_shield_damage", f"""
# Decrease health by 5 and update entity health
scoreboard players remove #health {ns}.data 5
execute store result entity @s Health float 1.0 run scoreboard players get #health {ns}.data
""")

	# Launch towards nearest player function
	write_function(f"{ns}:mobs/stardust_pillar/launch_towards_player", f"""
# Compute motion towards nearest player
scoreboard players set @s bs.vel.x 0
scoreboard players set @s bs.vel.y 0
scoreboard players set @s bs.vel.z 500
execute facing entity @p[gamemode=!spectator,gamemode=!creative,distance=..96] eyes run function #bs.move:local_to_canonical

# Apply motion
function #bs.move:set_motion {{scale:0.001}}

# Bound pos
data modify storage {ns}:temp Pos set from entity @p[gamemode=!spectator,gamemode=!creative,distance=..96] Pos
data modify storage {ns}:temp bound_pos set value [0, 0, 0]
execute store result storage {ns}:temp bound_pos[0] int 1 run data get storage {ns}:temp Pos[0]
execute store result storage {ns}:temp bound_pos[1] int 1 run data get storage {ns}:temp Pos[1]
execute store result storage {ns}:temp bound_pos[2] int 1 run data get storage {ns}:temp Pos[2]
data modify entity @s bound_pos set from storage {ns}:temp bound_pos
""")

	# Death function
	write_function(f"{ns}:mobs/display/start_dying", f"""
# If Stardust Pillar, run death function
execute if entity @s[tag={ns}.stardust_pillar] run function {ns}:mobs/stardust_pillar/death
""")
	write_function(f"{ns}:mobs/stardust_pillar/death", f"""
# Remove bossbar (from all players)
bossbar set {ns}:stardust_pillar players

# Reward nearby players
loot give @a[distance=..96] loot {ns}:entities/stardust_pillar

# Tellraw and playsound	# TODO: Add sound
tellraw @a[distance=..96] ["",{STARFRAG_TEXT},{{"text":" The "}},{BOSSBAR_NO_SHIELD_TEXT},{{"text":" has been defeated!"}}]
playsound minecraft:entity.wither.death hostile @a[distance=..96]
""")

	# Loot table
	Mem.ctx.data[ns].loot_tables["entities/stardust_pillar"] = set_json_encoder(LootTable({
		"type": "minecraft:entity",
		"pools": [
			{
				"rolls": 1,
				"entries": [
					{
						"type": "minecraft:loot_table",
						"value": f"{ns}:i/stardust_dungeon_key",
						"functions": [
							{
								"function": "minecraft:set_count",
								"count": 2
							}
						]
					}
				]
			},
			{
				"rolls": 1,
				"bonus_rolls": 0,
				"entries": [
					{
						"type": "minecraft:loot_table",
						"value": f"{ns}:i/compacted_stardust_shard",
						"functions": [
							{
								"function": "minecraft:set_count",
								"count": {
									"min": 2,
									"max": 4
								}
							}
						]
					}
				]
			},
			{
				"rolls": 1,
				"bonus_rolls": 0,
				"entries": [
					{
						"type": "minecraft:item",
						"name": "minecraft:diamond_block",
						"functions": [
							{
								"function": "minecraft:set_count",
								"count": {
									"min": 12,
									"max": 20
								}
							}
						]
					}
				]
			},
			{
				"rolls": 1,
				"bonus_rolls": 0,
				"entries": [
					{
						"type": "minecraft:item",
						"name": "minecraft:gold_block",
						"functions": [
							{
								"function": "minecraft:set_count",
								"count": {
									"min": 12,
									"max": 20
								}
							}
						]
					}
				]
			}
		]
	}), max_level=-1)

