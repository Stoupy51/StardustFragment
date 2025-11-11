
#> stardust:v3.5.0/minute
#
# @within	stardust:v3.5.0/tick
#

# Reset timer
scoreboard players set #minute stardust.data 1

# Get world spawn position and dimension every minute
execute summon marker run function stardust:utils/get_world_spawn_from_marker

# Custom blocks minute functions
execute if score #minute_entities stardust.data matches 1.. as @e[tag=stardust.minute] at @s run function stardust:custom_blocks/minute

