
#> stardust:custom_blocks/mob_grinder/replace_item
#
# @executed	as @n[type=item,nbt={Item:{id:"minecraft:barrel"}},distance=..1]
#
# @within	stardust:custom_blocks/mob_grinder/destroy [ as @n[type=item,nbt={Item:{id:"minecraft:barrel"}},distance=..1] ]
#

data modify entity @s Item.components set from storage stardust:items all.mob_grinder.components
data modify entity @s Item.id set from storage stardust:items all.mob_grinder.id

