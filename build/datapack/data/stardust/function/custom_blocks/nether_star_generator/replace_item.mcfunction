
#> stardust:custom_blocks/nether_star_generator/replace_item
#
# @executed	as @n[type=item,nbt={Item:{id:"minecraft:barrel"}},distance=..1]
#
# @within	stardust:custom_blocks/nether_star_generator/destroy [ as @n[type=item,nbt={Item:{id:"minecraft:barrel"}},distance=..1] ]
#

# Replace the item with the custom one
data modify entity @s Item.components set from storage stardust:items all.nether_star_generator.components
data modify entity @s Item.id set from storage stardust:items all.nether_star_generator.id

