#Replace the item to keep Motion
	data modify entity @e[type=item,nbt={Item:{id:"minecraft:crying_obsidian"}},predicate=!simplenergy:has_tag,limit=1,sort=nearest,distance=..1] Item set from storage stardust:items 2013255
#Update the Battery to keep Energy
	execute if score @s energy.storage matches 1.. run function simplenergy:destroy/keep_energy

kill @e[type=item,nbt={Item:{tag:{SE_CustomTextureItem:1b}}},distance=..1]
#Call on a machine when broken to remove its connections
function energy:v1/api/break_machine
kill @s
