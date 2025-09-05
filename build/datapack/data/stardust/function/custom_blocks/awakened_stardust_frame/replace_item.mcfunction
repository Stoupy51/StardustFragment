
#> stardust:custom_blocks/awakened_stardust_frame/replace_item
#
# @executed	as @n[type=item,nbt={Item:{id:"minecraft:redstone_block"}},distance=..1]
#
# @within	stardust:custom_blocks/awakened_stardust_frame/destroy [ as @n[type=item,nbt={Item:{id:"minecraft:redstone_block"}},distance=..1] ]
#

data modify entity @s Item.components set from storage stardust:items all.awakened_stardust_frame.components
data modify entity @s Item.id set from storage stardust:items all.awakened_stardust_frame.id

