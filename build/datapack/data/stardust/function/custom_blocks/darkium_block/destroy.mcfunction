
#> stardust:custom_blocks/darkium_block/destroy
#
# @executed	as @e[type=#stardust:custom_blocks,tag=...,predicate=!stardust:advanced_check_vanilla_blocks] & at @s
#
# @within	stardust:custom_blocks/_groups/minecraft_netherite_block
#

# Replace the item with the custom one
execute as @n[type=item,nbt={Item:{id:"minecraft:netherite_block"}},distance=..1] run function stardust:custom_blocks/darkium_block/replace_item

# Decrease count scores
scoreboard players remove #total_custom_blocks stardust.data 1
scoreboard players remove #total_vanilla_netherite_block stardust.data 1
scoreboard players remove #total_darkium_block stardust.data 1

# Kill the custom block entity
kill @s

