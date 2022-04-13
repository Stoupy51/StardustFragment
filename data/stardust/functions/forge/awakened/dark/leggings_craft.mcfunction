#SpawnItem
	summon item ~ ~ ~ {Motion:[0.0,1.0,0.0],Item:{id:"minecraft:cobblestone",Count:1b,tag:{stardust.give:1b}}}
	data modify entity @e[type=item,nbt={Item:{tag:{stardust.give:1b}}},limit=1,distance=..1] Item set from storage stardust:main all.2013137

#Kill materials + Sound + Visual
	kill @e[type=item,nbt={Item:{Count:8b,tag:{stardust:{dark_fragment:1b}}}},limit=1,sort=nearest,distance=..1]
	kill @e[type=item,nbt={Item:{Count:64b,tag:{stardust:{awakened_stardust:1b}}}},limit=1,sort=nearest,distance=..1]
	kill @e[type=item,nbt={Item:{Count:4b,tag:{stardust:{ender_dragon_pearl:1b}}}},limit=1,sort=nearest,distance=..1]
	kill @e[type=item,nbt={Item:{Count:1b,tag:{ctc:{id:"sextuple_compressed_cobblestone"}}}},limit=1,sort=nearest,distance=..1]
	function stardust:forge/crafted
