
#> stardust:custom_blocks/ultimate_cable/replace_item
#
# @executed	as @n[type=item,nbt={Item:{id:"minecraft:player_head"}},distance=..1]
#
# @within	stardust:custom_blocks/ultimate_cable/destroy [ as @n[type=item,nbt={Item:{id:"minecraft:player_head"}},distance=..1] ]
#

data modify entity @s Item.components set from storage stardust:items all.ultimate_cable.components
data modify entity @s Item.id set from storage stardust:items all.ultimate_cable.id

