#Replace the item to keep Motion
	data modify entity @e[type=item,nbt={Item:{id:"minecraft:cobblestone"}},predicate=!simplenergy:has_tag,limit=1,sort=nearest,distance=..1] Item set from storage stardust:items all.2013015
kill @s
