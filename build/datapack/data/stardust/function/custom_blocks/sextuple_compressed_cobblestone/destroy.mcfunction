
#> stardust:custom_blocks/sextuple_compressed_cobblestone/destroy
#
# @executed	as @e[type=item_display,tag=...,predicate=!stardust:check_vanilla_blocks] & at @s
#
# @within	stardust:custom_blocks/_groups/minecraft_obsidian
#

# Replace the item with the custom one
execute as @n[type=item,nbt={Item:{id:"minecraft:obsidian"}},distance=..1] run function stardust:custom_blocks/sextuple_compressed_cobblestone/replace_item

# Decrease count scores
scoreboard players remove #total_custom_blocks stardust.data 1
scoreboard players remove #total_vanilla_obsidian stardust.data 1
scoreboard players remove #total_sextuple_compressed_cobblestone stardust.data 1

# Kill the custom block entity
kill @s

