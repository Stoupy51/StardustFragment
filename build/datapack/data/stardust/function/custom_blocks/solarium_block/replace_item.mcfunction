
#> stardust:custom_blocks/solarium_block/replace_item
#
# @executed	as @n[type=item,nbt={Item:{id:"minecraft:waxed_copper_block"}},distance=..1]
#
# @within	stardust:custom_blocks/solarium_block/destroy [ as @n[type=item,nbt={Item:{id:"minecraft:waxed_copper_block"}},distance=..1] ]
#

data modify entity @s Item.components set from storage stardust:items all.solarium_block.components
data modify entity @s Item.id set from storage stardust:items all.solarium_block.id

