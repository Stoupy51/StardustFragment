
#> stardust:v3.5.0/second
#
# @within	stardust:v3.5.0/tick
#

# Reset timer
scoreboard players set #second stardust.data 0

# Global counter for various features
scoreboard players add #global_second stardust.data 1

# Awakened Forge recipes
execute as @e[type=item,predicate=stardust:awakened_forge_input] at @s run function stardust:forge/second

# 1 second break detection (any custom block)
execute if score #total_custom_blocks stardust.data matches 1.. as @e[type=#stardust:custom_blocks,tag=stardust.custom_block,tag=!stardust.vanilla.minecraft_polished_deepslate,predicate=!stardust:advanced_check_vanilla_blocks] at @s run function stardust:custom_blocks/destroy

# Dimension transitions for entities
execute as @e[tag=!smithed.entity,tag=!global.ignore,tag=!smithed.strict,tag=!global.ignore.kill,predicate=stardust:transitions/outside] at @s run function stardust:dimensions/transitions/check

# Check for vanilla mobs in dimensions to convert to custom mobs
execute as @e[type=#stardust:mob_grinder,tag=!stardust.dim_checked] at @s run function stardust:mobs/check_dimension

# Loop through custom mobs displays entities (Skip if already ticking in a scheduled function)
execute unless score #mobs_loop_ticking stardust.data matches 1.. run function stardust:mobs/ticking

# Custom blocks second functions
execute if score #second_entities stardust.data matches 1.. as @e[tag=stardust.second] at @s run function stardust:custom_blocks/second

