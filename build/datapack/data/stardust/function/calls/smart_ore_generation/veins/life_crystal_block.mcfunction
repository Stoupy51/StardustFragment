
#> stardust:calls/smart_ore_generation/veins/life_crystal_block
#
# @within	stardust:calls/smart_ore_generation/generate_ores
#

# Try to find a random position adjacent to air in the region to generate the ore
function #smart_ore_generation:v1/slots/random_position

# Placing Life Crystal Block patch
execute at @s if block ~ ~ ~ #stardust:smart_ore_generation/life_crystal_block_provider positioned ~ ~1 ~ if block ~ ~ ~ #minecraft:air unless block ~ ~-1 ~ lava run function stardust:custom_blocks/life_crystal_block/place_main

