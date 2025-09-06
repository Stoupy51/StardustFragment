
#> stardust:custom_blocks/advanced_furnace_generator/replace_item
#
# @executed	as @n[type=item,nbt={Item:{id:"minecraft:barrel"}},distance=..1]
#
# @within	stardust:custom_blocks/advanced_furnace_generator/destroy [ as @n[type=item,nbt={Item:{id:"minecraft:barrel"}},distance=..1] ]
#

data modify entity @s Item.components set from storage stardust:items all.advanced_furnace_generator.components
data modify entity @s Item.id set from storage stardust:items all.advanced_furnace_generator.id

