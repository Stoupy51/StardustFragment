
#> stardust:custom_blocks/celestial_portal/replace_item
#
# @executed	as @n[type=item,nbt={Item:{id:"minecraft:iron_block"}},distance=..1]
#
# @within	stardust:custom_blocks/celestial_portal/destroy [ as @n[type=item,nbt={Item:{id:"minecraft:iron_block"}},distance=..1] ]
#

# Replace the item with the custom one
data modify entity @s Item.components set from storage stardust:items all.celestial_portal.components
data modify entity @s Item.id set from storage stardust:items all.celestial_portal.id

