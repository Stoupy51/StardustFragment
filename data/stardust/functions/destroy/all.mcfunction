#Groups By Block
	execute as @e[type=glow_item_frame,tag=SF_DestroyRedstoneBlock] at @s unless block ~ ~ ~ minecraft:redstone_block run function stardust:destroy/groups/redstone_block
	execute as @e[type=glow_item_frame,tag=SF_DestroyCobblestone] at @s unless block ~ ~ ~ minecraft:cobblestone run function stardust:destroy/groups/cobblestone
	execute as @e[type=glow_item_frame,tag=SF_DestroyCobbledDeepslate] at @s unless block ~ ~ ~ minecraft:cobbled_deepslate run function stardust:destroy/groups/cobbled_deepslate
	execute as @e[type=glow_item_frame,tag=SF_DestroyDeepslateDiamondOre] at @s unless block ~ ~ ~ minecraft:deepslate_diamond_ore run function stardust:destroy/groups/deepslate_diamond_ore
	execute as @e[type=glow_item_frame,tag=SF_DestroyLapisBlock] at @s unless block ~ ~ ~ minecraft:lapis_block run function stardust:destroy/groups/lapis_block
	execute as @e[type=glow_item_frame,tag=SF_DestroyDiamondBlock] at @s unless block ~ ~ ~ minecraft:diamond_block run function stardust:destroy/groups/diamond_block

#Out of a Group
	execute as @e[type=glow_item_frame,tag=SF_NetherStardustOre] at @s unless block ~ ~ ~ minecraft:nether_quartz_ore run function stardust:destroy/nether_stardust_ore
	execute as @e[type=glow_item_frame,tag=SF_AwakenedStardustOre] at @s unless block ~ ~ ~ minecraft:deepslate_redstone_ore run function stardust:destroy/awakened_stardust_ore
	execute as @e[type=glow_item_frame,tag=SF_Seed] at @s unless block ~ ~ ~ minecraft:moss_carpet run function stardust:destroy/seeds/all
	execute as @e[type=glow_item_frame,tag=SF_DiamondSeeds] at @s unless block ~ ~-1 ~ minecraft:stone run function stardust:destroy/seeds/all
	execute as @e[type=glow_item_frame,tag=SF_StardustSeeds] at @s unless block ~ ~-1 ~ minecraft:diamond_block run function stardust:destroy/seeds/all
	execute as @e[type=glow_item_frame,tag=SF_LegendarySeed] at @s unless block ~ ~-1 ~ minecraft:emerald_block run function stardust:destroy/seeds/all
	execute as @e[type=glow_item_frame,tag=SF_SolarSeed] at @s unless block ~ ~-1 ~ minecraft:magma_block run function stardust:destroy/seeds/all
	execute as @e[type=glow_item_frame,tag=SF_DarkSeed] at @s unless block ~ ~-1 ~ minecraft:obsidian run function stardust:destroy/seeds/all
	
	execute as @e[type=glow_item_frame,tag=SF_Quarry] at @s unless block ~ ~ ~ minecraft:barrel run function stardust:destroy/quarry
	execute as @e[type=glow_item_frame,tag=SF_CelestialPortal] at @s unless block ~ ~ ~ minecraft:iron_block run function stardust:destroy/celestial_portal
	execute as @e[type=glow_item_frame,tag=SF_UltimatePortal] at @s unless block ~ ~ ~ minecraft:crying_obsidian run function stardust:destroy/ultimate_portal
	execute as @e[type=glow_item_frame,tag=SF_EmeraldSpawner] at @s unless block ~ ~ ~ minecraft:spawner run function stardust:destroy/emerald_spawner
	execute as @e[type=glow_item_frame,tag=SF_UltimateSpawner] at @s unless block ~ ~ ~ minecraft:spawner run function stardust:destroy/ultimate_spawner

	execute as @e[type=glow_item_frame,tag=SF_Elevator] at @s unless block ~ ~ ~ minecraft:iron_block run function stardust:destroy/elevator
	execute as @e[type=glow_item_frame,tag=SF_NetherStarGenerator] at @s unless block ~ ~ ~ minecraft:furnace run function stardust:destroy/nether_star_generator
	execute as @e[type=glow_item_frame,tag=SF_RedstoneGenerator] at @s unless block ~ ~ ~ minecraft:furnace run function stardust:destroy/redstone_generator
	execute as @e[type=glow_item_frame,tag=SF_HeatGenerator] at @s unless block ~ ~ ~ minecraft:iron_block run function stardust:destroy/heat_generator
	execute as @e[type=glow_item_frame,tag=SF_WindTurbine] at @s unless block ~ ~ ~ minecraft:iron_trapdoor run function stardust:destroy/wind_turbine
	execute as @e[type=glow_item_frame,tag=SF_AdvancedFurnaceGenerator] at @s unless block ~ ~ ~ minecraft:furnace run function stardust:destroy/furnace_generator/advanced
	execute as @e[type=glow_item_frame,tag=SF_StardustFurnaceGenerator] at @s unless block ~ ~ ~ minecraft:furnace run function stardust:destroy/furnace_generator/stardust
	execute as @e[type=glow_item_frame,tag=SF_AwakenedFurnaceGenerator] at @s unless block ~ ~ ~ minecraft:furnace run function stardust:destroy/furnace_generator/awakened
	execute as @e[type=glow_item_frame,tag=SF_StardustPhotovoltaicPanel] at @s unless block ~ ~ ~ minecraft:daylight_detector run function stardust:destroy/solar_panel/stardust
	execute as @e[type=glow_item_frame,tag=SF_AwakenedPhotovoltaicPanel] at @s unless block ~ ~ ~ minecraft:daylight_detector run function stardust:destroy/solar_panel/awakened
	execute as @e[type=glow_item_frame,tag=SF_LegendaryPhotovoltaicPanel] at @s unless block ~ ~ ~ minecraft:daylight_detector run function stardust:destroy/solar_panel/legendary
	execute as @e[type=glow_item_frame,tag=SF_SolarPhotovoltaicPanel] at @s unless block ~ ~ ~ minecraft:daylight_detector run function stardust:destroy/solar_panel/solar
	execute as @e[type=glow_item_frame,tag=SF_DarkPhotovoltaicPanel] at @s unless block ~ ~ ~ minecraft:daylight_detector run function stardust:destroy/solar_panel/dark
	execute as @e[type=glow_item_frame,tag=SF_StardustBattery] at @s unless block ~ ~ ~ minecraft:diamond_block run function stardust:destroy/stardust_battery
	execute as @e[type=glow_item_frame,tag=SF_UltimateBattery] at @s unless block ~ ~ ~ minecraft:crying_obsidian run function stardust:destroy/ultimate_battery

	execute as @e[type=glow_item_frame,tag=SF_StardustWire] at @s unless block ~ ~ ~ minecraft:player_head run function stardust:destroy/stardust_wire
	execute as @e[type=glow_item_frame,tag=SF_AwakenedStardustWire] at @s unless block ~ ~ ~ minecraft:player_head run function stardust:destroy/awakened_stardust_wire
	execute as @e[type=glow_item_frame,tag=SF_UltimateWire] at @s unless block ~ ~ ~ minecraft:player_head run function stardust:destroy/ultimate_wire

execute as @e[type=glow_item_frame,tag=SF_CraftingTable] at @s unless block ~ ~ ~ minecraft:barrel run function stardust:destroy/stardust_crafting_table
