
#> stardust:utils/keep_energy
#
# @executed	as @n[type=item,nbt={Item:{id:"minecraft:warped_hyphae"}},distance=..1]
#
# @within	stardust:custom_blocks/stardust_battery/replace_item
#			stardust:custom_blocks/awakened_stardust_battery/replace_item
#			stardust:custom_blocks/ultimate_battery/replace_item
#

# Prepare input for the update_energy_lore function
data modify storage energy:temp list set value []
data modify storage energy:temp list append from entity @s Item
execute store result storage energy:temp list[0].components."minecraft:custom_data".energy.storage int 1 run scoreboard players get #storage stardust.data

# Call the update_energy_lore function
function stardust:calls/update_energy_lore/main

# Prevent stack with other batteries
execute store result storage energy:temp list[0].components."minecraft:custom_data".stardust.not_stackable int 1 run scoreboard players get #stack stardust.data
scoreboard players add #stack stardust.data 1

# Update the item
data modify entity @s Item.components set from storage energy:temp list[0].components

