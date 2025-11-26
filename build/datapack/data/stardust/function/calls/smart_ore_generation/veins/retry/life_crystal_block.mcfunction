
#> stardust:calls/smart_ore_generation/veins/retry/life_crystal_block
#
# @within	stardust:calls/smart_ore_generation/veins/life_crystal_block
#			stardust:calls/smart_ore_generation/veins/retry/life_crystal_block [ at @s ]
#

# Find a random position in the region and decrease attempts
scoreboard players remove #attempts stardust.data 1
function #smart_ore_generation:v1/slots/random_position

# Retry if not placed and attempts remaining
execute if score #attempts stardust.data matches 1.. at @s unless block ~ ~1 ~ air run return run function stardust:calls/smart_ore_generation/veins/retry/life_crystal_block
execute if score #attempts stardust.data matches 1.. at @s if block ~ ~-1 ~ lava run return run function stardust:calls/smart_ore_generation/veins/retry/life_crystal_block

