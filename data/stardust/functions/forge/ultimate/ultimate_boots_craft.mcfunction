#SpawnItem
	summon item ~ ~ ~ {Motion:[0.0,1.0,0.0],Item:{id:"minecraft:cobblestone",Count:1b,tag:{SF_Give:1b}}}
	data modify entity @e[type=item,nbt={Item:{tag:{SF_Give:1b}}},limit=1,distance=..1] Item set from storage stardust:items all.2013145

#Kill materials + Sound + Visual
	kill @e[type=item,nbt={Item:{Count:1b,tag:{SF_LegendaryBoots:1b}}},limit=1,sort=nearest,distance=..1]
	kill @e[type=item,nbt={Item:{Count:1b,tag:{SF_SolarBoots:1b}}},limit=1,sort=nearest,distance=..1]
	kill @e[type=item,nbt={Item:{Count:1b,tag:{SF_DarkBoots:1b}}},limit=1,sort=nearest,distance=..1]
	kill @e[type=item,nbt={Item:{Count:64b,tag:{SF_VeryCompactedStardust:1b}}},limit=1,sort=nearest,distance=..1]
	kill @e[type=item,nbt={Item:{Count:32b,tag:{SF_StardustConfig:1b}}},limit=1,sort=nearest,distance=..1]
	kill @e[type=item,nbt={Item:{Count:16b,tag:{SF_AwakenedStardustBlock:1b}}},limit=1,sort=nearest,distance=..1]
	kill @e[type=item,nbt={Item:{Count:1b,id:"minecraft:dragon_egg"}},predicate=!simplenergy:has_tag,limit=1,sort=nearest,distance=..1]
	function stardust:forge/crafted
