
#> stardust:custom_blocks/stardust_cable/replace_item
#
# @executed	as @n[type=item,nbt={Item:{id:"minecraft:player_head"}},distance=..1]
#
# @within	stardust:custom_blocks/stardust_cable/destroy [ as @n[type=item,nbt={Item:{id:"minecraft:player_head"}},distance=..1] ]
#

# Replace the item with the custom one
data modify entity @s Item.components set from storage stardust:items all.stardust_cable.components
data modify entity @s Item.id set from storage stardust:items all.stardust_cable.id

