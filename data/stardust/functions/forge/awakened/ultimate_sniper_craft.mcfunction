#SpawnItem
	summon item ~ ~ ~ {Motion:[0.0,1.0,0.0],Item:{id:"cobblestone",Count:1b,tag:{stardust.give:1b}}}
	data modify entity @e[type=item,nbt={Item:{tag:{stardust.give:1b}}},limit=1,distance=..1] Item set from storage stardust:main all.2013154

#Kill materials + Sound + Visual
	kill @e[type=item,nbt={Item:{Count:1b,tag:{stardust:{awakened_stardust_sniper:1b}}}},limit=1,sort=nearest,distance=..1]
	kill @e[type=item,nbt={Item:{Count:64b,tag:{stardust:{very_compacted_stardust:1b}}}},limit=1,sort=nearest,distance=..1]
	kill @e[type=item,nbt={Item:{Count:32b,tag:{stardust:{stardust_config:1b}}}},limit=1,sort=nearest,distance=..1]
	kill @e[type=item,nbt={Item:{Count:16b,tag:{stardust:{awakened_stardust_block:1b}}}},limit=1,sort=nearest,distance=..1]
	kill @e[type=item,nbt={Item:{Count:1b,id:"minecraft:dragon_egg"}},limit=1,sort=nearest,distance=..1]
	function stardust:forge/crafted
