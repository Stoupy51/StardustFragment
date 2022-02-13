#Others
	scoreboard players set Second StardustFragment_Data 0
	scoreboard players add Minute StardustFragment_Data 1
	execute if score Minute StardustFragment_Data matches 60.. run function stardust:tick_minute
	execute if score DragonKilled StardustFragment_Data matches ..10 run function stardust:opti/dragon_egg/all
	execute as @e[type=item,nbt={Item:{tag:{StardustFragment_StardustFragment:1b}}}] at @s if block ~ ~-1 ~ minecraft:crafting_table run function stardust:place/stardust_crafting_table
	execute as @e[type=glow_item_frame,tag=StardustFragment_Balancing,limit=1] at @s run function stardust:balance/all
	execute as @e[type=glow_item_frame,tag=StardustFragment_Destroyer] run function stardust:opti/tick_second_glows
	execute as @a at @s run function stardust:opti/tick_second_players
	execute if entity @a[tag=StardustFragment_IsInDungeon,limit=1] in stardust:dungeon run function stardust:tick_second_dungeon

#Boss
	execute if score UltimateBoss StardustFragment_Data matches 1 in stardust:ultimate run function stardust:boss/ultimate_boss/tick_second
	execute if score StardustPillar StardustFragment_Data matches 1.. as @e[type=wither,tag=StardustFragment_StardustPillar] at @s run function stardust:boss/stardust_pillar/tick_second
	execute if score StardustPillar StardustFragment_Data matches 1.. as @e[type=marker,tag=StardustFragment_StardustPillarTick] at @s unless entity @e[type=wither,tag=StardustFragment_StardustPillar,distance=..3] run function stardust:boss/stardust_pillar/defeated
	execute as @e[type=wolf,tag=StardustFragment_StoupArmy] at @s run function stardust:boss/stouparmy
	scoreboard players reset MaxCount StardustFragment_Data

#Mobs spawn
	execute as @e[type=#stardust:global,tag=!StardustFragment_CelestialDim,tag=!StardustFragment_StardustDim,tag=!global.ignore,tag=!global.ignore.pos,tag=!smithed.entity] at @s run function stardust:mobs/dimensions_check
	execute in stardust:ultimate as @e[type=ender_dragon,tag=!StardustFragment_Dragon,distance=0..,tag=!global.ignore,tag=!global.ignore.pos,tag=!smithed.entity,nbt={Brain:{memories:{}}},limit=1] at @s run function stardust:boss/ultimate_boss/spawn
	execute in stardust:stardust as @e[type=bat,distance=0..,tag=!global.ignore,tag=!global.ignore.pos,tag=!smithed.entity] at @s run function stardust:mobs/stardust_bat

#Update Old Ores to New
	execute as @e[type=item_frame,tag=StardustFragment_Ore] at @s run function stardust:update_from_item_frame
