
#> stardust:custom_blocks/ultimate_cable/destroy
#
# @executed	as @e[type=item_display,tag=...,predicate=!stardust:check_vanilla_blocks] & at @s
#
# @within	stardust:custom_blocks/_groups/minecraft_player_head
#

# Replace the item with the custom one
execute as @n[type=item,nbt={Item:{id:"minecraft:player_head"}},distance=..1] run function stardust:custom_blocks/ultimate_cable/replace_item

# Decrease count scores
scoreboard players remove #total_custom_blocks stardust.data 1
scoreboard players remove #total_vanilla_player_head stardust.data 1
scoreboard players remove #total_ultimate_cable stardust.data 1

# Kill the custom block entity
kill @s

