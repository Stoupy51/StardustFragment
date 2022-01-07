#Kill materials + Sound + Visual
	kill @e[type=item,nbt={Item:{Count:1b,tag:{SF_StardustConfig:1b}}},limit=1,sort=nearest,distance=..1]
	kill @e[type=item,nbt={Item:{Count:16b,tag:{SE_SimpluniumIngot:1b}}},limit=1,sort=nearest,distance=..1]
	kill @e[type=item,nbt={Item:{Count:32b,id:"minecraft:gold_block"}},predicate=!simplenergy:has_tag,limit=1,sort=nearest,distance=..1]
	kill @e[type=item,nbt={Item:{Count:8b,tag:{SF_DragonPearl:1b}}},limit=1,sort=nearest,distance=..1]
	function stardust:forge/crafted

#SpawnItem
	summon item ~ ~ ~ {Motion:[0.0,1.0,0.0],Item:{id:"minecraft:cobblestone",Count:1b,tag:{SF_Give:1b}}}
	data modify entity @e[type=item,nbt={Item:{tag:{SF_Give:1b}}},limit=1,distance=..1] Item set from storage stardust:items all.2013152
