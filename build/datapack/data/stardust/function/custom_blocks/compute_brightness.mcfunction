
#> stardust:custom_blocks/compute_brightness
#
# @executed	as @e[type=item_display,tag=stardust.custom_block,sort=random,limit=50] & at @s
#
# @within	stardust:v4.0.6/second_5 [ as @e[type=item_display,tag=stardust.custom_block,sort=random,limit=50] & at @s ]
#			stardust:custom_blocks/stardust_core/place_secondary
#			stardust:custom_blocks/stardust_block/place_secondary
#			stardust:custom_blocks/stardust_ore/place_secondary
#			stardust:custom_blocks/deepslate_stardust_ore/place_secondary
#			stardust:custom_blocks/nether_stardust_ore/place_secondary
#			stardust:custom_blocks/ender_stardust_ore/place_secondary
#			stardust:custom_blocks/awakened_stardust_block/place_secondary
#			stardust:custom_blocks/awakened_stardust_ore/place_secondary
#			stardust:custom_blocks/legendarium_block/place_secondary
#			stardust:custom_blocks/solarium_block/place_secondary
#			stardust:custom_blocks/darkium_block/place_secondary
#			stardust:custom_blocks/compressed_cobblestone/place_secondary
#			stardust:custom_blocks/double_compressed_cobblestone/place_secondary
#			stardust:custom_blocks/triple_compressed_cobblestone/place_secondary
#			stardust:custom_blocks/quadruple_compressed_cobblestone/place_secondary
#			stardust:custom_blocks/quintuple_compressed_cobblestone/place_secondary
#			stardust:custom_blocks/sextuple_compressed_cobblestone/place_secondary
#			stardust:custom_blocks/septuple_compressed_cobblestone/place_secondary
#			stardust:custom_blocks/octuple_compressed_cobblestone/place_secondary
#			stardust:custom_blocks/stardust_frame/place_secondary
#			stardust:custom_blocks/awakened_stardust_frame/place_secondary
#			stardust:custom_blocks/ultimate_frame/place_secondary
#			stardust:custom_blocks/stardust_cable/place_secondary
#			stardust:custom_blocks/awakened_stardust_cable/place_secondary
#			stardust:custom_blocks/ultimate_cable/place_secondary
#			stardust:custom_blocks/stardust_battery/place_secondary
#			stardust:custom_blocks/awakened_stardust_battery/place_secondary
#			stardust:custom_blocks/ultimate_battery/place_secondary
#			stardust:custom_blocks/stardust_solar_panel/place_secondary
#			stardust:custom_blocks/awakened_stardust_solar_panel/place_secondary
#			stardust:custom_blocks/legendarium_solar_panel/place_secondary
#			stardust:custom_blocks/solarium_solar_panel/place_secondary
#			stardust:custom_blocks/darkium_solar_panel/place_secondary
#			stardust:custom_blocks/ultimate_solar_panel/place_secondary
#			stardust:custom_blocks/quarry_lv1/place_secondary
#			stardust:custom_blocks/quarry_lv2/place_secondary
#			stardust:custom_blocks/quarry_lv3/place_secondary
#			stardust:custom_blocks/quarry_lv4/place_secondary
#			stardust:custom_blocks/quarry_lv5/place_secondary
#			stardust:custom_blocks/quarry_creative/place_secondary
#			stardust:custom_blocks/cavern_portal/place_secondary
#			stardust:custom_blocks/celestial_portal/place_secondary
#			stardust:custom_blocks/stardust_portal/place_secondary
#			stardust:custom_blocks/stardust_dungeon_portal/place_secondary
#			stardust:custom_blocks/ultimate_portal/place_secondary
#			stardust:custom_blocks/growth_accelerator/place_secondary
#			stardust:custom_blocks/mob_grinder/place_secondary
#			stardust:custom_blocks/nether_star_generator/place_secondary
#			stardust:custom_blocks/advanced_furnace_generator/place_secondary
#			stardust:custom_blocks/stardust_furnace_generator/place_secondary
#			stardust:custom_blocks/awakened_stardust_furnace_generator/place_secondary
#			stardust:custom_blocks/life_crystal_block/place_secondary
#			stardust:custom_blocks/diamond_seed/place_secondary
#			stardust:custom_blocks/advanced_diamond_seed/place_secondary
#			stardust:custom_blocks/stardust_seed/place_secondary
#			stardust:custom_blocks/advanced_stardust_seed/place_secondary
#			stardust:custom_blocks/elite_stardust_seed/place_secondary
#			stardust:custom_blocks/legendarium_seed/place_secondary
#			stardust:custom_blocks/solarium_seed/place_secondary
#			stardust:custom_blocks/darkium_seed/place_secondary
#			stardust:custom_blocks/cobblestone_miner_lv1/place_secondary
#			stardust:custom_blocks/cobblestone_miner_lv2/place_secondary
#			stardust:custom_blocks/cobblestone_miner_lv3/place_secondary
#			stardust:custom_blocks/cobblestone_miner_lv4/place_secondary
#			stardust:custom_blocks/cobblestone_miner_lv5/place_secondary
#			stardust:custom_blocks/cobblestone_miner_lv6/place_secondary
#			stardust:custom_blocks/cobblestone_miner_lv7/place_secondary
#			stardust:custom_blocks/cobblestone_miner_lv8/place_secondary
#

# Reset light score
scoreboard players set #light stardust.data 0

# Check all 6 neighboring positions
execute if score #light stardust.data matches ..14 positioned ~ ~1 ~ run function stardust:custom_blocks/check_light
execute if score #light stardust.data matches ..14 positioned ~ ~-1 ~ run function stardust:custom_blocks/check_light
execute if score #light stardust.data matches ..14 positioned ~1 ~ ~ run function stardust:custom_blocks/check_light
execute if score #light stardust.data matches ..14 positioned ~-1 ~ ~ run function stardust:custom_blocks/check_light
execute if score #light stardust.data matches ..14 positioned ~ ~ ~1 run function stardust:custom_blocks/check_light
execute if score #light stardust.data matches ..14 positioned ~ ~ ~-1 run function stardust:custom_blocks/check_light

# Apply computed brightness to the entity
data merge entity @s {brightness:{block:0,sky:0}}
execute store result entity @s brightness.block int 1 run scoreboard players get #light stardust.data
execute store result entity @s brightness.sky int 1 run scoreboard players get #light stardust.data

