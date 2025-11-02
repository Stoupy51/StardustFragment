
#> stardust:custom_blocks/advanced_diamond_seed/destroy
#
# @executed	as @e[type=#stardust:custom_blocks,tag=...,predicate=!stardust:advanced_check_vanilla_blocks] & at @s
#
# @within	stardust:custom_blocks/_groups/minecraft_moss_carpet
#

# Replace the item with the custom one
scoreboard players operation #growth_time stardust.data = @s stardust.growth_time
execute as @n[type=item,nbt={Item:{id:"minecraft:moss_carpet"}},distance=..1] run function stardust:custom_blocks/advanced_diamond_seed/replace_item

# Decrease count scores
scoreboard players remove #total_custom_blocks stardust.data 1
scoreboard players remove #total_vanilla_moss_carpet stardust.data 1
scoreboard players remove #total_advanced_diamond_seed stardust.data 1

# Kill the custom block entity
kill @s

# Decrease the number of entities with minute tag
scoreboard players remove #minute_entities stardust.data 1

