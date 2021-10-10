#Replace the item to keep Motion
	execute as @s[tag=SF_QuarryLv1] run data modify entity @e[type=item,nbt={Item:{id:"minecraft:barrel"}},predicate=!stardust:has_tag,limit=1,sort=nearest,distance=..1] Item set from storage stardust:items 2013213
	execute as @s[tag=SF_QuarryLv2] run data modify entity @e[type=item,nbt={Item:{id:"minecraft:barrel"}},predicate=!stardust:has_tag,limit=1,sort=nearest,distance=..1] Item set from storage stardust:items 2013214
	execute as @s[tag=SF_QuarryLv3] run data modify entity @e[type=item,nbt={Item:{id:"minecraft:barrel"}},predicate=!stardust:has_tag,limit=1,sort=nearest,distance=..1] Item set from storage stardust:items 2013215
	execute as @s[tag=SF_QuarryLv4] run data modify entity @e[type=item,nbt={Item:{id:"minecraft:barrel"}},predicate=!stardust:has_tag,limit=1,sort=nearest,distance=..1] Item set from storage stardust:items 2013216
	execute as @s[tag=SF_QuarryLv5] run data modify entity @e[type=item,nbt={Item:{id:"minecraft:barrel"}},predicate=!stardust:has_tag,limit=1,sort=nearest,distance=..1] Item set from storage stardust:items 2013217
	execute as @s[tag=SF_QuarryLv6] run data modify entity @e[type=item,nbt={Item:{id:"minecraft:barrel"}},predicate=!stardust:has_tag,limit=1,sort=nearest,distance=..1] Item set from storage stardust:items 2013218
#Update the Quarry to keep Energy
	execute if score @s EF_kJ matches 1.. run function simplenergy:destroy/keep_energy

kill @e[type=item,nbt={Item:{tag:{SE_CustomTextureItem:1s}}},distance=..1]
kill @s
execute as @e[type=#energy_flux:entities,tag=EF_Wire,distance=..2] at @s run function energy_flux:wire_update
