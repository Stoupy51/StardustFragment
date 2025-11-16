
# Imports
import json
import math

from stewbeet import (
	COMMON_SIGNAL,
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


# Setup boss mob: Stardust Guardian
def main() -> None:
	GUARDIAN_MAX_HEALTH: int = 1024
	BOSSBAR_LIST: list[JsonDict] = create_gradient_text("Stardust Guardian", "8B0000", "b50666")
	BOSSBAR_TEXT: str = json.dumps(BOSSBAR_LIST)
	ns: str = Mem.ctx.project_id

	# Load function
	write_load_file(f"""
# Stardust Guardian bossbar
bossbar add {ns}:stardust_guardian {BOSSBAR_TEXT}
bossbar set {ns}:stardust_guardian name {BOSSBAR_TEXT}
bossbar set {ns}:stardust_guardian style notched_12
bossbar set {ns}:stardust_guardian color red
bossbar set {ns}:stardust_guardian max {GUARDIAN_MAX_HEALTH}
""", prepend=True)
	write_function(f"{ns}:mobs/remove_bossbars", f"bossbar set {ns}:stardust_guardian players")

	# Stardust Guardian conversion
	write_function(f"{ns}:mobs/stardust_guardian/summon", f"execute summon minecraft:skeleton run function {ns}:mobs/stardust_guardian/convert")
	write_function(f"{ns}:mobs/stardust_guardian/convert", f"""
# Make invisible, reset nbt, set custom name and tags
effect give @s invisibility infinite 255 true

# Add tags & join team
{"\n".join([f"tag @s add {tag}" for tag in Conventions.ENTITY_TAGS])}
tag @s add {ns}.stardust_guardian
tag @s add {ns}.mob_entity
team join {ns}.mob @s

# Mark as new mob for setup
tag @s add {ns}.new_mob

# No equipment or loot table
item replace entity @s weapon.mainhand with stone[item_model="minecraft:air",{COMMON_SIGNAL}]
data modify entity @s DeathLootTable set value "none"

# Set attributes ({GUARDIAN_MAX_HEALTH} health, x3 damage, 2x scale, 10 knockback resistance)
attribute @s minecraft:attack_damage modifier add {ns}:damage_scale 2 add_multiplied_base
attribute @s minecraft:max_health base set {GUARDIAN_MAX_HEALTH}
attribute @s minecraft:scale base set 1.5
attribute @s minecraft:knockback_resistance base set 10.0
data modify entity @s Health set value 2048.0f

# Set custom name and other properties
data modify entity @s CustomName set value {{"text":"Stardust Guardian","color":"red"}}
data modify entity @s PersistenceRequired set value true
data modify entity @s Silent set value true

# Create visual model
execute store result score #base_scale {ns}.data run attribute @s minecraft:scale base get 1000
execute summon item_display run function {ns}:mobs/create_model {{"entity":"stardust_guardian"}}

# Playsound on summon #TODO: Add the sound
execute as @a[distance=..200] at @s facing entity @n[tag={ns}.new_mob] eyes run playsound {ns}:stardust_guardian_spawn hostile @s ^ ^ ^5

# Setup bossbar
bossbar set {ns}:stardust_guardian name {BOSSBAR_TEXT}
bossbar set {ns}:stardust_guardian value {GUARDIAN_MAX_HEALTH}

# Remove new_mob tag after setup
tag @s remove {ns}.new_mob
""")

	# Mob looping behavior
	write_function(f"{ns}:mobs/loop/mob_second", f"execute if entity @s[tag={ns}.stardust_guardian] run return run function {ns}:mobs/stardust_guardian/second")

	# Stardust Guardian's looping behavior
	write_function(f"{ns}:mobs/stardust_guardian/second",
f"""
# Particles
particle dust{{color:[1,0,0],scale:1}} ~ ~-1 ~ 2 2 2 0 10

# If lost half health, summon a wave of mobs around all players
execute store result score #health {ns}.data run data get entity @s Health
execute if score #health {ns}.data matches {GUARDIAN_MAX_HEALTH // 2 + 1}.. run tag @s add {ns}.not_half_health
execute if score #health {ns}.data matches ..{GUARDIAN_MAX_HEALTH // 2} if entity @s[tag={ns}.not_half_health] run function {ns}:mobs/stardust_guardian/half_health_reached

# Set bossbar for nearby players & update value
bossbar set {ns}:stardust_guardian visible true
bossbar set {ns}:stardust_guardian players @a[distance=..200]
execute store result bossbar {ns}:stardust_guardian value run scoreboard players get #health {ns}.data

# Glowing only if no players nearby
execute on passengers run data modify entity @s Glowing set value false
execute unless entity @a[gamemode=!spectator,distance=..15] on passengers run data modify entity @s Glowing set value true
""")

	# Half health reached function
	write_function(f"{ns}:mobs/stardust_guardian/half_health_reached", f"""
# Remove tag to avoid repeated triggers
tag @s remove {ns}.not_half_health

# Summon wave immediately on all players
execute as @a[distance=..25] at @s rotated ~ 0 run function {ns}:mobs/stardust_guardian/summon_wave
""")

	# Summon wave function
	num_mobs: int = 25
	radius: float = 5.0
	summons: str = ""
	for i in range(num_mobs):
		angle: float = 2 * math.pi * i / num_mobs
		x_offset: float = radius * math.sin(angle)
		z_offset: float = radius * math.cos(angle)
		summons += f"execute positioned ^{x_offset:.2f} ^ ^{z_offset:.2f} run function {ns}:mobs/stardust_guardian/summon_mob\n"
	write_function(f"{ns}:mobs/stardust_guardian/summon_wave",
f"""
# Audio feedback meaning you're the target
playsound minecraft:entity.zombie.break_wooden_door hostile @a[distance=..25]
playsound minecraft:block.lava.extinguish ambient @a[distance=..25]

# Summon {num_mobs} mobs in a circle around the player
{summons}
""")
	write_function(f"{ns}:mobs/stardust_guardian/summon_mob", f"""
# Particles
particle minecraft:flame ~ ~ ~ 0.5 0.5 0.5 0.05 25

# Summon a random mob
execute store result score #random {ns}.data run random value 1..10
execute if score #random {ns}.data matches 1 positioned ~ ~-2 ~ summon minecraft:skeleton run return run function {ns}:mobs/delay/spawn
execute if score #random {ns}.data matches 2..5 positioned ~ ~-2 ~ summon minecraft:magma_cube run return run function {ns}:mobs/delay/spawn
execute if score #random {ns}.data matches 6.. positioned ~ ~-2 ~ summon minecraft:piglin_brute run return run function {ns}:mobs/delay/spawn
""")

	# Death function
	write_function(f"{ns}:mobs/display/start_dying", f"""
# If Stardust Guardian, run death function
execute if entity @s[tag={ns}.stardust_guardian] run function {ns}:mobs/stardust_guardian/death
""")
	write_function(f"{ns}:mobs/stardust_guardian/death", f"""
# Remove bossbar (from all players)
bossbar set {ns}:stardust_guardian players

# Reward nearby players
loot give @a[distance=..50] loot {ns}:entities/stardust_guardian

# Tellraw and playsound	# TODO: Add sound
tellraw @a[distance=..50] ["",{STARFRAG_TEXT},{{"text":" The "}},{BOSSBAR_TEXT},{{"text":" has been defeated!"}}]
playsound minecraft:entity.wither.death hostile @a[distance=..50]
""")

	# Loot table
	Mem.ctx.data[ns].loot_tables["entities/stardust_guardian"] = set_json_encoder(LootTable({
		"type": "minecraft:entity",
		"pools": [
			{
				"rolls": 1,
				"entries": [
					{
						"type": "minecraft:loot_table",
						"value": f"{ns}:i/awakened_stardust_block",
						"functions": [
							{
								"function": "minecraft:set_count",
								"count": {
									"min": 24,
									"max": 42
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
						"type": "minecraft:loot_table",
						"value": f"{ns}:i/stardust_core",
						"functions": [
							{
								"function": "minecraft:set_count",
								"count": {
									"min": 2,
									"max": 8
								}
							}
						]
					}
				]
			},
			{
				"rolls": {
					"type": "minecraft:uniform",
					"min": 16,
					"max": 24
				},
				"bonus_rolls": 0,
				"entries": [
					{
						"type": "minecraft:loot_table",
						"value": f"{ns}:random_seed"
					}
				]
			}
		]
	}), max_level=-1)

