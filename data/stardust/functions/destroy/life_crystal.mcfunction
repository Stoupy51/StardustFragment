
#Kill the item if mined with silk touch
	scoreboard players set #success stardust.data 0
	execute store success score #success stardust.data run data modify entity @e[type=item,nbt={Item:{id:"minecraft:glass"}},limit=1,sort=nearest,distance=..1] Item set from storage stardust:main all.2013174
	execute if score #success stardust.data matches 0 run loot spawn ~ ~ ~ loot stardust:i/life_crystal

kill @s
