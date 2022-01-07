#SpawnItem
	summon item ~ ~ ~ {Motion:[0.0,1.0,0.0],Item:{id:"minecraft:cobblestone",Count:1b,tag:{StardustFragment_Give:1b}}}
	data modify entity @e[type=item,nbt={Item:{tag:{StardustFragment_Give:1b}}},limit=1,distance=..1] Item set from storage stardust:items all.2013143

#Kill materials + Sound + Visual
	kill @e[type=item,nbt={Item:{Count:1b,tag:{StardustFragment_LegendaryChestplate:1b}}},limit=1,sort=nearest,distance=..1]
	kill @e[type=item,nbt={Item:{Count:1b,tag:{StardustFragment_SolarChestplate:1b}}},limit=1,sort=nearest,distance=..1]
	kill @e[type=item,nbt={Item:{Count:1b,tag:{StardustFragment_DarkChestplate:1b}}},limit=1,sort=nearest,distance=..1]
	kill @e[type=item,nbt={Item:{Count:64b,tag:{StardustFragment_VeryCompactedStardust:1b}}},limit=1,sort=nearest,distance=..1]
	kill @e[type=item,nbt={Item:{Count:32b,tag:{StardustFragment_StardustConfig:1b}}},limit=1,sort=nearest,distance=..1]
	kill @e[type=item,nbt={Item:{Count:16b,tag:{StardustFragment_AwakenedStardustBlock:1b}}},limit=1,sort=nearest,distance=..1]
	kill @e[type=item,nbt={Item:{Count:1b,id:"minecraft:dragon_egg"}},predicate=!simplenergy:has_tag,limit=1,sort=nearest,distance=..1]
	function stardust:forge/crafted
