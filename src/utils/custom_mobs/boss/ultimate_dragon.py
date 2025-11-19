
# Imports
import json

from stewbeet import (
	Advancement,
	Conventions,
	JsonDict,
	LootTable,
	Mem,
	Predicate,
	rainbow_gradient_text,
	set_json_encoder,
	write_function,
	write_load_file,
)

from ...common import STARFRAG_TEXT


# Setup boss mob: Ultimate Dragon
def main() -> None:
	SPAWN_ANIMATION_DURATION: int = 160  # Ticks
	DRAGON_MAX_HEALTH: int = 1024
	ULTIMATE_SLAVE_MAX_HEALTH: int = 512
	ATTACK_COOLDOWN: int = 200
	BOSSBAR_LIST: list[JsonDict] = rainbow_gradient_text("Ultimate Dragon")
	BOSSBAR_TEXT: str = json.dumps(BOSSBAR_LIST)
	ns: str = Mem.ctx.project_id

	# Load function
	write_load_file(f"""
# Ultimate Dragon bossbar & objectives
scoreboard objectives add {ns}.lingering_potion minecraft.used:minecraft.lingering_potion
scoreboard objectives add {ns}.chosen_attack dummy
scoreboard objectives add {ns}.attack_cooldown dummy
bossbar add {ns}:ultimate_dragon {BOSSBAR_TEXT}
bossbar set {ns}:ultimate_dragon name {BOSSBAR_TEXT}
bossbar set {ns}:ultimate_dragon style notched_20
bossbar set {ns}:ultimate_dragon color yellow
bossbar set {ns}:ultimate_dragon max {DRAGON_MAX_HEALTH}
""", prepend=True)
	write_function(f"{ns}:mobs/remove_bossbars", f"execute unless entity @e[tag={ns}.dragon] run bossbar set {ns}:ultimate_dragon players")

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

# Set transformation properties
data modify entity @s transformation.scale set value [0.0d,0.0d,0.0d]
data modify entity @s transformation.translation[1] set value -15.0d
data modify entity @s interpolation_duration set value {SPAWN_ANIMATION_DURATION}
data modify entity @s teleport_duration set value 0

# Add tags
{"\n".join([f"tag @s add {tag}" for tag in Conventions.ENTITY_TAGS_NO_KILL])}
tag @s add {ns}.check_ultimate_dragon_essence
""")

	# Check if lingering potion has landed
	write_function(f"{ns}:mobs/ultimate_dragon/essence/check_landing", f"""
# Check if lingering potion has landed (no vehicle)
scoreboard players set #remaining_potions {ns}.data 0
execute as @e[tag={ns}.check_ultimate_dragon_essence] at @s run function {ns}:mobs/ultimate_dragon/essence/check_single_landing

# If any remaining potions, reschedule check
execute if score #remaining_potions {ns}.data matches 1.. run schedule function {ns}:mobs/ultimate_dragon/essence/check_landing 1t replace
""")
	write_function(f"{ns}:mobs/ultimate_dragon/essence/check_single_landing", f"""
# If vehicle is not gone, still flying (return)
execute on vehicle run return run scoreboard players add #remaining_potions {ns}.data 1

# Else, has landed, proceed to next step
function {ns}:mobs/ultimate_dragon/essence/has_landed
""")
	write_function(f"{ns}:mobs/ultimate_dragon/essence/has_landed", f"""
# Playsound
playsound minecraft:block.amethyst_block.break ambient @a[distance=..20]

# If not in ultimate dimension,
execute unless dimension {ns}:ultimate run return run function {ns}:mobs/ultimate_dragon/essence/not_in_ultimate_dimension

# Switch tags
tag @s remove {ns}.check_ultimate_dragon_essence
tag @s add {ns}.ultimate_dragon_essence_landed

# Start animation (ultimate dragon egg growing)
tp @s ~ ~15 ~
loot replace entity @s contents loot {ns}:i/ultimate_dragon_egg
data modify entity @s transformation.scale set value [15.0d,15.0d,15.0d]
data modify entity @s transformation.translation[1] set value 0.0d
data modify entity @s start_interpolation set value 0

# Schedule check for max size reached
scoreboard players set @s {ns}.spawn_delay {SPAWN_ANIMATION_DURATION}
scoreboard players operation @s {ns}.spawn_delay += #global_tick {ns}.data
schedule function {ns}:mobs/ultimate_dragon/essence/animation_loop 1t append
""")
	write_function(f"{ns}:mobs/ultimate_dragon/essence/not_in_ultimate_dimension", f"""
# Tellraw and advancement	# TODO: Implement this properly
tellraw @a[distance=..128] ["",{STARFRAG_TEXT},{{"text":" The Ultimate Dragon Essence fizzles out in this dimension..."}}]
advancement grant @a[distance=..128] only {ns}:visible/adventure/waste_of_essence
""")
	# Animation loop to check for max size reached
	write_function(f"{ns}:mobs/ultimate_dragon/essence/animation_loop", f"""
# Loop until max size reached
scoreboard players set #remaining_essences_anim {ns}.data 0
execute as @e[tag={ns}.ultimate_dragon_essence_landed] at @s run function {ns}:mobs/ultimate_dragon/essence/check_reached_max_size

# If any remaining, reschedule
execute if score #remaining_essences_anim {ns}.data matches 1.. run schedule function {ns}:mobs/ultimate_dragon/essence/animation_loop 1t replace
""")
	write_function(f"{ns}:mobs/ultimate_dragon/essence/check_reached_max_size", f"""
# If not reached max size, return
execute if score #global_tick {ns}.data < @s {ns}.spawn_delay run return run scoreboard players add #remaining_essences_anim {ns}.data 1

# Else, reached max size, proceed
function {ns}:mobs/ultimate_dragon/essence/finish_animation
""")

	# End crystals to summon
	write_function(f"{ns}:mobs/ultimate_dragon/summon_end_crystals", "\n".join([
		f"execute in {ns}:ultimate run summon minecraft:end_crystal {coords}"
		for coords in [
			"12 76 -40", "33 103 -25", "42 88 0", "33 97 24", "12 82 39",
			"-13 79 39", "-34 94 24", "-42 91 -1", "-34 100 -25", "-13 85 -40"
		]
	]))

	# Finish animation and summon Ultimate Dragon
	write_function(f"{ns}:mobs/ultimate_dragon/essence/finish_animation", f"""
# Remove entity
kill @s

# Tellraw, playsound, and particles
tellraw @a[distance=..128] ["",{STARFRAG_TEXT},{{"text":" An "}},{BOSSBAR_TEXT},{{"text":" has been summoned!"}}]
execute as @a[distance=..128] at @s run playsound minecraft:entity.ender_dragon.ambient ambient @s
execute as @a[distance=..128] at @s run playsound minecraft:entity.dragon_fireball.explode ambient @s
particle minecraft:dragon_breath ~ ~ ~ 10 10 10 0.5 5000
particle minecraft:explosion_emitter ~ ~ ~ 4 4 4 0.0 10

# Summon Ultimate Dragon at world surface
function {ns}:mobs/ultimate_dragon/summon

# Summon 3 slaves
execute positioned ~10 ~ ~ run function {ns}:mobs/ultimate_slave/summon
execute positioned ~ ~ ~7 run function {ns}:mobs/ultimate_slave/summon
execute positioned ~ ~ ~-7 run function {ns}:mobs/ultimate_slave/summon

# Summon all end crystal
function {ns}:mobs/ultimate_dragon/summon_end_crystals
""")

	# Ultimate Dragon conversion
	write_function(f"{ns}:mobs/ultimate_dragon/summon", f"execute summon minecraft:ender_dragon run function {ns}:mobs/ultimate_dragon/convert")
	write_function(f"{ns}:mobs/ultimate_dragon/convert", f"""
# Add tags & join team
{"\n".join([f"tag @s add {tag}" for tag in Conventions.ENTITY_TAGS])}
tag @s add {ns}.ultimate_dragon
tag @s add {ns}.mob_entity
tag @s add {ns}.dragon
team join {ns}.mob @s

# Mark as new mob for setup
tag @s add {ns}.new_mob

# Set attributes ({DRAGON_MAX_HEALTH} health, x4 damage, 80% resistance)
attribute @s minecraft:max_health base set {DRAGON_MAX_HEALTH}
attribute @s minecraft:attack_damage modifier add {ns}:damage_scale 3 add_multiplied_base
effect give @s minecraft:resistance infinite 3 true
data modify entity @s Health set value 4096.0f

# Set custom name and other properties
data modify entity @s CustomName set value {{"text":"Ultimate Dragon","color":"white"}}
data modify entity @s PersistenceRequired set value true
data modify entity @s Glowing set value true

# Create visual model
scoreboard players set #base_scale {ns}.data 0
execute summon item_display run function {ns}:mobs/create_model {{"entity":"ultimate_dragon"}}

# Setup bossbar
bossbar set {ns}:ultimate_dragon name {BOSSBAR_TEXT}
bossbar set {ns}:ultimate_dragon value {DRAGON_MAX_HEALTH}

# Remove new_mob tag after setup
tag @s remove {ns}.new_mob
""")

	# Slave summon function
	write_function(f"{ns}:mobs/ultimate_slave/summon", f"execute summon minecraft:ender_dragon run function {ns}:mobs/ultimate_slave/convert")
	write_function(f"{ns}:mobs/ultimate_slave/convert", f"""
# Add tags & join team
{"\n".join([f"tag @s add {tag}" for tag in Conventions.ENTITY_TAGS])}
tag @s add {ns}.ultimate_slave
tag @s add {ns}.mob_entity
tag @s add {ns}.dragon
team join {ns}.mob @s

# Mark as new mob for setup
tag @s add {ns}.new_mob

# Set attributes ({ULTIMATE_SLAVE_MAX_HEALTH} health, x4 damage)
attribute @s minecraft:max_health base set {ULTIMATE_SLAVE_MAX_HEALTH}
attribute @s minecraft:attack_damage modifier add {ns}:damage_scale 3 add_multiplied_base
data modify entity @s Health set value 4096.0f

# Set custom name and other properties
data modify entity @s CustomName set value {{"text":"Ultimate Slave","color":"white"}}
data modify entity @s PersistenceRequired set value true

# Create visual model
scoreboard players set #base_scale {ns}.data 0
execute summon item_display run function {ns}:mobs/create_model {{"entity":"ultimate_slave"}}

# Remove new_mob tag after setup
tag @s remove {ns}.new_mob
""")

	# Mob looping behavior
	write_function(f"{ns}:mobs/loop/mob_second", f"execute if entity @s[tag={ns}.ultimate_dragon] run return run function {ns}:mobs/ultimate_dragon/second")

	# Ultimate Dragon's looping behavior
	Mem.ctx.data[ns].predicates["random/0.2"] = set_json_encoder(Predicate({"condition":"minecraft:random_chance","chance":0.2}))
	write_function(f"{ns}:mobs/ultimate_dragon/second", f"""
# Launch tick function
scoreboard players set #ultimate_dragon_tick {ns}.data 20
schedule function {ns}:mobs/ultimate_dragon/schedule_tick 1t append

# Set bossbar for nearby players
bossbar set {ns}:ultimate_dragon visible true
bossbar set {ns}:ultimate_dragon players @a[distance=..200]

# Check if any dragon died
execute as @e[tag={ns}.mob_entity,tag={ns}.ultimate_slave,tag=!{ns}.dead_slave] run function {ns}:mobs/ultimate_slave/check_health

# Prevents dead dragons from disappearing & applying phase 0 to all slave dragons
execute as @e[tag={ns}.mob_entity,tag={ns}.dead_slave] run data modify entity @s Health set value {ULTIMATE_SLAVE_MAX_HEALTH}
execute as @e[tag={ns}.mob_entity,tag={ns}.ultimate_slave] run data modify entity @s DragonPhase set value 0

# Prevents dragons from flying too high (Y=150)
execute as @e[tag={ns}.dragon] at @s if entity @s[y=150,dy=800] run data modify entity @s Motion[1] set value -2.00d

# Every second, 20% chance to choose a random attack
execute as @e[tag={ns}.dragon,predicate={ns}:random/0.2] unless score @s {ns}.attack_cooldown matches -{ATTACK_COOLDOWN}.. at @s run function {ns}:mobs/ultimate_dragon/common/choose_attack

# Kill entities alive for too long (5s)
scoreboard players add @e[tag={ns}.short_lived_entity] {ns}.data 1
kill @e[tag={ns}.short_lived_entity,scores={{{ns}.data=5..}}]

# Prevent entities to go too far away
execute in {ns}:ultimate positioned 0 100 0 as @e[distance=256..1000] on vehicle run tp @s 0 100 0
execute in {ns}:ultimate positioned 0 100 0 run tp @e[distance=256..1000] 0 100 0
""")
	write_function(f"{ns}:mobs/ultimate_dragon/schedule_tick", f"""
# Decrease tick counter and run tick function
scoreboard players remove #ultimate_dragon_tick {ns}.data 1
execute as @n[tag={ns}.mob_entity,tag={ns}.ultimate_dragon] at @s run function {ns}:mobs/ultimate_dragon/tick

# Reschedule next tick if not zero
execute if score #ultimate_dragon_tick {ns}.data matches 1.. run schedule function {ns}:mobs/ultimate_dragon/schedule_tick 1t replace
""")
	write_function(f"{ns}:mobs/ultimate_dragon/tick", f"""
# Update bossbar value
execute store result bossbar {ns}:ultimate_dragon value run data get entity @s Health

# Particles to dead slaves to indicate they are dead
execute at @e[tag={ns}.mob_entity,tag={ns}.dead_slave] run particle minecraft:soul ~ ~ ~ 5 5 5 0.05 25 force @a[distance=..200]

# Replace fire so it doesn't last long
execute at @a[distance=..200] run fill ~-16 ~-16 ~-16 ~16 ~16 ~16 minecraft:fire[age=15] replace minecraft:fire

# Handle attack cooldown
execute as @e[tag={ns}.dragon,scores={{{ns}.attack_cooldown=-{ATTACK_COOLDOWN}..}}] at @s run function {ns}:mobs/ultimate_dragon/common/handle_attack_cooldown

# Check if poops are destroyed
execute as @e[type=item_display,tag={ns}.ultimate_poop] at @s run function {ns}:mobs/ultimate_dragon/ultimate_poop/check_destroy

# Homing arrows targetting nearest player
execute as @e[type=arrow,tag={ns}.homing_arrow] at @s run function {ns}:mobs/ultimate_dragon/homing_arrow/tick
""")

	# Choose attack function
	write_function(f"{ns}:mobs/ultimate_dragon/common/choose_attack", f"""
# Choose a random attack and run function
execute store result score @s {ns}.chosen_attack run random value 1..2
execute if score @s {ns}.chosen_attack matches 1 run return run function {ns}:mobs/ultimate_dragon/ultimate_poop/choose
execute if score @s {ns}.chosen_attack matches 2 run return run function {ns}:mobs/ultimate_dragon/fireball_burst/choose
execute if score @s {ns}.chosen_attack matches 3 run return run function {ns}:mobs/ultimate_dragon/homing_arrows/choose
""")

	# Handle attack cooldown
	write_function(f"{ns}:mobs/ultimate_dragon/common/handle_attack_cooldown", f"""
# Decrease attack cooldown by 1 and stop when it reaches 0
scoreboard players remove @s {ns}.attack_cooldown 1
execute if score @s {ns}.attack_cooldown matches ..0 run return 1

# Only action for poop attack is particles
execute if score @s {ns}.chosen_attack matches 1 run return run particle dust{{color:[0.59,0.29,0],scale:4}} ~ ~ ~ 0 0 0 0.05 1 force @a[distance=..200]

# Fireball Burst attack
execute if score @s {ns}.chosen_attack matches 2 run function {ns}:mobs/ultimate_dragon/fireball_burst/tick
""")

	## Poop attack functions
	# Ultimate Poop attack
	write_function(f"{ns}:mobs/ultimate_dragon/ultimate_poop/choose", f"""
# Poop particles for 2 seconds
scoreboard players set @s {ns}.attack_cooldown 40

# 20% chance of summoning an ultimate poop directly
execute if predicate {ns}:random/0.2 summon item_display run function {ns}:mobs/ultimate_dragon/ultimate_poop/on_new_poop
""")

	# On new poop summoned
	write_function(f"{ns}:mobs/ultimate_dragon/ultimate_poop/on_new_poop", f"""
# Add tags
{"\n".join([f"tag @s add {tag}" for tag in Conventions.ENTITY_TAGS_NO_KILL])}
tag @s add {ns}.ultimate_poop

# Set item display properties
data modify entity @s Glowing set value true
data modify entity @s transformation.scale set value [1.5d,1.5d,1.5d]
loot replace entity @s contents loot {ns}:i/ultimate_poop
""")

	# Check if poops are destroyed
	write_function(f"{ns}:mobs/ultimate_dragon/ultimate_poop/check_destroy", f"""
# If item_display has existed for more than 300 ticks (15 seconds), kill it
scoreboard players add @s {ns}.data 1
execute if score @s {ns}.data matches 250 run data merge entity @s {{transformation:{{scale:[0.0d,0.0d,0.0d]}},interpolation_duration:20,start_interpolation:0}}
execute if score @s {ns}.data matches 300.. run return run kill @s

# If a player or an arrow is within 1 block, the poop is destroyed
scoreboard players set #success {ns}.data 0
execute as @a[gamemode=!spectator,distance=..2] at @s run function {ns}:mobs/ultimate_dragon/ultimate_poop/destroy
execute as @e[type=arrow,distance=..2] at @s run function {ns}:mobs/ultimate_dragon/ultimate_poop/destroy
execute if score #success {ns}.data matches 1.. run kill @s
""")
	write_function(f"{ns}:mobs/ultimate_dragon/ultimate_poop/destroy", f"""
# Mark success
scoreboard players set #success {ns}.data 1

# Playsound for the player who destroyed the poop
execute if entity @s[type=player] run playsound minecraft:entity.ender_dragon.hurt hostile @s
execute if entity @s[type=player] run playsound minecraft:block.honey_block.break ambient @s
execute if entity @s[type=arrow] on origin at @s run playsound minecraft:entity.ender_dragon.hurt hostile @s
execute if entity @s[type=arrow] on origin at @s run playsound minecraft:block.honey_block.break ambient @s
execute if entity @s[type=arrow] run kill @s

# Remove health percentage from all dragons
execute as @e[tag={ns}.dragon] at @s run function {ns}:mobs/ultimate_dragon/ultimate_poop/remove_health_percentage
""")

	# Remove health percentage
	write_function(f"{ns}:mobs/ultimate_dragon/ultimate_poop/remove_health_percentage", f"""
# Remove 1% of total health (only if above 0 health)
execute store result score #to_remove {ns}.data run attribute @s minecraft:max_health get 10
execute store result score #current_health {ns}.data run data get entity @s Health 1000
scoreboard players operation #current_health {ns}.data -= #to_remove {ns}.data
execute if score #current_health {ns}.data matches 1.. store result entity @s Health float 0.001 run scoreboard players get #current_health {ns}.data

# Particles
particle block{{block_state:"redstone_wire"}} ~ ~ ~ 3 3 3 0 1000 force @a[distance=..200]
""")

	## Fireball Burst attack functions
	write_function(f"{ns}:mobs/ultimate_dragon/fireball_burst/choose", f"""
# Attack duration of 1.2 seconds
scoreboard players set @s {ns}.attack_cooldown 24
""")
	write_function(f"{ns}:mobs/ultimate_dragon/fireball_burst/tick", f"""
# Every 3 ticks, launch a fireball
scoreboard players set #3 {ns}.data 3
scoreboard players operation #temp {ns}.data = #global_tick {ns}.data
scoreboard players operation #temp {ns}.data %= #3 {ns}.data
execute if score #temp {ns}.data matches 0 run function {ns}:mobs/ultimate_dragon/fireball_burst/launch
""")
	write_function(f"{ns}:mobs/ultimate_dragon/fireball_burst/launch", f"""
# Stop if no valid players
execute unless entity @p[gamemode=!spectator,gamemode=!creative,distance=..200] run return fail

# Fireball towards nearest player
execute facing entity @p[gamemode=!spectator,gamemode=!creative,distance=..200] eyes positioned ^ ^ ^5 run function {ns}:mobs/ultimate_dragon/fireball_burst/summon_command

# Playsound for the targetted player
execute as @p[gamemode=!spectator,gamemode=!creative,distance=..200] at @s run playsound minecraft:entity.ender_dragon.shoot hostile @s
""")
	write_function(f"{ns}:mobs/ultimate_dragon/fireball_burst/summon_command", f"""
# 1/20 chance that it's a dragon breath instead
execute store result score #random {ns}.data run random value 1..20
execute if score #random {ns}.data matches 1 summon minecraft:dragon_fireball run return run function {ns}:mobs/ultimate_dragon/fireball_burst/on_new_ball
execute if score #random {ns}.data matches 2.. summon minecraft:fireball run return run function {ns}:mobs/ultimate_dragon/fireball_burst/on_new_ball
""")
	write_function(f"{ns}:mobs/ultimate_dragon/fireball_burst/on_new_ball", f"""
# Add tags
tag @s add {ns}.short_lived_entity
tag @s add {ns}.fireball_burst

# If classic fireball, set explosion power
execute if entity @s[type=minecraft:fireball] run data modify entity @s ExplosionPower set value 4

# Set motion towards facing direction, and acceleration
function {ns}:utils/compute_motion_towards {{towards:1500,scale:0.001}}
""")

	## Homing arrows functions
	# TODO: Homing arrows
	#
	# Compute motion towards nearest player
	#execute facing entity @p[gamemode=!spectator,gamemode=!creative,distance=..96] eyes run function {ns}:utils/compute_motion_towards {{towards:500,scale:0.001}}

	## Ultimate slave killed
	write_function(f"{ns}:mobs/ultimate_slave/check_health", f"""
# If health <= 5, mark as dead_slave
execute store result score #health {ns}.data run data get entity @s Health
execute if score #health {ns}.data matches ..5 run tag @s add {ns}.dead_slave
execute if score #health {ns}.data matches ..5 run effect give @s minecraft:resistance infinite 255 true
execute if score #health {ns}.data matches ..5 as @e[tag={ns}.mob_entity,tag={ns}.ultimate_dragon] at @s run function {ns}:mobs/ultimate_slave/damage_ultimate_dragon
""")
	write_function(f"{ns}:mobs/ultimate_slave/damage_ultimate_dragon", f"""
# Remove 25% of total health
execute store result score #to_remove {ns}.data run attribute @s minecraft:max_health get 250
execute store result score #current_health {ns}.data run data get entity @s Health 1000
scoreboard players operation #current_health {ns}.data -= #to_remove {ns}.data
execute if score #current_health {ns}.data matches 1.. store result entity @s Health float 0.001 run scoreboard players get #current_health {ns}.data
execute if score #current_health {ns}.data matches ..0 run data modify entity @s Health set value 10.0f

# Resummon end crystals
function {ns}:mobs/ultimate_dragon/summon_end_crystals

# Particle, playsound, and tellraw
execute as @a[distance=..200] at @s run playsound minecraft:entity.dragon_fireball.explode hostile @s
particle soul ~ ~ ~ 10 10 10 0.5 1000 force @a[distance=..200]
tellraw @a[distance=..200] ["",{STARFRAG_TEXT},{{"text":" One of the Slaves has been defeated! The "}},{BOSSBAR_TEXT},{{"text":" just lost 25% of its Max Health!"}}]
""")

	return

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

