#Replace the item to keep Motion
	data modify entity @e[type=item,nbt={Item:{id:"minecraft:iron_block"}},predicate=!simplenergy:has_tag,limit=1,sort=nearest,distance=..1] Item set from storage stardust:items 2013233
kill @s
execute as @e[type=#energy_flux:entities,tag=EF_Wire,distance=..2] at @s run function energy_flux:wire_update
