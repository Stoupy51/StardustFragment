
#> stardust:custom_blocks/ultimate_battery/replace_item
#
# @executed	as @n[type=item,nbt={Item:{id:"minecraft:crying_obsidian"}},distance=..1]
#
# @within	stardust:custom_blocks/ultimate_battery/destroy [ as @n[type=item,nbt={Item:{id:"minecraft:crying_obsidian"}},distance=..1] ]
#

data modify entity @s Item.components set from storage stardust:items all.ultimate_battery.components
data modify entity @s Item.id set from storage stardust:items all.ultimate_battery.id

# Keep energy
function stardust:utils/keep_energy

