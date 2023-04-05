
#> stardust:boss/ultimate_boss/orb/random_pos
#
# @within			stardust:boss/ultimate_boss/orb/summon
# @executed			in stardust:ultimate
#
# @description		Search a random position for the orb
#

# Get 3 random numbers between 0 and 80 for X and Z, and between 0 and 20 for Y
scoreboard players set #max smart_ore_generation.data 80
function stardust:utils/get_random
scoreboard players operation #x stardust.data = #random smart_ore_generation.data
function stardust:utils/get_random
scoreboard players operation #z stardust.data = #random smart_ore_generation.data
scoreboard players set #max smart_ore_generation.data 20
function stardust:utils/get_random
scoreboard players operation #y stardust.data = #random smart_ore_generation.data

# Get entity coordinates, add the random numbers and remove 40 to get the coordinates of the center of the area
execute store result score #pos_x stardust.data run data get entity @s Pos[0] 1
execute store result score #pos_y stardust.data run data get entity @s Pos[1] 1
execute store result score #pos_z stardust.data run data get entity @s Pos[2] 1
scoreboard players operation #pos_x stardust.data += #x stardust.data
scoreboard players operation #pos_y stardust.data += #y stardust.data
scoreboard players operation #pos_z stardust.data += #z stardust.data
scoreboard players remove #pos_x stardust.data 40
scoreboard players remove #pos_z stardust.data 40

# Apply the new coordinates to the entity
execute store result entity @s Pos[0] double 1 run scoreboard players get #pos_x stardust.data
execute store result entity @s Pos[1] double 1 run scoreboard players get #pos_y stardust.data
execute store result entity @s Pos[2] double 1 run scoreboard players get #pos_z stardust.data

# Summon the orb if the position is valid
execute at @s if block ~ ~ ~ #stardust:non_solid if block ~ ~-1 ~ #stardust:non_solid if block ~ ~1 ~ #stardust:non_solid if block ~ ~ ~1 #stardust:non_solid if block ~ ~ ~-1 #stardust:non_solid if block ~1 ~ ~ #stardust:non_solid if block ~-1 ~ ~ #stardust:non_solid run function stardust:boss/ultimate_boss/orb/entity

# Kill the marker
kill @s

# Summon recursively if there is no orb
execute unless entity @e[type=iron_golem,tag=stardust.ultimate_orb,limit=1] run function stardust:boss/ultimate_boss/orb/summon

