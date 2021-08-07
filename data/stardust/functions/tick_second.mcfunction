#Others
	scoreboard players set Second SF_Data 0
	scoreboard players add Minute SF_Data 1
    execute if score Minute SF_Data matches 60.. run function stardust:tick_minute
	execute as @e[type=minecraft:item,nbt={Item:{tag:{SF_StardustFragment:1b}}}] at @s if block ~ ~-1 ~ minecraft:crafting_table run function stardust:place/stardust_crafting_table
	execute if score DragonKilled SF_Data matches ..10 run function stardust:opti/dragon_egg/all
	###execute as @e[type=minecraft:item] at @s run function stardust:forge/detect_craft

#Players
	execute at @a run function stardust:generate/player
	effect give @a[nbt={Inventory:[{Slot:102b,tag:{SF_UltimateElytra:1b}}]}] minecraft:resistance 2 1 true
	execute as @a[tag=!SF_FirstJoin] at @s run function stardust:first_join
	execute as @a[scores={SF_Wormhole=1..}] run function stardust:opti/wormhole_potion/use
	execute as @a[tag=SF_NoCooldown] run attribute @s minecraft:generic.attack_speed base set 2000
	execute as @a at @s anchored eyes positioned ^ ^ ^2 run function stardust:visual/seed_status

#Boss
    execute if score UltimateBoss SF_Data matches 1 run function stardust:boss/ultimate_boss/tick_second
	execute if score StardustPillar SF_Data matches 1.. as @e[type=minecraft:wither,tag=SF_StardustPillar] at @s run function stardust:boss/stardust_pillar/tick_second
    execute if score StardustPillar SF_Data matches 1.. as @e[type=minecraft:armor_stand,tag=SF_StardustPillarTick] at @s unless entity @e[type=minecraft:wither,tag=SF_StardustPillar,distance=..2.75] run function stardust:boss/stardust_pillar/defeated
	execute as @e[type=minecraft:wolf,tag=SF_StoupArmy] at @s run function stardust:boss/stouparmy

#Quarry
	scoreboard players set Quarry SF_Data 0
	execute as @e[type=minecraft:shulker,tag=SF_QuarryDisplayX] run function stardust:quarry/display/kill
	execute as @e[type=minecraft:glow_item_frame,tag=SF_Quarry] at @s run function stardust:quarry/opti

#Mobs spawn
	execute in stardust:celestial as @e[type=#stardust:global,tag=!SF_CelestialDim,distance=0..] at @s run function stardust:mobs/celestial
	execute in stardust:stardust as @e[type=#stardust:global,tag=!SF_StardustDim,distance=0..] at @s run function stardust:mobs/stardust
	execute if entity @a[nbt={Dimension:"stardust:dungeon"},limit=1] in stardust:dungeon run tp @e[type=minecraft:ghast,distance=0..] 0 -10000 0
	execute in stardust:dungeon as @e[type=#stardust:global,tag=!SF_DungeonDim,distance=0..] run function stardust:mobs/dungeon
	execute in stardust:ultimate as @e[type=minecraft:ender_dragon,tag=!SF_Dragon,distance=0..,nbt={Brain:{memories:{}}},limit=1] at @s run function stardust:boss/ultimate_boss/spawn
	execute in stardust:stardust as @e[type=minecraft:bat,distance=0..] at @s run function stardust:mobs/stardust_bat

#Dimensions
	execute as @e[type=minecraft:glow_item_frame,tag=SF_Portal] at @s positioned ~ ~1 ~ run scoreboard players add @a[distance=..1,dx=0] SF_Data 10
	scoreboard players add @a[scores={SF_Data=1..},nbt={SelectedItem:{tag:{SF_TravelStaff:1b}}}] SF_Data 10
	execute as @a[scores={SF_Data=1..}] at @s run function stardust:dimensions/teleport
	tag @a[nbt={Dimension:"stardust:dungeon"}] add SF_IsInDungeon
	gamemode adventure @a[nbt={Dimension:"stardust:dungeon"},gamemode=survival,tag=SF_IsInDungeon]
	execute as @a[tag=SF_IsInDungeon] unless entity @s[nbt={Dimension:"stardust:dungeon"}] run function stardust:dimensions/left_dungeon
	execute in stardust:dungeon as @a[x=-2.5,y=68,z=-2.5,dx=0,dz=0,distance=..0.5,nbt={SelectedItem:{tag:{SF_StardustDungeonKey:1b}}}] run function stardust:dimensions/enter_dungeon
