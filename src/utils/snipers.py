
# ruff: noqa: E501
# Imports
from stewbeet import *  # type: ignore

from ..definitions.additions.equipments import SNIPER_BULLETS


# Setup Snipers
def setup_snipers() -> None:
	ns: str = Mem.ctx.project_id

	# New damage type bypassing invulnerability frames
	Mem.ctx.data[ns].damage_type["sniper_bullet"] = set_json_encoder(DamageType({
		"exhaustion": 0.2,
		"message_id": "arrow",
		"scaling": "when_caused_by_living_non_player"
	}))
	for tag in ["bypasses_cooldown", "no_knockback"]:
		write_tag(tag, Mem.ctx.data["minecraft"].damage_type_tags, [f"{ns}:sniper_bullet"])
	write_function(f"{ns}:utils/snipers/damage", f"$damage $(target) $(amount) {ns}:sniper_bullet by $(source)")

	# Load function
	write_load_file(f"""
# Snipers objectives
scoreboard objectives add {ns}.sniper_cooldown dummy
""", prepend=True)

	# Right click handling (sniper_data = {"damage":6, "cooldown":20, "playsound": f"{ns}:stardust_sniper_shot"})
	write_function(f"{ns}:advancements/right_click", f"""
# If holding a sniper, handle it
execute if items entity @s weapon.mainhand *[custom_data~{{{ns}:{{sniper:{{}}}}}}] run function {ns}:utils/snipers/right_click
""")

	# Get bullet damage
	def get_bullet_damage_function(bullet_type: str) -> tuple[str, str, str]:
		if bullet_type.startswith("minecraft:"):
			item: str = bullet_type
		else:
			item = f"*[custom_data~{{{ns}:{{{bullet_type}:true}}}}]"
		return (
			f"execute if score #bullet_damage {ns}.data matches 0 if items entity @s container.* {item} run "
			f"scoreboard players set #bullet_damage {ns}.data {SNIPER_BULLETS[bullet_type]}"
		), (
			f"execute if score #bullet_damage {ns}.data matches {SNIPER_BULLETS[bullet_type]} run "
			f"advancement grant @s only {ns}:visible/stuff/bullets/{bullet_type.replace('minecraft:', '')}"
		), (
			f"execute if score #bullet_damage {ns}.data matches {SNIPER_BULLETS[bullet_type]} "
			f"unless entity @s[gamemode=creative] run clear @s {item} 1"
		)
	adv_and_lines: list[tuple[str, str, str]] = [get_bullet_damage_function(bullet) for bullet in SNIPER_BULLETS][::-1]
	all_get_lines: str = "\n".join([x[0] for x in adv_and_lines] + [x[1] for x in adv_and_lines] + [x[2] for x in adv_and_lines])

	# Main right click function
	write_function(f"{ns}:utils/snipers/right_click", f"""
# Stop if on cooldown
execute if score @s {ns}.sniper_cooldown > #global_tick {ns}.data run return fail

# Copy sniper data
data modify storage {ns}:temp components set from entity @s SelectedItem.components
data modify storage {ns}:temp sniper_data set from storage {ns}:temp components."minecraft:custom_data".{ns}.sniper

# Set cooldown
execute store result score @s {ns}.sniper_cooldown run data get storage {ns}:temp sniper_data.cooldown
scoreboard players operation @s {ns}.sniper_cooldown += #global_tick {ns}.data

# Get bullet damage
scoreboard players set #bullet_damage {ns}.data 0
{all_get_lines}
execute if score #bullet_damage {ns}.data matches 0 if entity @s[gamemode=creative] run scoreboard players set #bullet_damage {ns}.data 1
execute if score #bullet_damage {ns}.data matches 0 run return run playsound minecraft:block.note_block.didgeridoo ambient @s

# Use 1 durability
data modify storage {ns}:temp input set value {{"amount":1,"max_damage":1,"item_model":""}}
data modify storage {ns}:temp input.max_damage set from storage {ns}:temp components."minecraft:max_damage"
data modify storage {ns}:temp input.item_model set from storage {ns}:temp components."minecraft:item_model"
function {ns}:utils/use_durability/main with storage {ns}:temp input

# Shoot bullet entity
tag @s add {ns}.shooter
function {ns}:utils/snipers/raycast_in_your_ass with storage {ns}:temp sniper_data
tag @s remove {ns}.shooter
""")

	# Raycast, in your ass, function
	write_function(f"{ns}:utils/snipers/raycast_in_your_ass", f"""
# Playsound
$playsound $(playsound) player @a[distance=..64] ~ ~ ~ 0.5 1

# Add base damage
$scoreboard players add #bullet_damage {ns}.data $(damage)
data modify storage {ns}:temp input set value {{"target":"@s","amount":1.0d,"source":"@p[tag={ns}.shooter]"}}
execute store result storage {ns}:temp input.amount double 1.0 run scoreboard players get #bullet_damage {ns}.data

# Prepare arguments
data modify storage {ns}:temp raycast set value {{with:{{}}}}
data modify storage {ns}:temp raycast.with.blocks set value true
data modify storage {ns}:temp raycast.with.entities set value true
data modify storage {ns}:temp raycast.with.piercing set value 10
data modify storage {ns}:temp raycast.with.max_distance set value 128
data modify storage {ns}:temp raycast.with.on_targeted_block set value "function {ns}:utils/snipers/on_targeted_block"
data modify storage {ns}:temp raycast.with.on_targeted_entity set value "function {ns}:utils/snipers/on_targeted_entity"

# Launch raycast with callbacks (https://docs.mcbookshelf.dev/en/latest/modules/raycast.html#run-the-raycast)
execute anchored eyes positioned ^ ^ ^0.5 run function #bs.raycast:run with storage {ns}:temp raycast
""")

	# On targeted block
	write_function(f"{ns}:utils/snipers/on_targeted_block", f"""
# Stop the raycast here
scoreboard players set $raycast.piercing bs.lambda 0

# Get current block (https://docs.mcbookshelf.dev/en/latest/modules/block.html#get)
data modify storage {ns}:temp Pos set from entity @s Pos
data modify entity @s Pos set from storage bs:lambda raycast.targeted_block
execute at @s run function #bs.block:get_block
data modify entity @s Pos set from storage {ns}:temp Pos

# Make block particles
data modify storage {ns}:temp block_particles set value {{x:0,y:0,z:0,block:"minecraft:air"}}
data modify storage {ns}:temp block_particles.block set from storage bs:out block.type
data modify storage {ns}:temp block_particles.x set from storage bs:lambda raycast.hit_point[0]
data modify storage {ns}:temp block_particles.y set from storage bs:lambda raycast.hit_point[1]
data modify storage {ns}:temp block_particles.z set from storage bs:lambda raycast.hit_point[2]
function {ns}:utils/snipers/block_particles with storage {ns}:temp block_particles

# Particles towards the player
scoreboard players set #limit {ns}.data 1280
data modify entity @s Pos set from storage bs:lambda raycast.hit_point
execute at @s as @p[tag={ns}.shooter] facing entity @s eyes run function {ns}:utils/snipers/particle_trail
data modify entity @s Pos set from storage {ns}:temp Pos
""")
	write_function(f"{ns}:utils/snipers/block_particles", r"""$particle block{block_state:"$(block)"} $(x) $(y) $(z) 0.1 0.1 0.1 1 10 force @a[distance=..128]""")

	# On targeted entity
	write_function(f"{ns}:utils/snipers/on_targeted_entity", f"""
# Damage the entity
function {ns}:utils/snipers/damage with storage {ns}:temp input

# Blood particles
particle block{{block_state:"redstone_wire"}} ~ ~1 ~ 0.35 0.5 0.35 0 100 force @a[distance=..128]
""")

	# Particle trail function
	# TODO: Show particles even when no reaching a block
	write_function(f"{ns}:utils/snipers/particle_trail", f"""
# Particles and continue if player not reached
scoreboard players remove #limit {ns}.data 1
particle smoke ~ ~ ~ 0 0 0 0.01 1 force @a[distance=..128]
execute if score #limit {ns}.data matches 1.. unless entity @s[distance=..1.5] positioned ^ ^ ^0.25 run function {ns}:utils/snipers/particle_trail
""")

