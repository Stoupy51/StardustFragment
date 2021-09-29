scoreboard players set SuperCraft SF_Data 3
scoreboard players add @s SF_SCraft 4
scoreboard players remove @s[scores={SF_SCraft=1..}] SF_SCraft 3
scoreboard players reset @s[scores={SF_SCraft=..0}] SF_SCraft

execute as @s[scores={SF_SCraft=1}] run playsound stardust:craft master @a[distance=..20]

#SpawnItem
	execute as @s[scores={SF_SCraft=4..}] run summon item ~ ~ ~ {Motion:[0.0,1.0,0.0],Item:{id:"minecraft:cobblestone",Count:1b,tag:{SF_Give:1s}}}
	execute as @s[scores={SF_SCraft=4..}] run data modify entity @e[type=item,nbt={Item:{tag:{SF_Give:1s}}},limit=1,distance=..1] Item set from storage stardust:items 2013134

#Kill materials + Sound + Visual
	execute as @s[scores={SF_SCraft=4..}] run kill @e[type=item,nbt={Item:{Count:8b,tag:{SF_SolarFragment:1s}}},limit=1,sort=nearest,distance=..1]
	execute as @s[scores={SF_SCraft=4..}] run kill @e[type=item,nbt={Item:{Count:64b,tag:{SF_AwakenedStardust:1s}}},limit=1,sort=nearest,distance=..1]
	execute as @s[scores={SF_SCraft=4..}] run kill @e[type=item,nbt={Item:{Count:4b,tag:{SF_EnderDragonPearl:1s}}},limit=1,sort=nearest,distance=..1]
	execute as @s[scores={SF_SCraft=4..}] run kill @e[type=item,nbt={Item:{Count:1b,tag:{SF_SextupleCompressedCobblestone:1s}}},limit=1,sort=nearest,distance=..1]
	execute as @s[scores={SF_SCraft=4..}] run playsound block.anvil.use block @a[distance=..25]
	execute as @s[scores={SF_SCraft=4..}] run particle smoke ~ ~ ~ 0.4 0.4 0.4 0.2 1000
	kill @s[scores={SF_SCraft=4..}]
