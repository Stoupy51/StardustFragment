
#> stardust:custom_blocks/growth_accelerator/replace_item
#
# @executed	as @n[type=item,nbt={Item:{id:"minecraft:diamond_block"}},distance=..1]
#
# @within	stardust:custom_blocks/growth_accelerator/destroy [ as @n[type=item,nbt={Item:{id:"minecraft:diamond_block"}},distance=..1] ]
#

# Replace the item with the custom one
data modify entity @s Item.components set from storage stardust:items all.growth_accelerator.components
data modify entity @s Item.id set from storage stardust:items all.growth_accelerator.id

