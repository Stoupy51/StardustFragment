
#> stardust:custom_blocks/celestial_portal/destroy
#
# @executed	as @e[type=#stardust:custom_blocks,tag=...,predicate=!stardust:advanced_check_vanilla_blocks] & at @s
#
# @within	stardust:custom_blocks/_groups/minecraft_iron_block
#

# Datapack Energy
function energy:v1/api/break_machine

# Replace the item with the custom one
execute as @n[type=item,nbt={Item:{id:"minecraft:iron_block"}},distance=..1] run function stardust:custom_blocks/celestial_portal/replace_item

# Decrease count scores
scoreboard players remove #total_custom_blocks stardust.data 1
scoreboard players remove #total_vanilla_iron_block stardust.data 1
scoreboard players remove #total_celestial_portal stardust.data 1

# Kill the custom block entity
kill @s

# Decrease the number of entities with second tag
scoreboard players remove #second_entities stardust.data 1

