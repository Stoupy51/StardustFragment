
#> stardust:calls/smart_ore_generation/veins/life_crystal_block
#
# @within	stardust:calls/smart_ore_generation/generate_ores
#

# Try to find a random position below air but not below lava in the region to generate the ore
scoreboard players set #attempts stardust.data 50
function stardust:calls/smart_ore_generation/veins/retry/life_crystal_block

# Placing Life Crystal Block patch
execute at @s if block ~ ~ ~ #stardust:smart_ore_generation/life_crystal_block_provider positioned ~ ~1 ~ if block ~ ~ ~ #minecraft:air unless block ~ ~-1 ~ lava run function stardust:custom_blocks/life_crystal_block/place_main

