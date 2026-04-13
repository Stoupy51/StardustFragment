
#> stardust:custom_blocks/awakened_stardust_ore/destroy
#
# @executed	as @e[type=item_display,tag=stardust.custom_block,predicate=!stardust:advanced_check_vanilla_blocks] & at @s
#
# @within	stardust:custom_blocks/_groups/minecraft_polished_deepslate
#

# Replace the item with the custom one
execute as @n[type=item,nbt={Item:{id:"minecraft:polished_deepslate"}},distance=..1] run function stardust:custom_blocks/awakened_stardust_ore/replace_item

# Decrease count scores
scoreboard players remove #total_custom_blocks stardust.data 1
scoreboard players remove #total_vanilla_polished_deepslate stardust.data 1
scoreboard players remove #total_awakened_stardust_ore stardust.data 1

# Kill the custom block entity
kill @s

