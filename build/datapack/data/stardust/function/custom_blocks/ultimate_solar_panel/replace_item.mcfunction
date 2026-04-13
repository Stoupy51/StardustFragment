
#> stardust:custom_blocks/ultimate_solar_panel/replace_item
#
# @executed	as @n[type=item,nbt={Item:{id:"minecraft:daylight_detector"}},distance=..1]
#
# @within	stardust:custom_blocks/ultimate_solar_panel/destroy [ as @n[type=item,nbt={Item:{id:"minecraft:daylight_detector"}},distance=..1] ]
#

# Replace the item with the custom one
data modify entity @s Item.components set from storage stardust:items all.ultimate_solar_panel.components
data modify entity @s Item.id set from storage stardust:items all.ultimate_solar_panel.id

