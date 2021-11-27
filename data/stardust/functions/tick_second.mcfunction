#Others
	scoreboard players set Second SF_Data 0
	scoreboard players add Minute SF_Data 1
	execute if score Minute SF_Data matches 60.. run function stardust:tick_minute
	execute as @e[type=glow_item_frame,tag=SF_CraftingTable,predicate=!simplenergy:is_barrel_open] at @s if entity @p[distance=..7] run function stardust:craft/all
	execute as @e[type=item,nbt={Item:{tag:{SF_StardustFragment:1b}}}] at @s if block ~ ~-1 ~ minecraft:crafting_table run function stardust:place/stardust_crafting_table
	execute if score DragonKilled SF_Data matches ..10 run function stardust:opti/dragon_egg/all

#Players
	execute at @a run function stardust:generate/player
	effect give @a[nbt={Inventory:[{Slot:102b,tag:{SF_UltimateElytra:1b}}]}] minecraft:resistance 2 1 true
	execute as @a[tag=!SF_FirstJoin] at @s run function stardust:first_join
	execute as @a[scores={SF_Wormhole=1..}] run function stardust:opti/wormhole_potion/use
	execute as @a[tag=SF_NoCooldown] run attribute @s minecraft:generic.attack_speed base set 2000
	execute as @a at @s anchored eyes positioned ^ ^ ^2 run function stardust:visual/seed_status
	execute at @a run forceload add -29999999 2013

#Boss
	execute if score UltimateBoss SF_Data matches 1 in stardust:ultimate run function stardust:boss/ultimate_boss/tick_second
	execute if score StardustPillar SF_Data matches 1.. as @e[type=wither,tag=SF_StardustPillar] at @s run function stardust:boss/stardust_pillar/tick_second
	execute if score StardustPillar SF_Data matches 1.. as @e[type=armor_stand,tag=SF_StardustPillarTick] at @s unless entity @e[type=wither,tag=SF_StardustPillar,distance=..2.75] run function stardust:boss/stardust_pillar/defeated
	execute as @e[type=wolf,tag=SF_StoupArmy] at @s run function stardust:boss/stouparmy
	scoreboard players reset MaxCount SF_Data

#Mobs spawn
	execute in stardust:celestial as @e[type=#stardust:global,tag=!SF_CelestialDim,distance=0..] at @s run function stardust:mobs/celestial
	execute in stardust:stardust as @e[type=#stardust:global,tag=!SF_StardustDim,distance=0..] at @s run function stardust:mobs/stardust
	execute in stardust:ultimate as @e[type=ender_dragon,tag=!SF_Dragon,distance=0..,nbt={Brain:{memories:{}}},limit=1] at @s run function stardust:boss/ultimate_boss/spawn
	execute in stardust:stardust as @e[type=bat,distance=0..] at @s run function stardust:mobs/stardust_bat

#Dimensions
	execute as @e[type=glow_item_frame,tag=SF_Portal] run function stardust:work/portals
	scoreboard players add @a[scores={SF_Data=1..},nbt={SelectedItem:{tag:{SF_TravelStaff:1b}}}] SF_Data 10
	execute as @a[scores={SF_Data=1..}] at @s run function stardust:dimensions/teleport
	tag @a[nbt={Dimension:"stardust:dungeon"}] add SF_IsInDungeon
	execute if entity @a[tag=SF_IsInDungeon,limit=1] in stardust:dungeon run function stardust:tick_second_dungeon

#Machines Visuals & Work
	execute as @e[type=glow_item_frame,tag=SF_MobGrinder] at @s run function stardust:work/mob_grinder
	execute as @e[type=glow_item_frame,tag=SF_NetherStarGenerator] at @s run function stardust:visual/nether_star_generator
	execute as @e[type=glow_item_frame,tag=SF_RedstoneGenerator] at @s run function stardust:visual/redstone_generator
	execute as @e[type=glow_item_frame,tag=SF_HeatGenerator] at @s run function stardust:visual/heat_generator
	execute as @e[type=glow_item_frame,tag=SF_AdvancedFurnaceGenerator] at @s run function stardust:visual/furnace_generator/advanced
	execute as @e[type=glow_item_frame,tag=SF_StardustFurnaceGenerator] at @s run function stardust:visual/furnace_generator/stardust
	execute as @e[type=glow_item_frame,tag=SF_AwakenedFurnaceGenerator] at @s run function stardust:visual/furnace_generator/awakened
	execute as @e[type=glow_item_frame,tag=SF_StardustPhotovoltaicPanel] at @s unless score @s EF_kJ matches 800.. run function stardust:work/photovoltaic_panel/stardust
	execute as @e[type=glow_item_frame,tag=SF_AwakenedPhotovoltaicPanel] at @s unless score @s EF_kJ matches 1600.. run function stardust:work/photovoltaic_panel/awakened
	execute as @e[type=glow_item_frame,tag=SF_LegendaryPhotovoltaicPanel] at @s unless score @s EF_kJ matches 3200.. run function stardust:work/photovoltaic_panel/legendary
	execute as @e[type=glow_item_frame,tag=SF_SolarPhotovoltaicPanel] at @s unless score @s EF_kJ matches 3200.. run function stardust:work/photovoltaic_panel/solar
	execute as @e[type=glow_item_frame,tag=SF_DarkPhotovoltaicPanel] at @s unless score @s EF_kJ matches 3200.. run function stardust:work/photovoltaic_panel/dark
	execute as @e[type=glow_item_frame,tag=SF_WindTurbine] at @s unless score @s EF_kJ matches 800.. run function stardust:work/wind_turbine

#Balance
	execute as @e[type=glow_item_frame,tag=SF_PhotovoltaicPanel,limit=1] at @s run function stardust:balance/all
	tag @e[type=glow_item_frame,tag=SF_Balanced] remove SF_Balanced





execute as @e[type=glow_item_frame,tag=SE_SimpluniumOre] at @s run summon item_frame ~ ~ ~ {ItemRotation:0b,Tags:["SE_Destroyer","SE_SimpluniumOre"],Invisible:1b,Invulnerable:1b,Fixed:1b,Silent:1b,Facing:1b,Item:{id:"cobblestone",Count:1b,tag:{CustomModelData:2012899}}}
kill @e[type=glow_item_frame,tag=SE_SimpluniumOre]
execute as @e[type=glow_item_frame,tag=SF_StardustOre] at @s run summon item_frame ~ ~ ~ {ItemRotation:0b,Tags:["SF_Destroyer","SF_DestroyDeepslateDiamondOre","SF_StardustOre","SF_Ore"],Invisible:1b,Invulnerable:1b,Fixed:1b,Silent:1b,Facing:1b,Item:{id:"barrel",Count:1b,tag:{CustomModelData:2013023}}}
kill @e[type=glow_item_frame,tag=SF_StardustOre]
execute as @e[type=glow_item_frame,tag=SF_DeepslateStardustOre] at @s run summon item_frame ~ ~ ~ {ItemRotation:0b,Tags:["SF_Destroyer","SF_DestroyDeepslateDiamondOre","SF_DeepslateStardustOre","SF_Ore"],Invisible:1b,Invulnerable:1b,Fixed:1b,Silent:1b,Facing:1b,Item:{id:"barrel",Count:1b,tag:{CustomModelData:2013025}}}
kill @e[type=glow_item_frame,tag=SF_DeepslateStardustOre]
execute as @e[type=glow_item_frame,tag=SF_NetherStardustOre] at @s run summon item_frame ~ ~ ~ {ItemRotation:0b,Tags:["SF_Destroyer","SF_NetherStardustOre","SF_Ore"],Invisible:1b,Invulnerable:1b,Fixed:1b,Silent:1b,Facing:1b,Item:{id:"barrel",Count:1b,tag:{CustomModelData:2013026}}}
kill @e[type=glow_item_frame,tag=SF_NetherStardustOre]
execute as @e[type=glow_item_frame,tag=SF_EnderStardustOre] at @s run summon item_frame ~ ~ ~ {ItemRotation:0b,Tags:["SF_Destroyer","SF_DestroyDeepslateDiamondOre","SF_EnderStardustOre","SF_Ore"],Invisible:1b,Invulnerable:1b,Fixed:1b,Silent:1b,Facing:1b,Item:{id:"barrel",Count:1b,tag:{CustomModelData:2013027}}}
kill @e[type=glow_item_frame,tag=SF_EnderStardustOre]
execute as @e[type=glow_item_frame,tag=SF_AwakenedStardustOre] at @s run summon item_frame ~ ~ ~ {ItemRotation:0b,Tags:["SF_Destroyer","SF_AwakenedStardustOre","SF_Ore"],Invisible:1b,Invulnerable:1b,Fixed:1b,Silent:1b,Facing:1b,Item:{id:"barrel",Count:1b,tag:{CustomModelData:2013024}}}
kill @e[type=glow_item_frame,tag=SF_AwakenedStardustOre]
execute as @e[type=armor_stand,tag=SE_SimpluniumOre] at @s run summon item_frame ~ ~ ~ {ItemRotation:0b,Tags:["SE_Destroyer","SE_SimpluniumOre"],Invisible:1b,Invulnerable:1b,Fixed:1b,Silent:1b,Facing:1b,Item:{id:"cobblestone",Count:1b,tag:{CustomModelData:2012899}}}
kill @e[type=armor_stand,tag=SE_SimpluniumOre]
execute as @e[type=armor_stand,tag=SF_StardustOre] at @s run summon item_frame ~ ~ ~ {ItemRotation:0b,Tags:["SF_Destroyer","SF_DestroyDeepslateDiamondOre","SF_StardustOre","SF_Ore"],Invisible:1b,Invulnerable:1b,Fixed:1b,Silent:1b,Facing:1b,Item:{id:"barrel",Count:1b,tag:{CustomModelData:2013023}}}
kill @e[type=armor_stand,tag=SF_StardustOre]
execute as @e[type=armor_stand,tag=SF_DeepslateStardustOre] at @s run summon item_frame ~ ~ ~ {ItemRotation:0b,Tags:["SF_Destroyer","SF_DestroyDeepslateDiamondOre","SF_DeepslateStardustOre","SF_Ore"],Invisible:1b,Invulnerable:1b,Fixed:1b,Silent:1b,Facing:1b,Item:{id:"barrel",Count:1b,tag:{CustomModelData:2013025}}}
kill @e[type=armor_stand,tag=SF_DeepslateStardustOre]
execute as @e[type=armor_stand,tag=SF_NetherStardustOre] at @s run summon item_frame ~ ~ ~ {ItemRotation:0b,Tags:["SF_Destroyer","SF_NetherStardustOre","SF_Ore"],Invisible:1b,Invulnerable:1b,Fixed:1b,Silent:1b,Facing:1b,Item:{id:"barrel",Count:1b,tag:{CustomModelData:2013026}}}
kill @e[type=armor_stand,tag=SF_NetherStardustOre]
execute as @e[type=armor_stand,tag=SF_EnderStardustOre] at @s run summon item_frame ~ ~ ~ {ItemRotation:0b,Tags:["SF_Destroyer","SF_DestroyDeepslateDiamondOre","SF_EnderStardustOre","SF_Ore"],Invisible:1b,Invulnerable:1b,Fixed:1b,Silent:1b,Facing:1b,Item:{id:"barrel",Count:1b,tag:{CustomModelData:2013027}}}
kill @e[type=armor_stand,tag=SF_EnderStardustOre]
execute as @e[type=armor_stand,tag=SF_AwakenedStardustOre] at @s run summon item_frame ~ ~ ~ {ItemRotation:0b,Tags:["SF_Destroyer","SF_AwakenedStardustOre","SF_Ore"],Invisible:1b,Invulnerable:1b,Fixed:1b,Silent:1b,Facing:1b,Item:{id:"barrel",Count:1b,tag:{CustomModelData:2013024}}}
kill @e[type=armor_stand,tag=SF_AwakenedStardustOre]

execute as @e[type=armor_stand,tag=SE_Furnaces] at @s align xyz run summon marker ~0.5 ~ ~0.5 {Tags:["SE_Furnaces"]}
kill @e[type=armor_stand,tag=SE_Furnaces]


