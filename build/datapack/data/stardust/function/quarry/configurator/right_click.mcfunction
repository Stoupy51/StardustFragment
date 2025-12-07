
#> stardust:quarry/configurator/right_click
#
# @executed	as the player & at current position
#
# @within	stardust:advancements/right_click
#

# Retrieve current configuration
execute store result score #config_x1 stardust.data run data get entity @s SelectedItem.components."minecraft:custom_data".stardust.quarry_x1
execute store result score #config_y1 stardust.data run data get entity @s SelectedItem.components."minecraft:custom_data".stardust.quarry_y1
execute store result score #config_z1 stardust.data run data get entity @s SelectedItem.components."minecraft:custom_data".stardust.quarry_z1
execute store result score #config_x2 stardust.data run data get entity @s SelectedItem.components."minecraft:custom_data".stardust.quarry_x2
execute store result score #config_y2 stardust.data run data get entity @s SelectedItem.components."minecraft:custom_data".stardust.quarry_y2
execute store result score #config_z2 stardust.data run data get entity @s SelectedItem.components."minecraft:custom_data".stardust.quarry_z2

# Remember if the player is sneaking
execute store success score #is_sneaking stardust.data if predicate stardust:is_sneaking

# Raycast to the block being looked at
tag @s add stardust.temp
function #bs.view:at_aimed_block {run:"function stardust:quarry/configurator/at_aimed_block",with:{data:{targeted_block:1b}}}

# Update player's item with new configuration
execute summon item_display run function stardust:quarry/configurator/update_custom_data
tag @s remove stardust.temp

