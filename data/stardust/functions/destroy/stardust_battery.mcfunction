
#Replace the item to keep Motion
	data modify entity @e[type=item,nbt={Item:{id:"minecraft:diamond_block"}},limit=1,sort=nearest,distance=..1] Item set from storage stardust:main all.2013336
#Update the Battery to keep Energy
	scoreboard players operation #storage simplenergy.data = @s energy.storage
	execute if score #storage simplenergy.data matches 1.. as @e[type=item,nbt={Item:{tag:{energy:{}}}},limit=1,sort=nearest,distance=..1] run function simplenergy:destroy/keep_energy

#Call on a machine when broken to remove its connections
function energy:v1/api/break_machine
kill @s
