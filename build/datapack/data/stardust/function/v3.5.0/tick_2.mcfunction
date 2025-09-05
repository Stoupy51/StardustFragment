
#> stardust:v3.5.0/tick_2
#
# @within	stardust:v3.5.0/tick
#

# Reset timer
scoreboard players set #tick_2 stardust.data 1

# 2 ticks destroy detection (item_display only)
execute if score #total_custom_blocks stardust.data matches 1.. as @e[type=item_display,tag=stardust.custom_block,tag=!stardust.vanilla.minecraft_polished_deepslate,predicate=!stardust:check_vanilla_blocks] at @s run function stardust:custom_blocks/destroy

