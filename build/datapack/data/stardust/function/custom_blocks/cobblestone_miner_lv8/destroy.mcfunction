
#> stardust:custom_blocks/cobblestone_miner_lv8/destroy
#
# @executed	as @e[type=#stardust:custom_blocks,tag=...,predicate=!stardust:advanced_check_vanilla_blocks] & at @s
#
# @within	stardust:custom_blocks/_groups/minecraft_deepslate
#

# Replace the item with the custom one
execute as @n[type=item,nbt={Item:{id:"minecraft:deepslate"}},distance=..1] run function stardust:custom_blocks/cobblestone_miner_lv8/replace_item

# Decrease count scores
scoreboard players remove #total_custom_blocks stardust.data 1
scoreboard players remove #total_vanilla_deepslate stardust.data 1
scoreboard players remove #total_cobblestone_miner_lv8 stardust.data 1

# Kill the custom block entity
kill @s

