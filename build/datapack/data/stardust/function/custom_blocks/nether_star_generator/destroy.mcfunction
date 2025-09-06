
#> stardust:custom_blocks/nether_star_generator/destroy
#
# @executed	as @e[type=item_display,tag=...,predicate=!stardust:check_vanilla_blocks] & at @s
#
# @within	stardust:custom_blocks/_groups/minecraft_barrel
#

# Datapack Energy
function energy:v1/api/break_machine

# Replace the item with the custom one
execute as @n[type=item,nbt={Item:{id:"minecraft:barrel"}},distance=..1] run function stardust:custom_blocks/nether_star_generator/replace_item

# Decrease count scores
scoreboard players remove #total_custom_blocks stardust.data 1
scoreboard players remove #total_vanilla_barrel stardust.data 1
scoreboard players remove #total_nether_star_generator stardust.data 1

# Kill the custom block entity
kill @s

