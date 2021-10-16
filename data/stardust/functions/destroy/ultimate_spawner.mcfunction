#Replace the item to keep Motion
	summon minecraft:item ~ ~ ~ {Item:{id:"minecraft:spawner",Count:1b}}
	data modify entity @e[type=item,nbt={Item:{id:"minecraft:spawner"}},predicate=!simplenergy:has_tag,limit=1,sort=nearest,distance=..1] Item set from storage stardust:items 2013226
	kill @e[type=item,nbt={Item:{id:"minecraft:spawner"}},predicate=!simplenergy:has_tag,limit=1,sort=nearest,distance=..1]
kill @s
