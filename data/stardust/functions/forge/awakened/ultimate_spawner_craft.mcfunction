#SpawnItem
	summon item ~ ~ ~ {Motion:[0.0,1.0,0.0],Item:{id:"cobblestone",Count:1b,tag:{stardust.give:1b}}}
	data modify entity @e[type=item,nbt={Item:{tag:{stardust.give:1b}}},limit=1,distance=..1] Item set from storage stardust:main all.2013215

#Kill materials + Sound + Visual
	kill @e[type=item,nbt={Item:{Count:1b,tag:{stardust:{emerald_spawner:1b}}}},limit=1,sort=nearest,distance=..1]
	kill @e[type=item,nbt={Item:{Count:1b,tag:{stardust:{ultimate_core:1b}}}},limit=1,sort=nearest,distance=..1]
	kill @e[type=item,nbt={Item:{Count:1b,tag:{ctc:{id:"octuple_compressed_cobblestone"}}}},limit=1,sort=nearest,distance=..1]
	kill @e[type=item,nbt={Item:{Count:1b,tag:{stardust:{stardust_dungeon_key:1b}}}},limit=1,sort=nearest,distance=..1]
	kill @e[type=item,nbt={Item:{Count:1b,tag:{stardust:{stardust_pillar:1b}}}},limit=1,sort=nearest,distance=..1]
	kill @e[type=item,nbt={Item:{Count:64b,tag:{stardust:{stardust_fragment:1b}}}},limit=1,sort=nearest,distance=..1]
	kill @e[type=item,nbt={Item:{Count:64b,tag:{stardust:{awakened_stardust:1b}}}},limit=1,sort=nearest,distance=..1]
	kill @e[type=item,nbt={Item:{Count:64b,tag:{stardust:{dragon_pearl:1b}}}},limit=1,sort=nearest,distance=..1]
	kill @e[type=item,nbt={Item:{Count:64b,tag:{stardust:{legendarium_fragment:1b}}}},limit=1,sort=nearest,distance=..1]
	kill @e[type=item,nbt={Item:{Count:64b,tag:{stardust:{solarium_fragment:1b}}}},limit=1,sort=nearest,distance=..1]
	kill @e[type=item,nbt={Item:{Count:64b,tag:{stardust:{darkium_fragment:1b}}}},limit=1,sort=nearest,distance=..1]
	kill @e[type=item,nbt={Item:{Count:1b,id:"minecraft:enchanted_golden_apple"}},limit=1,sort=nearest,distance=..1]
	kill @e[type=item,nbt={Item:{Count:1b,id:"minecraft:dragon_egg"}},limit=1,sort=nearest,distance=..1]
	kill @e[type=item,nbt={Item:{Count:64b,id:"minecraft:iron_block"}},limit=1,sort=nearest,distance=..1]
	kill @e[type=item,nbt={Item:{Count:64b,id:"minecraft:gold_block"}},limit=1,sort=nearest,distance=..1]
	kill @e[type=item,nbt={Item:{Count:64b,id:"minecraft:diamond_block"}},limit=1,sort=nearest,distance=..1]
	kill @e[type=item,nbt={Item:{Count:64b,id:"minecraft:netherite_scrap"}},limit=1,sort=nearest,distance=..1]
	function stardust:forge/crafted
