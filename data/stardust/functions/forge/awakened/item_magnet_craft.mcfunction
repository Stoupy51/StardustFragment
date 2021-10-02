#Kill materials + Sound + Visual
	kill @e[type=item,nbt={Item:{Count:8b,tag:{SF_StardustEssence:1s}}},limit=1,sort=nearest,distance=..1]
	kill @e[type=item,nbt={Item:{Count:32b,tag:{SF_AwakenedStardust:1s}}},limit=1,sort=nearest,distance=..1]
	kill @e[type=item,nbt={Item:{Count:64b,id:"minecraft:iron_block"}},limit=1,sort=nearest,distance=..1]
	kill @e[type=item,nbt={Item:{Count:64b,id:"minecraft:copper_block"}},limit=1,sort=nearest,distance=..1]
	kill @e[type=item,nbt={Item:{Count:2b,tag:{SF_DragonPearl:1s}}},limit=1,sort=nearest,distance=..1]
	function stardust:forge/crafted

#SpawnItem
	summon item ~ ~ ~ {Motion:[0.0,1.0,0.0],Item:{id:"minecraft:cobblestone",Count:1b,tag:{SF_Give:1s}}}
	data modify entity @e[type=item,nbt={Item:{tag:{SF_Give:1s}}},limit=1,distance=..1] Item set from storage stardust:items 2013169
