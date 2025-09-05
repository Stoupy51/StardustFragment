
#> stardust:custom_blocks/solarium_solar_panel/destroy
#
# @executed	as @e[type=item_display,tag=...,predicate=!stardust:check_vanilla_blocks] & at @s
#
# @within	stardust:custom_blocks/_groups/minecraft_daylight_detector
#

# Replace the item with the custom one
execute as @n[type=item,nbt={Item:{id:"minecraft:daylight_detector"}},distance=..1] run function stardust:custom_blocks/solarium_solar_panel/replace_item

# Decrease count scores
scoreboard players remove #total_custom_blocks stardust.data 1
scoreboard players remove #total_vanilla_daylight_detector stardust.data 1
scoreboard players remove #total_solarium_solar_panel stardust.data 1

# Kill the custom block entity
kill @s

