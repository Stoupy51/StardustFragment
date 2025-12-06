
# ruff: noqa: E501
# Imports
from stewbeet import COMMON_SIGNAL_HIDDEN, JsonDict, LootTable, Mem, set_json_encoder, write_function, write_tag
from stouputils.io import get_root_path, json_load

from ..definitions.additions.materials import COBBLESTONE_TIERS
from ..definitions.additions.miscellaneous import miners_formula
from .quarry import quarry


# Setup machines work and visuals
def setup_machines(gui: dict[str, str]) -> None:
	ns: str = Mem.ctx.project_id

	# Solar panels
	for solar_panel in [x for x in Mem.definitions if x.endswith("_solar_panel")]:
		if_unless: str = "if" if solar_panel != "darkium_solar_panel" else "unless"
		energy: JsonDict = Mem.definitions[solar_panel]["custom_data"]["energy"]
		content: str = f"""# Produce Energy depending on the power of daylight sensor
execute {if_unless} predicate simplenergy:check_daylight_power run scoreboard players add @s energy.storage {energy["generation"]}
execute if score @s energy.storage > @s energy.max_storage run scoreboard players operation @s energy.storage = @s energy.max_storage
"""
		write_function(f"{ns}:custom_blocks/{solar_panel}/second", content)
		write_function(f"{ns}:custom_blocks/{solar_panel}/place_secondary", """
# Fix scale
data modify entity @s transformation.scale[1] set value 1.005f
data modify entity @s transformation.translation[1] set value 0.002f
""")


	# Furnace Generators & Nether Star Generator
	for gen in ["nether_star_generator", *[x for x in Mem.definitions if x.endswith("_furnace_generator")]]:
		energy: JsonDict = Mem.definitions[gen]["custom_data"]["energy"]
		default_gui: str = gui[f"gui/{gen}.png"] if gen == "nether_star_generator" else gui["gui/advanced_furnace_generator.png"]
		working_gui: str = gui[f"gui/{gen}_on.png"] if gen == "nether_star_generator" else gui["gui/advanced_furnace_generator_on.png"]
		default_model: str = Mem.definitions[gen]["item_model"]
		working_model: str = default_model + "_on"
		gui_slot: int = 1 if gen == "nether_star_generator" else 0
		input_slot: int = 0 if gen == "nether_star_generator" else 1

		# If nether star generator, add logic to consume nether stars for fuel
		nether_star_generator: str = ""
		if gen == "nether_star_generator":
			nether_star_generator = f"""
# Consume nether stars for fuel
execute if data block ~ ~ ~ {{Items:[{{Slot:0b,id:"minecraft:nether_star"}}],lit_time_remaining:0s}} run function {ns}:custom_blocks/{gen}/consume_nether_star
"""
		# Write the second function for the generator
		content: str = f"""
# Prevent the furnace from really cooking
data modify block ~ ~ ~ cooking_total_time set value -200s
data modify block ~ ~ ~ cooking_time_spent set value 0s

# Stop if full energy
execute if score @s energy.storage >= @s energy.max_storage run return run function {ns}:custom_blocks/{gen}/stop
{nether_star_generator}

# Update the gui to default
execute store result score #burn_time {ns}.data run data get block ~ ~ ~ lit_time_remaining
execute if score #burn_time {ns}.data matches 0 run item replace block ~ ~ ~ container.{gui_slot} with cobblestone[item_model="{default_gui}",{COMMON_SIGNAL_HIDDEN}]
execute if score #burn_time {ns}.data matches 0 run data modify entity @s item.components."minecraft:item_model" set value "{default_model}"
execute if score #burn_time {ns}.data matches 1.. run item replace block ~ ~ ~ container.{gui_slot} with cobblestone[item_model="{working_gui}",{COMMON_SIGNAL_HIDDEN}]
execute if score #burn_time {ns}.data matches 1.. run data modify entity @s item.components."minecraft:item_model" set value "{working_model}"

# Update the gui & produce Energy while working
execute if score #burn_time {ns}.data matches 1.. run scoreboard players add @s energy.storage {energy["generation"]}
execute if score #burn_time {ns}.data matches 1.. run playsound {ns}:{gen} block @a[distance=..12] ~ ~ ~ 0.25
execute if score @s energy.storage > @s energy.max_storage run scoreboard players operation @s energy.storage = @s energy.max_storage
"""
		write_function(f"{ns}:custom_blocks/{gen}/second", content)
		write_function(f"{ns}:custom_blocks/{gen}/stop", f"""
item replace block ~ ~ ~ container.{gui_slot} with cobblestone[item_model="{default_gui}",{COMMON_SIGNAL_HIDDEN}]
data modify entity @s item.components."minecraft:item_model" set value "{default_model}"
""")

		if gen == "nether_star_generator":
			for item, fuel in (("nether_star", 18000),):	# 15 minutes
				write_function(f"{ns}:custom_blocks/{gen}/consume_{item}", f"""
data modify block ~ ~ ~ lit_time_remaining set value {fuel}s
execute store result score #count {ns}.data run data get block ~ ~ ~ Items[{{Slot:0b}}].count
scoreboard players remove #count {ns}.data 1
execute if score #count {ns}.data matches 1.. store result block ~ ~ ~ Items[{{Slot:0b}}].count int 1 run scoreboard players get #count {ns}.data
execute if score #count {ns}.data matches 0 run data remove block ~ ~ ~ Items[{{Slot:0b}}]
""")

		write_function(f"{ns}:custom_blocks/{gen}/place_secondary", f"""
# ItemIO compatibility
tag @s add itemio.container
tag @s add itemio.container.hopper
data modify entity @s item.components."minecraft:custom_data".itemio.ioconfig set value [{{"Slot":{input_slot},"mode":"input","allowed_side":{{"north":true,"south":true,"east":true,"west":true,"top":true}}}}]
function #itemio:calls/container/init
""")

	# Cobblestone Miners
	for miner in [x for x in Mem.definitions if x.startswith("cobblestone_miner_lv")]:
		lvl: int = int(miner.split("lv")[-1])
		per_minute: int = miners_formula(lvl - 1)

		# Calculate the optimal tier and count based on per_minute
		# Each tier represents 9x compression (9**(tier_index+1) cobblestones)
		tier_index: int = 0
		count: int = per_minute

		# Find the highest tier that can be used efficiently
		for i in range(len(COBBLESTONE_TIERS) - 1, -1, -1):
			tier_value = 9 ** (i + 1)  # 9, 81, 729, 6561, etc.
			if per_minute >= tier_value:
				tier_index = i
				count = per_minute // tier_value
				break
		tier: str = COBBLESTONE_TIERS[tier_index]

		write_function(f"{ns}:custom_blocks/{miner}/minute", f"""
# Stop if no cobblestone below
execute unless block ~ ~-1 ~ cobblestone run return fail

# Mine cobblestone directly below
setblock ~ ~-1 ~ air
playsound block.stone.break block @a[distance=..50]
particle block{{"block_state":"cobblestone"}} ~ ~-1 ~ .5 .5 .5 0 25 normal @a[distance=..50]
loot spawn ~ ~-1 ~ loot {ns}:cobblestone_miner/lv{lvl}
""")
		# Write the loot table for the miner
		Mem.ctx.data[ns].loot_tables[f"cobblestone_miner/lv{lvl}"] = set_json_encoder(LootTable({
			"pools": [
				{
					"rolls": 1,
					"bonus_rolls": 0,
					"entries": [
						{
							"type": "minecraft:loot_table",
							"value": f"{ns}:i/{tier}_cobblestone",
							"functions": [
								{
									"function": "minecraft:set_count",
									"count": count
								}
							]
						}
					]
				}
			]
		}), max_level=-1)

	# Mob Grinder
	energy: JsonDict = Mem.definitions["mob_grinder"]["custom_data"]["energy"]
	default_model: str = Mem.definitions["mob_grinder"]["item_model"]
	working_model: str = default_model + "_on"
	write_function(f"{ns}:custom_blocks/mob_grinder/second", f"""
# If not enough energy, update model and stop
execute unless score @s energy.storage matches {energy["usage"]}.. run return run data modify entity @s item.components."minecraft:item_model" set value "{default_model}"
data modify entity @s item.components."minecraft:item_model" set value "{working_model}"

# Consume energy ({energy["usage"]} per second)
scoreboard players remove @s energy.storage {energy["usage"] // 20}

# Kill mobs in front of the grinder
execute positioned ^ ^ ^3 as @e[type=#{ns}:mob_grinder,tag=!global.ignore,tag=!global.ignore.kill,tag=!{ns}.stardust_pillar,distance=..4] at @s run loot spawn ~ ~ ~ kill @s
execute positioned ^ ^ ^3 run kill @e[type=#{ns}:mob_grinder,tag=!global.ignore,tag=!global.ignore.kill,tag=!{ns}.stardust_pillar,distance=..4]
""")
	json_content: JsonDict = json_load(get_root_path(__file__) + "/mob_grinder.json")
	write_tag("mob_grinder", Mem.ctx.data[ns].entity_type_tags, json_content["values"])


	# Growth Accelerator
	energy: JsonDict = Mem.definitions["growth_accelerator"]["custom_data"]["energy"]
	write_function(f"{ns}:custom_blocks/growth_accelerator/second_5", f"""
# Consume 5 times kW energy
execute unless score @s energy.storage matches {energy["usage"] * 5}.. run return 0
scoreboard players remove @s energy.storage {energy["usage"] * 5}

# Timer to 1 minute, stop function if not yet reached
scoreboard players add @s {ns}.data 5
execute if score @s {ns}.data matches ..59 run return run title @a[distance=..5] actionbar [{{"score":{{"objective":"{ns}.data","name":"@s"}},"color":"aqua"}},{{"text":"/","color":"yellow"}},"60",{{"text":"s before activation","color":"yellow"}}]
scoreboard players reset @s {ns}.data

# Audio-visual effects when reaching 1 minute
playsound minecraft:block.beacon.activate block @a[distance=..50]
particle minecraft:happy_villager ~ ~ ~ 5 5 5 1 125 normal @a[distance=..50]

# Accelerate growth in a 10x10 area
scoreboard players set #count_y {ns}.data 21
execute positioned ~10 ~10 ~10 run function {ns}:custom_blocks/growth_accelerator/layer_y
scoreboard players reset #count_x
scoreboard players reset #count_y
scoreboard players reset #count_z

# Launch a signal for data packs that want their custom seed to be compatible.
function #stardust:calls/growth_accelerator
""")
	write_function(f"{ns}:custom_blocks/growth_accelerator/layer_y", f"""
# Loop through X axis
scoreboard players set #count_x {ns}.data 21
function {ns}:custom_blocks/growth_accelerator/layer_x

# Continue to next Y layer
scoreboard players remove #count_y {ns}.data 1
execute if score #count_y {ns}.data matches 1.. positioned ~ ~-1 ~ run function {ns}:custom_blocks/growth_accelerator/layer_y
""")
	write_function(f"{ns}:custom_blocks/growth_accelerator/layer_x", f"""
# Loop through Z axis
scoreboard players set #count_z {ns}.data 21
function {ns}:custom_blocks/growth_accelerator/layer_z

# Continue to next X column
scoreboard players remove #count_x {ns}.data 1
execute if score #count_x {ns}.data matches 1.. positioned ~-1 ~ ~ run function {ns}:custom_blocks/growth_accelerator/layer_x
""")
	all_crops: list[tuple[str, int]] = [
		("wheat", 7), ("carrots", 7), ("potatoes", 7), ("nether_wart", 3), ("beetroots", 3), ("melon_stem", 7),
		("pumpkin_stem", 7), ("sweet_berry_bush", 3), ("cave_vines", 25), ("cave_vines_plant", 1)
	]
	write_function(f"{ns}:custom_blocks/growth_accelerator/layer_z", f"""

# Loop through all crops
{"\n".join(f'execute if block ~ ~ ~ {block} run return run function {ns}:custom_blocks/growth_accelerator/blocks/{block}' for block, _ in all_crops)}

# Continue to next Z row
scoreboard players remove #count_z {ns}.data 1
execute if score #count_z {ns}.data matches 1.. positioned ~ ~ ~-1 run function {ns}:custom_blocks/growth_accelerator/layer_z
""")
	for block, max_age in all_crops:
		content: str = ""
		if block == "cave_vines_plant":
			content += "execute if block ~ ~ ~ cave_vines_plant[berries=false] run return run setblock ~ ~ ~ cave_vines_plant[berries=true] strict\n"
		else:
			for i in range(max_age + 1, 0, -1):
				content += f"execute if block ~ ~ ~ {block}[age={i - 1}] run return " + (f"run setblock ~ ~ ~ {block}[age={i}] strict\n" if i <= max_age else "0\n")
		write_function(f"{ns}:custom_blocks/growth_accelerator/blocks/{block}", content)
	write_function(f"{ns}:calls/stardust/growth_accelerator", f"""
# Boost stardust seed by +10 minutes (60s * 10)
scoreboard players set #boost_growth_time {ns}.data 600
execute positioned ~-10 ~-10 ~-10 as @e[tag={ns}.growing_seed,dx=20,dy=20,dz=20] run function {ns}:custom_blocks/minute
scoreboard players reset #boost_growth_time {ns}.data
""", tags=["stardust:calls/growth_accelerator"])

	# Quarry
	quarry(gui)

