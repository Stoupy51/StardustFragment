#Groups By Block
	execute if entity @s[tag=StardustFragment_DestroyRedstoneBlock] unless block ~ ~ ~ minecraft:redstone_block run function stardust:destroy/groups/redstone_block
	execute if entity @s[tag=StardustFragment_DestroyCobblestone] unless block ~ ~ ~ minecraft:cobblestone run function stardust:destroy/groups/cobblestone
	execute if entity @s[tag=StardustFragment_DestroyCobbledDeepslate] unless block ~ ~ ~ minecraft:cobbled_deepslate run function stardust:destroy/groups/cobbled_deepslate
	execute if entity @s[tag=StardustFragment_DestroyLapisBlock] unless block ~ ~ ~ minecraft:lapis_block run function stardust:destroy/groups/lapis_block
	execute if entity @s[tag=StardustFragment_DestroyIronBlock] unless block ~ ~ ~ minecraft:iron_block run function stardust:destroy/groups/iron_block
	execute if entity @s[tag=StardustFragment_DestroyCryingObsidian] unless block ~ ~ ~ minecraft:crying_obsidian run function stardust:destroy/groups/crying_obsidian
	execute if entity @s[tag=StardustFragment_DestroySpawner] unless block ~ ~ ~ minecraft:spawner run function stardust:destroy/groups/spawner
	execute if entity @s[tag=StardustFragment_DestroyFurnace] unless block ~ ~ ~ minecraft:furnace run function stardust:destroy/groups/furnace
	execute if entity @s[tag=StardustFragment_DestroyDaylightDetector] unless block ~ ~ ~ minecraft:daylight_detector run function stardust:destroy/groups/daylight_detector
	execute if entity @s[tag=StardustFragment_DestroyDeepslateDiamondOre,predicate=!stardust:check_deepslate_diamond_ore] run function stardust:destroy/groups/deepslate_diamond_ore
	execute if entity @s[tag=StardustFragment_DestroyPlayerHead,predicate=!simplenergy:check_player_head] run function stardust:destroy/groups/player_head

#Out of a Group
	execute if entity @s[tag=StardustFragment_NetherStardustOre,predicate=!stardust:check_nether_quartz_ore] run function stardust:destroy/nether_stardust_ore
	execute if entity @s[tag=StardustFragment_AwakenedStardustOre,predicate=!stardust:check_deepslate_redstone_ore] run function stardust:destroy/awakened_stardust_ore
	#Seeds
		execute if entity @s[tag=StardustFragment_Seed] unless block ~ ~ ~ minecraft:moss_carpet run function stardust:destroy/seeds/all
		execute if entity @s[tag=StardustFragment_DiamondSeeds] unless block ~ ~-1 ~ minecraft:stone run function stardust:destroy/seeds/all
		execute if entity @s[tag=StardustFragment_StardustSeeds] unless block ~ ~-1 ~ minecraft:diamond_block run function stardust:destroy/seeds/all
		execute if entity @s[tag=StardustFragment_LegendarySeed] unless block ~ ~-1 ~ minecraft:lime_concrete run function stardust:destroy/seeds/all
		execute if entity @s[tag=StardustFragment_SolarSeed] unless block ~ ~-1 ~ minecraft:magma_block run function stardust:destroy/seeds/all
		execute if entity @s[tag=StardustFragment_DarkSeed] unless block ~ ~-1 ~ minecraft:obsidian run function stardust:destroy/seeds/all
	execute if entity @s[tag=StardustFragment_WindTurbine] unless block ~ ~ ~ minecraft:iron_trapdoor run function stardust:destroy/wind_turbine
	execute if entity @s[tag=StardustFragment_StardustBattery] unless block ~ ~ ~ minecraft:diamond_block run function stardust:destroy/stardust_battery
