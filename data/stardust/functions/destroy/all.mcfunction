#Groups By Block
	execute as @e[type=glow_item_frame,tag=SF_DestroyRedstoneBlock] at @s unless block ~ ~ ~ minecraft:redstone_block run function stardust:destroy/groups/redstone_block
	execute as @e[type=glow_item_frame,tag=SF_DestroyCobblestone] at @s unless block ~ ~ ~ minecraft:cobblestone run function stardust:destroy/groups/cobblestone
	execute as @e[type=glow_item_frame,tag=SF_DestroyCobbledDeepslate] at @s unless block ~ ~ ~ minecraft:cobbled_deepslate run function stardust:destroy/groups/cobbled_deepslate
	execute as @e[type=glow_item_frame,tag=SF_DestroyDeepslateDiamondOre] at @s unless block ~ ~ ~ minecraft:deepslate_diamond_ore run function stardust:destroy/groups/deepslate_diamond_ore
	execute as @e[type=glow_item_frame,tag=SF_DestroyLapisBlock] at @s unless block ~ ~ ~ minecraft:lapis_block run function stardust:destroy/groups/lapis_block
	execute as @e[type=glow_item_frame,tag=SF_DestroyIronBlock] at @s unless block ~ ~ ~ minecraft:iron_block run function stardust:destroy/groups/iron_block
	execute as @e[type=glow_item_frame,tag=SF_DestroyCryingObsidian] at @s unless block ~ ~ ~ minecraft:crying_obsidian run function stardust:destroy/groups/crying_obsidian
	execute as @e[type=glow_item_frame,tag=SF_DestroySpawner] at @s unless block ~ ~ ~ minecraft:spawner run function stardust:destroy/groups/spawner
	execute as @e[type=glow_item_frame,tag=SF_DestroyFurnace] at @s unless block ~ ~ ~ minecraft:furnace run function stardust:destroy/groups/furnace
	execute as @e[type=glow_item_frame,tag=SF_DestroyDaylightDetector] at @s unless block ~ ~ ~ minecraft:daylight_detector run function stardust:destroy/groups/daylight_detector
	execute as @e[type=glow_item_frame,tag=SF_DestroyPlayerHead] at @s unless block ~ ~ ~ minecraft:player_head run function stardust:destroy/groups/player_head

#Out of a Group
	execute as @e[type=glow_item_frame,tag=SF_NetherStardustOre] at @s unless block ~ ~ ~ minecraft:nether_quartz_ore run function stardust:destroy/nether_stardust_ore
	execute as @e[type=glow_item_frame,tag=SF_AwakenedStardustOre] at @s unless block ~ ~ ~ minecraft:deepslate_redstone_ore run function stardust:destroy/awakened_stardust_ore
	#Seeds
		execute as @e[type=glow_item_frame,tag=SF_Seed] at @s unless block ~ ~ ~ minecraft:moss_carpet run function stardust:destroy/seeds/all
		execute as @e[type=glow_item_frame,tag=SF_DiamondSeeds] at @s unless block ~ ~-1 ~ minecraft:stone run function stardust:destroy/seeds/all
		execute as @e[type=glow_item_frame,tag=SF_StardustSeeds] at @s unless block ~ ~-1 ~ minecraft:diamond_block run function stardust:destroy/seeds/all
		execute as @e[type=glow_item_frame,tag=SF_LegendarySeed] at @s unless block ~ ~-1 ~ minecraft:emerald_block run function stardust:destroy/seeds/all
		execute as @e[type=glow_item_frame,tag=SF_SolarSeed] at @s unless block ~ ~-1 ~ minecraft:magma_block run function stardust:destroy/seeds/all
		execute as @e[type=glow_item_frame,tag=SF_DarkSeed] at @s unless block ~ ~-1 ~ minecraft:obsidian run function stardust:destroy/seeds/all
	execute as @e[type=glow_item_frame,tag=SF_WindTurbine] at @s unless block ~ ~ ~ minecraft:iron_trapdoor run function stardust:destroy/wind_turbine
	execute as @e[type=glow_item_frame,tag=SF_StardustBattery] at @s unless block ~ ~ ~ minecraft:diamond_block run function stardust:destroy/stardust_battery
