
#> stardust:custom_blocks/triple_compressed_cobblestone/replace_item
#
# @executed	as @n[type=item,nbt={Item:{id:"minecraft:deepslate"}},distance=..1]
#
# @within	stardust:custom_blocks/triple_compressed_cobblestone/destroy [ as @n[type=item,nbt={Item:{id:"minecraft:deepslate"}},distance=..1] ]
#

# Replace the item with the custom one
data modify entity @s Item.components set from storage stardust:items all.triple_compressed_cobblestone.components
data modify entity @s Item.id set from storage stardust:items all.triple_compressed_cobblestone.id

