
#> stardust:v3.5.0/second
#
# @within	stardust:v3.5.0/tick
#

# Reset timer
scoreboard players set #second stardust.data 0

# 1 second break detection
execute if score #total_custom_blocks stardust.data matches 1.. as @e[type=item_display,tag=stardust.custom_block,tag=!stardust.vanilla.minecraft_polished_deepslate,predicate=!stardust:advanced_check_vanilla_blocks] at @s run function stardust:custom_blocks/destroy

