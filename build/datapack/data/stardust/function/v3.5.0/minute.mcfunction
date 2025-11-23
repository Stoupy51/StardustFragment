
#> stardust:v3.5.0/minute
#
# @within	stardust:v3.5.0/tick
#

# Reset timer
scoreboard players set #minute stardust.data 1

# Get world spawn position and dimension every minute
execute summon marker run function stardust:utils/get_world_spawn_from_marker

# Remove bossbars
function stardust:mobs/remove_bossbars

# Dog Excrement production (about 1 every 20 minutes per wolf)
execute at @e[type=minecraft:wolf,tag=!smithed.entity,tag=!global.ignore,predicate=stardust:random/0.05] run loot spawn ~ ~ ~ loot stardust:i/dog_excrement

# Custom blocks minute functions
execute if score #minute_entities stardust.data matches 1.. as @e[tag=stardust.minute] at @s run function stardust:custom_blocks/minute

