
## Try to find a random position adjacent to air in the region to generate the ore
function #smart_ore_generation:v1/slots/random_position

# Placing Awakened Stardust Ore Patch
execute at @s if block ~ ~ ~ #stardust:for_stardust_ore run scoreboard players add AwakenedStardustOreCount stardust.advanced_stats 1
execute at @s if block ~ ~ ~ #stardust:for_stardust_ore run function stardust:place/awakened_stardust_ore/optimized_for_generation

