
#Replace the item to keep Motion
	data modify entity @e[type=item,nbt={Item:{id:"minecraft:furnace"}},limit=1,sort=nearest,distance=..1] Item set from storage stardust:main all.2013325

kill @e[type=item,nbt={Item:{tag:{simplenergy:{texture_item:1b}}}},distance=..1]
#Call on a machine when broken to remove its connections
function energy:v1/api/break_machine
kill @s
