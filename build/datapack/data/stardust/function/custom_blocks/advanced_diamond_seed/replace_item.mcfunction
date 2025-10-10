
#> stardust:custom_blocks/advanced_diamond_seed/replace_item
#
# @executed	as @n[type=item,nbt={Item:{id:"minecraft:moss_carpet"}},distance=..1]
#
# @within	stardust:custom_blocks/advanced_diamond_seed/destroy [ as @n[type=item,nbt={Item:{id:"minecraft:moss_carpet"}},distance=..1] ]
#

data modify entity @s Item.components set from storage stardust:items all.advanced_diamond_seed.components
data modify entity @s Item.id set from storage stardust:items all.advanced_diamond_seed.id

# Check if the seed is fully grown
function stardust:custom_blocks/advanced_diamond_seed/is_fully_grown

