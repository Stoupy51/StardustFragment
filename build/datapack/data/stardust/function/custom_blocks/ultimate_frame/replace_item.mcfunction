
#> stardust:custom_blocks/ultimate_frame/replace_item
#
# @executed	as @n[type=item,nbt={Item:{id:"minecraft:crying_obsidian"}},distance=..1]
#
# @within	stardust:custom_blocks/ultimate_frame/destroy [ as @n[type=item,nbt={Item:{id:"minecraft:crying_obsidian"}},distance=..1] ]
#

data modify entity @s Item.components set from storage stardust:items all.ultimate_frame.components
data modify entity @s Item.id set from storage stardust:items all.ultimate_frame.id

