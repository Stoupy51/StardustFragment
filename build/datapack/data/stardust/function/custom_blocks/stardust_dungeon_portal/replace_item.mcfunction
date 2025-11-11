
#> stardust:custom_blocks/stardust_dungeon_portal/replace_item
#
# @executed	as @n[type=item,nbt={Item:{id:"minecraft:red_nether_bricks"}},distance=..1]
#
# @within	stardust:custom_blocks/stardust_dungeon_portal/destroy [ as @n[type=item,nbt={Item:{id:"minecraft:red_nether_bricks"}},distance=..1] ]
#

# Replace the item with the custom one
data modify entity @s Item.components set from storage stardust:items all.stardust_dungeon_portal.components
data modify entity @s Item.id set from storage stardust:items all.stardust_dungeon_portal.id

