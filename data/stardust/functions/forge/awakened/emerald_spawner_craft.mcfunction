#Kill materials + Sound + Visual
	kill @e[type=item,nbt={Item:{Count:64b,tag:{SF_StardustEssence:1b}}},limit=1,sort=nearest,distance=..1]
	kill @e[type=item,nbt={Item:{Count:64b,tag:{SF_AwakenedStardust:1b}}},limit=1,sort=nearest,distance=..1]
	kill @e[type=item,nbt={Item:{Count:64b,id:"minecraft:emerald_block"}},predicate=!simplenergy:has_tag,limit=1,sort=nearest,distance=..1]
	kill @e[type=item,nbt={Item:{Count:1b,tag:{SF_SeptupleCompressedCobblestone:1b}}},limit=1,sort=nearest,distance=..1]
	function stardust:forge/crafted

#SpawnItem
	summon item ~ ~ ~ {Motion:[0.0,1.0,0.0],Item:{id:"minecraft:cobblestone",Count:1b,tag:{SF_Give:1b}}}
	data modify entity @e[type=item,nbt={Item:{tag:{SF_Give:1b}}},limit=1,distance=..1] Item set from storage stardust:items all.2013225
