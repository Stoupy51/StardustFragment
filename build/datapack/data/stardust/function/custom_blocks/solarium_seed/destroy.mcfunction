
#> stardust:custom_blocks/solarium_seed/destroy
#
# @executed	as @e[type=item_display,tag=...,predicate=!stardust:check_vanilla_blocks] & at @s
#
# @within	stardust:custom_blocks/_groups/minecraft_item_frame
#

# Replace the item with the custom one
execute as @n[type=item,nbt={Item:{components:{"minecraft:custom_data":{"stardust":{"item_frame_destroy":true}}}}},distance=..1] run function stardust:custom_blocks/solarium_seed/replace_item

# Decrease count scores
scoreboard players remove #total_custom_blocks stardust.data 1
scoreboard players remove #total_vanilla_item_frame stardust.data 1
scoreboard players remove #total_solarium_seed stardust.data 1

# Kill the custom block entity
kill @s

