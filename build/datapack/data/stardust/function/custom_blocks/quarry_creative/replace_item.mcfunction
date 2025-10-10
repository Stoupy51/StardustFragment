
#> stardust:custom_blocks/quarry_creative/replace_item
#
# @executed	as @n[type=item,nbt={Item:{id:"minecraft:barrel"}},distance=..1]
#
# @within	stardust:custom_blocks/quarry_creative/destroy [ as @n[type=item,nbt={Item:{id:"minecraft:barrel"}},distance=..1] ]
#

# Replace the item with the custom one
data modify entity @s Item.components set from storage stardust:items all.quarry_creative.components
data modify entity @s Item.id set from storage stardust:items all.quarry_creative.id

