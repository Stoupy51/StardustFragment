
#> stardust:custom_blocks/elite_stardust_seed/replace_item
#
# @executed	as @n[type=item,nbt={...},distance=..1]
#
# @within	stardust:custom_blocks/elite_stardust_seed/destroy [ as @n[type=item,nbt={...},distance=..1] ]
#

data modify entity @s Item.components set from storage stardust:items all.elite_stardust_seed.components
data modify entity @s Item.id set from storage stardust:items all.elite_stardust_seed.id

