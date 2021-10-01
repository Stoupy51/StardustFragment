function stardust:forge/awakened/verif
scoreboard players set SuperCraft SF_Data 4
execute if score Temp SF_Data matches 2 run function stardust:forge/global

#SpawnItem
	execute as @s[scores={SF_SCraft=4..}] run summon item ~ ~ ~ {Motion:[0.0,1.0,0.0],Item:{id:"minecraft:cobblestone",Count:1b,tag:{SF_Give:1s}}}
	execute as @s[scores={SF_SCraft=4..}] run data modify entity @e[type=item,nbt={Item:{tag:{SF_Give:1s}}},limit=1,distance=..1] Item set from storage stardust:items 2013141

#Kill materials + Sound + Visual
	execute as @s[nbt={Item:{Count:1b,tag:{SF_StardustConfig:1s}}}] as @e[type=item,nbt={Item:{Count:1b,id:"minecraft:bow"}},distance=..1,limit=1] as @e[type=item,nbt={Item:{Count:8b,tag:{SF_DragonPearl:1s}}},distance=..1,limit=1] as @e[type=item,nbt={Item:{Count:16b,id:"minecraft:diamond_block"}},distance=..1,limit=1] as @e[type=item,nbt={Item:{Count:16b,id:"minecraft:emerald_block"}},distance=..1,limit=1] as @e[type=item,nbt={Item:{Count:1b,tag:{SF_QuintupleCompressedCobblestone:1s}}},distance=..1,limit=1] run function stardust:forge/awakened/stardust_bow
	execute as @s[scores={SF_SCraft=4..}] run kill @e[type=item,nbt={Item:{Count:8b,tag:{SF_DarkFragment:1s}}},limit=1,sort=nearest,distance=..1]
	execute as @s[scores={SF_SCraft=4..}] run kill @e[type=item,nbt={Item:{Count:64b,tag:{SF_AwakenedStardust:1s}}},limit=1,sort=nearest,distance=..1]
	execute as @s[scores={SF_SCraft=4..}] run kill @e[type=item,nbt={Item:{Count:4b,tag:{SF_EnderDragonPearl:1s}}},limit=1,sort=nearest,distance=..1]
	execute as @s[scores={SF_SCraft=4..}] run kill @e[type=item,nbt={Item:{Count:1b,tag:{SF_SextupleCompressedCobblestone:1s}}},limit=1,sort=nearest,distance=..1]
	execute as @s[scores={SF_SCraft=4..}] run function stardust:forge/crafted
