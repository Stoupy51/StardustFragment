
#> stardust:custom_blocks/legendarium_block/replace_item
#
# @executed	as @n[type=item,nbt={Item:{id:"minecraft:emerald_block"}},distance=..1]
#
# @within	stardust:custom_blocks/legendarium_block/destroy [ as @n[type=item,nbt={Item:{id:"minecraft:emerald_block"}},distance=..1] ]
#

data modify entity @s Item.components set from storage stardust:items all.legendarium_block.components
data modify entity @s Item.id set from storage stardust:items all.legendarium_block.id

