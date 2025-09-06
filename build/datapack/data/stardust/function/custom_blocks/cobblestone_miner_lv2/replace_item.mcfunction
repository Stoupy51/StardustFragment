
#> stardust:custom_blocks/cobblestone_miner_lv2/replace_item
#
# @executed	as @n[type=item,nbt={Item:{id:"minecraft:deepslate"}},distance=..1]
#
# @within	stardust:custom_blocks/cobblestone_miner_lv2/destroy [ as @n[type=item,nbt={Item:{id:"minecraft:deepslate"}},distance=..1] ]
#

data modify entity @s Item.components set from storage stardust:items all.cobblestone_miner_lv2.components
data modify entity @s Item.id set from storage stardust:items all.cobblestone_miner_lv2.id

