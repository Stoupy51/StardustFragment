
#> stardust:v3.5.0/second
#
# @within	stardust:v3.5.0/tick
#

# Reset timer
scoreboard players set #second stardust.data 0

# 1 second break detection (any custom block)
execute if score #total_custom_blocks stardust.data matches 1.. as @e[type=#stardust:custom_blocks,tag=stardust.custom_block,tag=!stardust.vanilla.minecraft_polished_deepslate,predicate=!stardust:advanced_check_vanilla_blocks] at @s run function stardust:custom_blocks/destroy

# Custom blocks second functions
execute if score #second_entities stardust.data matches 1.. as @e[tag=stardust.second] at @s run function stardust:custom_blocks/second

