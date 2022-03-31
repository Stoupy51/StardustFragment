
#Replace the item to keep Motion
	execute if entity @s[tag=stardust.quarry_lv1] run data modify entity @e[type=item,nbt={Item:{id:"minecraft:barrel"}},predicate=!simplenergy:has_tag,limit=1,sort=nearest,distance=..1] Item set from storage stardust:items all.2013213
	execute if entity @s[tag=stardust.quarry_lv2] run data modify entity @e[type=item,nbt={Item:{id:"minecraft:barrel"}},predicate=!simplenergy:has_tag,limit=1,sort=nearest,distance=..1] Item set from storage stardust:items all.2013214
	execute if entity @s[tag=stardust.quarry_lv3] run data modify entity @e[type=item,nbt={Item:{id:"minecraft:barrel"}},predicate=!simplenergy:has_tag,limit=1,sort=nearest,distance=..1] Item set from storage stardust:items all.2013215
	execute if entity @s[tag=stardust.quarry_lv4] run data modify entity @e[type=item,nbt={Item:{id:"minecraft:barrel"}},predicate=!simplenergy:has_tag,limit=1,sort=nearest,distance=..1] Item set from storage stardust:items all.2013216
	execute if entity @s[tag=stardust.quarry_lv5] run data modify entity @e[type=item,nbt={Item:{id:"minecraft:barrel"}},predicate=!simplenergy:has_tag,limit=1,sort=nearest,distance=..1] Item set from storage stardust:items all.2013217
	execute if entity @s[tag=stardust.quarry_lv6] run data modify entity @e[type=item,nbt={Item:{id:"minecraft:barrel"}},predicate=!simplenergy:has_tag,limit=1,sort=nearest,distance=..1] Item set from storage stardust:items all.2013218
#Update the Quarry to keep Energy
	execute if score @s energy.storage matches 1.. run function simplenergy:destroy/keep_energy

kill @e[type=item,nbt={Item:{tag:{simplenergy:{texture_item:1b}}}},distance=..1]
#Call on a machine when broken to remove its connections
function energy:v1/api/break_machine
kill @s
