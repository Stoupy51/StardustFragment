
#> stardust:custom_blocks/life_crystal_block/replace_item
#
# @executed	as @n[type=item,nbt={Item:{id:"minecraft:glass"}},distance=..1]
#
# @within	stardust:custom_blocks/life_crystal_block/destroy [ as @n[type=item,nbt={Item:{id:"minecraft:glass"}},distance=..1] ]
#

data modify entity @s Item.components set from storage stardust:items all.life_crystal_block.components
data modify entity @s Item.id set from storage stardust:items all.life_crystal_block.id

