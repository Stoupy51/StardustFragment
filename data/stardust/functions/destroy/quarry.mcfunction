#Replace the item to keep Motion
	execute as @s[tag=StardustFragment_QuarryLv1] run data modify entity @e[type=item,nbt={Item:{id:"minecraft:barrel"}},predicate=!simplenergy:has_tag,limit=1,sort=nearest,distance=..1] Item set from storage stardust:items all.2013213
	execute as @s[tag=StardustFragment_QuarryLv2] run data modify entity @e[type=item,nbt={Item:{id:"minecraft:barrel"}},predicate=!simplenergy:has_tag,limit=1,sort=nearest,distance=..1] Item set from storage stardust:items all.2013214
	execute as @s[tag=StardustFragment_QuarryLv3] run data modify entity @e[type=item,nbt={Item:{id:"minecraft:barrel"}},predicate=!simplenergy:has_tag,limit=1,sort=nearest,distance=..1] Item set from storage stardust:items all.2013215
	execute as @s[tag=StardustFragment_QuarryLv4] run data modify entity @e[type=item,nbt={Item:{id:"minecraft:barrel"}},predicate=!simplenergy:has_tag,limit=1,sort=nearest,distance=..1] Item set from storage stardust:items all.2013216
	execute as @s[tag=StardustFragment_QuarryLv5] run data modify entity @e[type=item,nbt={Item:{id:"minecraft:barrel"}},predicate=!simplenergy:has_tag,limit=1,sort=nearest,distance=..1] Item set from storage stardust:items all.2013217
	execute as @s[tag=StardustFragment_QuarryLv6] run data modify entity @e[type=item,nbt={Item:{id:"minecraft:barrel"}},predicate=!simplenergy:has_tag,limit=1,sort=nearest,distance=..1] Item set from storage stardust:items all.2013218
#Update the Quarry to keep Energy
	execute if score @s energy.storage matches 1.. run function simplenergy:destroy/keep_energy

kill @e[type=item,nbt={Item:{tag:{SimplEnergy_CustomTextureItem:1b}}},distance=..1]
#Call on a machine when broken to remove its connections
function energy:v1/api/break_machine
kill @s
