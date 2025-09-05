
#> stardust:v3.5.0/second_5
#
# @within	stardust:v3.5.0/tick
#

# Reset timer
scoreboard players set #second_5 stardust.data -10

# 5 seconds break detection (item display only)
execute if score #total_custom_blocks stardust.data matches 1.. as @e[type=item_display,tag=stardust.custom_block,predicate=!stardust:advanced_check_vanilla_blocks] at @s run function stardust:custom_blocks/destroy

