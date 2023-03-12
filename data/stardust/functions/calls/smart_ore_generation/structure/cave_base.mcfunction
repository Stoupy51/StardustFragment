
## Try to find a random position adjacent to air in the region to generate the ore
function #smart_ore_generation:v1/slots/random_position

# Placing Cave Base
scoreboard players set #max smart_ore_generation.data 4
function stardust:utils/get_random
scoreboard players set #success stardust.data 0
execute at @s unless block ~ ~ ~ #simplenergy:non_solid positioned ~ ~1 ~ if block ~ ~ ~ air if block ~ ~1 ~ air if block ~ ~2 ~ air run scoreboard players set #success stardust.data 1
execute if score #success stardust.data matches 0 run scoreboard players set #random smart_ore_generation.data -1
execute if score #random smart_ore_generation.data matches 0.. at @s if block ~ ~ ~ deepslate run scoreboard players add #random smart_ore_generation.data 10

execute if score #random smart_ore_generation.data matches 0 at @s run place template stardust:cave_base_stone ~ ~-10 ~ none
execute if score #random smart_ore_generation.data matches 1 at @s run place template stardust:cave_base_stone ~ ~-10 ~ clockwise_90
execute if score #random smart_ore_generation.data matches 2 at @s run place template stardust:cave_base_stone ~ ~-10 ~ 180
execute if score #random smart_ore_generation.data matches 3 at @s run place template stardust:cave_base_stone ~ ~-10 ~ counterclockwise_90
execute if score #random smart_ore_generation.data matches 10 at @s run place template stardust:cave_base_deepslate ~ ~-10 ~ none
execute if score #random smart_ore_generation.data matches 11 at @s run place template stardust:cave_base_deepslate ~ ~-10 ~ clockwise_90
execute if score #random smart_ore_generation.data matches 12 at @s run place template stardust:cave_base_deepslate ~ ~-10 ~ 180
execute if score #random smart_ore_generation.data matches 13 at @s run place template stardust:cave_base_deepslate ~ ~-10 ~ counterclockwise_90

