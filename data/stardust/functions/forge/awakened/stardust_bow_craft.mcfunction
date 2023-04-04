#Kill materials + Sound + Visual
	kill @e[type=item,nbt={Item:{Count:1b,tag:{stardust:{stardust_config:1b}}}},limit=1,sort=nearest,distance=..1]
	kill @e[type=item,nbt={Item:{Count:1b,id:"minecraft:bow"}},limit=1,sort=nearest,distance=..1]
	kill @e[type=item,nbt={Item:{Count:16b,id:"minecraft:diamond_block"}},limit=1,sort=nearest,distance=..1]
	kill @e[type=item,nbt={Item:{Count:16b,id:"minecraft:emerald_block"}},limit=1,sort=nearest,distance=..1]
	kill @e[type=item,nbt={Item:{Count:8b,tag:{stardust:{dragon_pearl:1b}}}},limit=1,sort=nearest,distance=..1]
	function stardust:forge/crafted

#SpawnItem
	summon item ~ ~ ~ {Motion:[0.0,1.0,0.0],Item:{id:"cobblestone",Count:1b,tag:{stardust.give:1b}}}
	data modify entity @e[type=item,nbt={Item:{tag:{stardust.give:1b}}},limit=1,distance=..1] Item set from storage stardust:main all.2013149
