#Replace the item to keep Motion
	data modify entity @e[type=item,nbt={Item:{id:"minecraft:cobbled_deepslate"}},predicate=!simplenergy:has_tag,limit=1,sort=nearest,distance=..1] Item set from storage stardust:items 2013219
#Call on a machine when broken to remove its connections
function energy:v1/api/break_machine
kill @s
