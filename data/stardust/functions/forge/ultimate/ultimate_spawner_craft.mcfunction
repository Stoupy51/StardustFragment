#SpawnItem
	summon item ~ ~ ~ {Motion:[0.0,1.0,0.0],Item:{id:"minecraft:cobblestone",Count:1b,tag:{SF_Give:1b}}}
	data modify entity @e[type=item,nbt={Item:{tag:{SF_Give:1b}}},limit=1,distance=..1] Item set from storage stardust:items 2013226

#Kill materials + Sound + Visual
	kill @e[type=item,nbt={Item:{Count:1b,tag:{SF_EmeraldSpawner:1b}}},limit=1,sort=nearest,distance=..1]
	kill @e[type=item,nbt={Item:{Count:1b,tag:{SF_UltimateCore:1b}}},limit=1,sort=nearest,distance=..1]
	kill @e[type=item,nbt={Item:{Count:1b,tag:{SF_OctupleCompressedCobblestone:1b}}},limit=1,sort=nearest,distance=..1]
	kill @e[type=item,nbt={Item:{Count:1b,tag:{SF_StardustDungeonKey:1b}}},limit=1,sort=nearest,distance=..1]
	kill @e[type=item,nbt={Item:{Count:1b,tag:{SF_StardustPillar:1b}}},limit=1,sort=nearest,distance=..1]
	kill @e[type=item,nbt={Item:{Count:64b,tag:{SF_StardustFragment:1b}}},limit=1,sort=nearest,distance=..1]
	kill @e[type=item,nbt={Item:{Count:64b,tag:{SF_AwakenedStardust:1b}}},limit=1,sort=nearest,distance=..1]
	kill @e[type=item,nbt={Item:{Count:64b,tag:{SF_DragonPearl:1b}}},limit=1,sort=nearest,distance=..1]
	kill @e[type=item,nbt={Item:{Count:64b,tag:{SF_LegendaryFragment:1b}}},limit=1,sort=nearest,distance=..1]
	kill @e[type=item,nbt={Item:{Count:64b,tag:{SF_SolarFragment:1b}}},limit=1,sort=nearest,distance=..1]
	kill @e[type=item,nbt={Item:{Count:64b,tag:{SF_DarkFragment:1b}}},limit=1,sort=nearest,distance=..1]
	kill @e[type=item,nbt={Item:{Count:1b,id:"minecraft:enchanted_golden_apple"}},predicate=!simplenergy:has_tag,limit=1,sort=nearest,distance=..1]
	kill @e[type=item,nbt={Item:{Count:1b,id:"minecraft:dragon_egg"}},predicate=!simplenergy:has_tag,limit=1,sort=nearest,distance=..1]
	kill @e[type=item,nbt={Item:{Count:64b,id:"minecraft:iron_block"}},predicate=!simplenergy:has_tag,limit=1,sort=nearest,distance=..1]
	kill @e[type=item,nbt={Item:{Count:64b,id:"minecraft:gold_block"}},predicate=!simplenergy:has_tag,limit=1,sort=nearest,distance=..1]
	kill @e[type=item,nbt={Item:{Count:64b,id:"minecraft:diamond_block"}},predicate=!simplenergy:has_tag,limit=1,sort=nearest,distance=..1]
	kill @e[type=item,nbt={Item:{Count:64b,id:"minecraft:netherite_scrap"}},predicate=!simplenergy:has_tag,limit=1,sort=nearest,distance=..1]
	function stardust:forge/crafted
