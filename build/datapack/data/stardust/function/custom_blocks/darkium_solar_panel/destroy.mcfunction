
#> stardust:custom_blocks/darkium_solar_panel/destroy
#
# @executed	as @e[type=item_display,tag=stardust.custom_block,predicate=!stardust:advanced_check_vanilla_blocks] & at @s
#
# @within	stardust:custom_blocks/_groups/minecraft_daylight_detector
#

# Datapack Energy
function energy:v1/api/break_machine

# Replace the item with the custom one
execute as @n[type=item,nbt={Item:{id:"minecraft:daylight_detector"}},distance=..1] run function stardust:custom_blocks/darkium_solar_panel/replace_item

# Decrease count scores
scoreboard players remove #total_custom_blocks stardust.data 1
scoreboard players remove #total_vanilla_daylight_detector stardust.data 1
scoreboard players remove #total_darkium_solar_panel stardust.data 1

# Kill the custom block entity
kill @s

# Decrease the number of entities with second tag
scoreboard players remove #second_entities stardust.data 1

