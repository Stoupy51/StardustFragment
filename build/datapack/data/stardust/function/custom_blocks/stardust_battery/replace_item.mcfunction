
#> stardust:custom_blocks/stardust_battery/replace_item
#
# @executed	as @n[type=item,nbt={Item:{id:"minecraft:warped_hyphae"}},distance=..1]
#
# @within	stardust:custom_blocks/stardust_battery/destroy [ as @n[type=item,nbt={Item:{id:"minecraft:warped_hyphae"}},distance=..1] ]
#

# Replace the item with the custom one
data modify entity @s Item.components set from storage stardust:items all.stardust_battery.components
data modify entity @s Item.id set from storage stardust:items all.stardust_battery.id

# Keep energy
function stardust:utils/keep_energy

