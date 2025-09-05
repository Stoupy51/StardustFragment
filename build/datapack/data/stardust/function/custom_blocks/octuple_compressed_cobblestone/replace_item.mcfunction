
#> stardust:custom_blocks/octuple_compressed_cobblestone/replace_item
#
# @executed	as @n[type=item,nbt={Item:{id:"minecraft:obsidian"}},distance=..1]
#
# @within	stardust:custom_blocks/octuple_compressed_cobblestone/destroy [ as @n[type=item,nbt={Item:{id:"minecraft:obsidian"}},distance=..1] ]
#

data modify entity @s Item.components set from storage stardust:items all.octuple_compressed_cobblestone.components
data modify entity @s Item.id set from storage stardust:items all.octuple_compressed_cobblestone.id

