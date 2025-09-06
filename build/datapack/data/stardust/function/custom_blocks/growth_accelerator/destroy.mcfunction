
#> stardust:custom_blocks/growth_accelerator/destroy
#
# @executed	as @e[type=item_display,tag=...,predicate=!stardust:check_vanilla_blocks] & at @s
#
# @within	stardust:custom_blocks/_groups/minecraft_diamond_block
#

# Datapack Energy
function energy:v1/api/break_machine

# Replace the item with the custom one
execute as @n[type=item,nbt={Item:{id:"minecraft:diamond_block"}},distance=..1] run function stardust:custom_blocks/growth_accelerator/replace_item

# Decrease count scores
scoreboard players remove #total_custom_blocks stardust.data 1
scoreboard players remove #total_vanilla_diamond_block stardust.data 1
scoreboard players remove #total_growth_accelerator stardust.data 1

# Kill the custom block entity
kill @s

