#Replace the item to keep Motion
	data modify entity @e[type=item,nbt={Item:{id:"minecraft:redstone_block"}},predicate=!simplenergy:has_tag,limit=1,sort=nearest,distance=..1] Item set from storage stardust:items 2013222
kill @s
function energy_flux:wire_update
