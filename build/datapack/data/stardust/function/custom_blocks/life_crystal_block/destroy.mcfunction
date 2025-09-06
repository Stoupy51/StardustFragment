
#> stardust:custom_blocks/life_crystal_block/destroy
#
# @executed	as @e[type=item_display,tag=...,predicate=!stardust:check_vanilla_blocks] & at @s
#
# @within	stardust:custom_blocks/_groups/minecraft_glass
#

# Replace the item with the custom one
execute as @n[type=item,nbt={Item:{id:"minecraft:glass"}},distance=..1] run function stardust:custom_blocks/life_crystal_block/replace_item

# Decrease count scores
scoreboard players remove #total_custom_blocks stardust.data 1
scoreboard players remove #total_vanilla_glass stardust.data 1
scoreboard players remove #total_life_crystal_block stardust.data 1

# Kill the custom block entity
kill @s

