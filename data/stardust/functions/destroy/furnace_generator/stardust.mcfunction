#Replace the item to keep Motion
	data modify entity @e[type=item,nbt={Item:{id:"minecraft:furnace"}},predicate=!simplenergy:has_tag,limit=1,sort=nearest,distance=..1] Item set from storage stardust:items 2013244
kill @e[type=item,nbt={Item:{tag:{SE_CustomTextureItem:1b}}},distance=..1]
kill @s
function energy_flux:wire_update
