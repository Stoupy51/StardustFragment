
## Try to find a random position adjacent to air in the region to generate the ore
function #smart_ore_generation:v1/slots/random_position

# Placing Life Crystal
scoreboard players set #max smart_ore_generation.data 4
function stardust:utils/get_random
execute if score #random smart_ore_generation.data matches 1 at @s run tp @s ~ ~ ~ ~50 ~
execute if score #random smart_ore_generation.data matches 2 at @s run tp @s ~ ~ ~ ~150 ~
execute if score #random smart_ore_generation.data matches 3 at @s run tp @s ~ ~ ~ ~250 ~
execute at @s unless block ~ ~ ~ #simplenergy:non_solid positioned ~ ~1 ~ if block ~ ~ ~ air if block ~ ~1 ~ air if block ~ ~2 ~ air run function stardust:place/life_crystal/

