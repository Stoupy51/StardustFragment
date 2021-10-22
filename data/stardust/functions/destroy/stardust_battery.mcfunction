#Replace the item to keep Motion
	data modify entity @e[type=item,nbt={Item:{id:"minecraft:diamond_block"}},predicate=!simplenergy:has_tag,limit=1,sort=nearest,distance=..1] Item set from storage stardust:items 2013253
#Update the Battery to keep Energy
	execute if score @s EF_kJ matches 1.. run function simplenergy:destroy/keep_energy

kill @e[type=item,nbt={Item:{tag:{SE_CustomTextureItem:1s}}},distance=..1]
kill @s
execute as @e[type=#energy_flux:wires,tag=EF_Wire,distance=..2] at @s run function energy_flux:wire_update
