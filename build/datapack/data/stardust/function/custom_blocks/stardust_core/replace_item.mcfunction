
#> stardust:custom_blocks/stardust_core/replace_item
#
# @executed	as @n[type=item,nbt={Item:{id:"minecraft:diamond_block"}},distance=..1]
#
# @within	stardust:custom_blocks/stardust_core/destroy [ as @n[type=item,nbt={Item:{id:"minecraft:diamond_block"}},distance=..1] ]
#

data modify entity @s Item.components set from storage stardust:items all.stardust_core.components
data modify entity @s Item.id set from storage stardust:items all.stardust_core.id

