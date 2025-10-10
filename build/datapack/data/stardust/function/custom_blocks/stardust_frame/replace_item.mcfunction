
#> stardust:custom_blocks/stardust_frame/replace_item
#
# @executed	as @n[type=item,nbt={Item:{id:"minecraft:lapis_block"}},distance=..1]
#
# @within	stardust:custom_blocks/stardust_frame/destroy [ as @n[type=item,nbt={Item:{id:"minecraft:lapis_block"}},distance=..1] ]
#

# Replace the item with the custom one
data modify entity @s Item.components set from storage stardust:items all.stardust_frame.components
data modify entity @s Item.id set from storage stardust:items all.stardust_frame.id

