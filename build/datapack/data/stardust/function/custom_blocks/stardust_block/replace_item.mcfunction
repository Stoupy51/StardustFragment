
#> stardust:custom_blocks/stardust_block/replace_item
#
# @executed	as @n[type=item,nbt={Item:{id:"minecraft:lapis_block"}},distance=..1]
#
# @within	stardust:custom_blocks/stardust_block/destroy [ as @n[type=item,nbt={Item:{id:"minecraft:lapis_block"}},distance=..1] ]
#

# Replace the item with the custom one
data modify entity @s Item.components set from storage stardust:items all.stardust_block.components
data modify entity @s Item.id set from storage stardust:items all.stardust_block.id

