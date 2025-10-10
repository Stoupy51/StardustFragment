
#> stardust:custom_blocks/cobblestone_miner_lv1/replace_item
#
# @executed	as @n[type=item,nbt={Item:{id:"minecraft:deepslate"}},distance=..1]
#
# @within	stardust:custom_blocks/cobblestone_miner_lv1/destroy [ as @n[type=item,nbt={Item:{id:"minecraft:deepslate"}},distance=..1] ]
#

# Replace the item with the custom one
data modify entity @s Item.components set from storage stardust:items all.cobblestone_miner_lv1.components
data modify entity @s Item.id set from storage stardust:items all.cobblestone_miner_lv1.id

