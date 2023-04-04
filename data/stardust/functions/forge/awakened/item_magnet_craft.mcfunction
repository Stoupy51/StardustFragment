#Kill materials + Sound + Visual
	kill @e[type=item,nbt={Item:{Count:8b,tag:{stardust:{stardust_essence:1b}}}},limit=1,sort=nearest,distance=..1]
	kill @e[type=item,nbt={Item:{Count:32b,tag:{stardust:{awakened_stardust:1b}}}},limit=1,sort=nearest,distance=..1]
	kill @e[type=item,nbt={Item:{Count:64b,id:"minecraft:iron_block"}},limit=1,sort=nearest,distance=..1]
	kill @e[type=item,nbt={Item:{Count:64b,id:"minecraft:copper_block"}},limit=1,sort=nearest,distance=..1]
	kill @e[type=item,nbt={Item:{Count:2b,tag:{stardust:{dragon_pearl:1b}}}},limit=1,sort=nearest,distance=..1]
	function stardust:forge/crafted

#SpawnItem
	summon item ~ ~ ~ {Motion:[0.0,1.0,0.0],Item:{id:"cobblestone",Count:1b,tag:{stardust.give:1b}}}
	data modify entity @e[type=item,nbt={Item:{tag:{stardust.give:1b}}},limit=1,distance=..1] Item set from storage stardust:main all.2013169

#Prevent stack with other magnets
	execute store result entity @e[type=item,distance=..1,sort=nearest,limit=1,nbt={Age:0s}] Item.tag.simplenergy.not_stackable int 1 run scoreboard players get #stack simplenergy.data
	scoreboard players add #stack simplenergy.data 1
