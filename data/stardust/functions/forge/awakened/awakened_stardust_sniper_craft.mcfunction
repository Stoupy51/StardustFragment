#Kill materials + Sound + Visual
	kill @e[type=item,nbt={Item:{Count:64b,tag:{StardustFragment_AwakenedStardust:1b}}},limit=1,sort=nearest,distance=..1]
	kill @e[type=item,nbt={Item:{Count:24b,tag:{StardustFragment_EnderDragonPearl:1b}}},limit=1,sort=nearest,distance=..1]
	kill @e[type=item,nbt={Item:{Count:16b,tag:{StardustFragment_AwakenedStardustBlock:1b}}},limit=1,sort=nearest,distance=..1]
	kill @e[type=item,nbt={Item:{Count:16b,tag:{StardustFragment_SextupleCompressedCobblestone:1b}}},limit=1,sort=nearest,distance=..1]
	function stardust:forge/crafted

#SpawnItem
	summon item ~ ~ ~ {Motion:[0.0,1.0,0.0],Item:{id:"minecraft:cobblestone",Count:1b,tag:{StardustFragment_Give:1b}}}
	data modify entity @e[type=item,nbt={Item:{tag:{StardustFragment_Give:1b}}},limit=1,distance=..1] Item set from storage stardust:items all.2013153
