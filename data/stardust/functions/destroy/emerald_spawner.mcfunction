
#Replace the item to keep Motion
	summon item ~ ~ ~ {Item:{id:"minecraft:spawner",Count:1b}}
	data modify entity @e[type=item,nbt={Item:{id:"minecraft:spawner"}},limit=1,sort=nearest,distance=..1] Item set from storage stardust:main all.2013214
	kill @e[type=item,nbt={Item:{id:"minecraft:spawner"}},limit=1,sort=nearest,distance=..1]
kill @s
