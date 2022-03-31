#SpawnItem
	summon item ~ ~ ~ {Motion:[0.0,1.0,0.0],Item:{id:"minecraft:cobblestone",Count:1b,tag:{stardust.give:1b}}}
	data modify entity @e[type=item,nbt={Item:{tag:{stardust.give:1b}}},limit=1,distance=..1] Item set from storage stardust:items all.2013226

#Kill materials + Sound + Visual
	kill @e[type=item,nbt={Item:{Count:1b,tag:{stardust:{emerald_spawner:1b}}}},limit=1,sort=nearest,distance=..1]
	kill @e[type=item,nbt={Item:{Count:1b,tag:{stardust:{ultimate_core:1b}}}},limit=1,sort=nearest,distance=..1]
	kill @e[type=item,nbt={Item:{Count:1b,tag:{ctc:{id:"octuple_compressed_cobblestone"}}}},limit=1,sort=nearest,distance=..1]
	kill @e[type=item,nbt={Item:{Count:1b,tag:{stardust:{stardust_dungeon_key:1b}}}},limit=1,sort=nearest,distance=..1]
	kill @e[type=item,nbt={Item:{Count:1b,tag:{stardust:{stardust_pillar:1b}}}},limit=1,sort=nearest,distance=..1]
	kill @e[type=item,nbt={Item:{Count:64b,tag:{stardust:{stardust_fragment:1b}}}},limit=1,sort=nearest,distance=..1]
	kill @e[type=item,nbt={Item:{Count:64b,tag:{stardust:{awakened_stardust:1b}}}},limit=1,sort=nearest,distance=..1]
	kill @e[type=item,nbt={Item:{Count:64b,tag:{stardust:{dragon_pearl:1b}}}},limit=1,sort=nearest,distance=..1]
	kill @e[type=item,nbt={Item:{Count:64b,tag:{stardust:{legendary_fragment:1b}}}},limit=1,sort=nearest,distance=..1]
	kill @e[type=item,nbt={Item:{Count:64b,tag:{stardust:{solar_fragment:1b}}}},limit=1,sort=nearest,distance=..1]
	kill @e[type=item,nbt={Item:{Count:64b,tag:{stardust:{dark_fragment:1b}}}},limit=1,sort=nearest,distance=..1]
	kill @e[type=item,nbt={Item:{Count:1b,id:"minecraft:enchanted_golden_apple"}},predicate=!simplenergy:has_tag,limit=1,sort=nearest,distance=..1]
	kill @e[type=item,nbt={Item:{Count:1b,id:"minecraft:dragon_egg"}},predicate=!simplenergy:has_tag,limit=1,sort=nearest,distance=..1]
	kill @e[type=item,nbt={Item:{Count:64b,id:"minecraft:iron_block"}},predicate=!simplenergy:has_tag,limit=1,sort=nearest,distance=..1]
	kill @e[type=item,nbt={Item:{Count:64b,id:"minecraft:gold_block"}},predicate=!simplenergy:has_tag,limit=1,sort=nearest,distance=..1]
	kill @e[type=item,nbt={Item:{Count:64b,id:"minecraft:diamond_block"}},predicate=!simplenergy:has_tag,limit=1,sort=nearest,distance=..1]
	kill @e[type=item,nbt={Item:{Count:64b,id:"minecraft:netherite_scrap"}},predicate=!simplenergy:has_tag,limit=1,sort=nearest,distance=..1]
	function stardust:forge/crafted
