#Others
	scoreboard players set Second StardustFragment_Data 0
	scoreboard players add Minute StardustFragment_Data 1
	execute if score Minute StardustFragment_Data matches 60.. run function stardust:tick_minute
	execute as @e[type=glow_item_frame,tag=StardustFragment_CraftingTable,predicate=!simplenergy:is_barrel_open] at @s if entity @p[distance=..7] run function stardust:craft/all
	execute as @e[type=item,nbt={Item:{tag:{StardustFragment_StardustFragment:1b}}}] at @s if block ~ ~-1 ~ minecraft:crafting_table run function stardust:place/stardust_crafting_table
	execute if score DragonKilled StardustFragment_Data matches ..10 run function stardust:opti/dragon_egg/all

#Players
	execute at @a run function stardust:generate/player
	effect give @a[nbt={Inventory:[{Slot:102b,tag:{StardustFragment_UltimateElytra:1b}}]}] minecraft:resistance 2 1 true
	execute as @a[tag=!StardustFragment_FirstJoin] at @s run function stardust:first_join
	execute as @a[scores={StardustFragment_Wormhole=1..}] run function stardust:opti/wormhole_potion/use
	execute as @a[tag=StardustFragment_NoCooldown] run attribute @s minecraft:generic.attack_speed base set 2000
	execute as @a[tag=!global.ignore.gui] at @s anchored eyes positioned ^ ^ ^2 run function stardust:visual/seed_status
	execute at @a run forceload add -29999999 2013


#Boss
	execute if score UltimateBoss StardustFragment_Data matches 1 in stardust:ultimate run function stardust:boss/ultimate_boss/tick_second
	execute if score StardustPillar StardustFragment_Data matches 1.. as @e[type=wither,tag=StardustFragment_StardustPillar] at @s run function stardust:boss/stardust_pillar/tick_second
	execute if score StardustPillar StardustFragment_Data matches 1.. as @e[type=armor_stand,tag=StardustFragment_StardustPillarTick] at @s unless entity @e[type=wither,tag=StardustFragment_StardustPillar,distance=..2.75] run function stardust:boss/stardust_pillar/defeated
	execute as @e[type=wolf,tag=StardustFragment_StoupArmy] at @s run function stardust:boss/stouparmy
	scoreboard players reset MaxCount StardustFragment_Data

#Mobs spawn
	execute in stardust:celestial as @e[type=#stardust:global,tag=!StardustFragment_CelestialDim,distance=0..] at @s run function stardust:mobs/celestial
	execute in stardust:stardust as @e[type=#stardust:global,tag=!StardustFragment_StardustDim,distance=0..] at @s run function stardust:mobs/stardust
	execute in stardust:ultimate as @e[type=ender_dragon,tag=!StardustFragment_Dragon,distance=0..,nbt={Brain:{memories:{}}},limit=1] at @s run function stardust:boss/ultimate_boss/spawn
	execute in stardust:stardust as @e[type=bat,distance=0..] at @s run function stardust:mobs/stardust_bat

#Dimensions
	execute as @e[type=glow_item_frame,tag=StardustFragment_Portal] run function stardust:work/portals
	scoreboard players add @a[scores={StardustFragment_Data=1..},nbt={SelectedItem:{tag:{StardustFragment_TravelStaff:1b}}}] StardustFragment_Data 10
	execute as @a[scores={StardustFragment_Data=1..}] at @s run function stardust:dimensions/teleport
	tag @a[nbt={Dimension:"stardust:dungeon"}] add StardustFragment_IsInDungeon
	execute if entity @a[tag=StardustFragment_IsInDungeon,limit=1] in stardust:dungeon run function stardust:tick_second_dungeon

#Machines Visuals & Work
	execute as @e[type=glow_item_frame,tag=StardustFragment_MobGrinder] at @s run function stardust:work/mob_grinder
	execute as @e[type=glow_item_frame,tag=StardustFragment_NetherStarGenerator] at @s run function stardust:visual/nether_star_generator
	execute as @e[type=glow_item_frame,tag=StardustFragment_RedstoneGenerator] at @s run function stardust:visual/redstone_generator
	execute as @e[type=glow_item_frame,tag=StardustFragment_HeatGenerator] at @s run function stardust:visual/heat_generator
	execute as @e[type=glow_item_frame,tag=StardustFragment_AdvancedFurnaceGenerator] at @s run function stardust:visual/furnace_generator/advanced
	execute as @e[type=glow_item_frame,tag=StardustFragment_StardustFurnaceGenerator] at @s run function stardust:visual/furnace_generator/stardust
	execute as @e[type=glow_item_frame,tag=StardustFragment_AwakenedFurnaceGenerator] at @s run function stardust:visual/furnace_generator/awakened
	execute as @e[type=glow_item_frame,tag=StardustFragment_StardustPhotovoltaicPanel] at @s unless score @s energy.storage matches 800.. run function stardust:work/photovoltaic_panel/stardust
	execute as @e[type=glow_item_frame,tag=StardustFragment_AwakenedPhotovoltaicPanel] at @s unless score @s energy.storage matches 1600.. run function stardust:work/photovoltaic_panel/awakened
	execute as @e[type=glow_item_frame,tag=StardustFragment_LegendaryPhotovoltaicPanel] at @s unless score @s energy.storage matches 3200.. run function stardust:work/photovoltaic_panel/legendary
	execute as @e[type=glow_item_frame,tag=StardustFragment_SolarPhotovoltaicPanel] at @s unless score @s energy.storage matches 3200.. run function stardust:work/photovoltaic_panel/solar
	execute as @e[type=glow_item_frame,tag=StardustFragment_DarkPhotovoltaicPanel] at @s unless score @s energy.storage matches 3200.. run function stardust:work/photovoltaic_panel/dark
	execute as @e[type=glow_item_frame,tag=StardustFragment_WindTurbine] at @s unless score @s energy.storage matches 800.. run function stardust:work/wind_turbine

#Balance
	execute as @e[type=glow_item_frame,tag=StardustFragment_HeatGenerator,limit=1] at @s run function stardust:balance/all
	execute as @e[type=glow_item_frame,tag=StardustFragment_PhotovoltaicPanel,limit=1] at @s run function stardust:balance/all
	execute as @e[type=glow_item_frame,tag=StardustFragment_StardustBattery,limit=1] at @s run function stardust:balance/all
	execute as @e[type=glow_item_frame,tag=StardustFragment_AwakenedStardustBattery,limit=1] at @s run function stardust:balance/all
	execute as @e[type=glow_item_frame,tag=StardustFragment_UltimateBattery,limit=1] at @s run function stardust:balance/all
	tag @e[type=glow_item_frame,tag=StardustFragment_Balanced] remove StardustFragment_Balanced

#Update Old Ores to New
	execute as @e[type=item_frame,tag=StardustFragment_Ore] at @s run function stardust:update_from_item_frame
