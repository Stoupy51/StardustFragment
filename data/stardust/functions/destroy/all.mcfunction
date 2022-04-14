
#Groups By Block
	execute if entity @s[tag=stardust.destroy_redstone_block] unless block ~ ~ ~ minecraft:redstone_block run function stardust:destroy/groups/redstone_block
	execute if entity @s[tag=stardust.destroy_cobblestone] unless block ~ ~ ~ minecraft:cobblestone run function stardust:destroy/groups/cobblestone
	execute if entity @s[tag=stardust.destroy_cobbled_deepslate] unless block ~ ~ ~ minecraft:cobbled_deepslate run function stardust:destroy/groups/cobbled_deepslate
	execute if entity @s[tag=stardust.destroy_lapis_block] unless block ~ ~ ~ minecraft:lapis_block run function stardust:destroy/groups/lapis_block
	execute if entity @s[tag=stardust.destroy_iron_block] unless block ~ ~ ~ minecraft:iron_block run function stardust:destroy/groups/iron_block
	execute if entity @s[tag=stardust.destroy_crying_obsidian] unless block ~ ~ ~ minecraft:crying_obsidian run function stardust:destroy/groups/crying_obsidian
	execute if entity @s[tag=stardust.destroy_spawner] unless block ~ ~ ~ minecraft:spawner run function stardust:destroy/groups/spawner
	execute if entity @s[tag=stardust.destroy_furnace] unless block ~ ~ ~ minecraft:furnace run function stardust:destroy/groups/furnace
	execute if entity @s[tag=stardust.destroy_daylight_detector] unless block ~ ~ ~ minecraft:daylight_detector run function stardust:destroy/groups/daylight_detector
	execute if entity @s[tag=stardust.destroy_deepslate_diamond_ore] unless block ~ ~ ~ minecraft:deepslate_diamond_ore run function stardust:destroy/groups/deepslate_diamond_ore
	execute if entity @s[tag=stardust.destroy_player_head] unless block ~ ~ ~ minecraft:player_head run function stardust:destroy/groups/player_head

#Out of a Group
	execute if entity @s[tag=stardust.nether_stardust_ore] unless block ~ ~ ~ minecraft:nether_quartz_ore run function stardust:destroy/nether_stardust_ore
	execute if entity @s[tag=stardust.awakened_stardust_ore] unless block ~ ~ ~ minecraft:deepslate_redstone_ore run function stardust:destroy/awakened_stardust_ore
	#Seeds
		execute if entity @s[tag=stardust.seed] unless block ~ ~ ~ minecraft:moss_carpet run function stardust:destroy/seeds/all
		execute if entity @s[tag=stardust.diamond_seeds] unless block ~ ~-1 ~ minecraft:stone run function stardust:destroy/seeds/all
		execute if entity @s[tag=stardust.stardust_seeds] unless block ~ ~-1 ~ minecraft:diamond_block run function stardust:destroy/seeds/all
		execute if entity @s[tag=stardust.legendary_seed] unless block ~ ~-1 ~ minecraft:lime_concrete run function stardust:destroy/seeds/all
		execute if entity @s[tag=stardust.solar_seed] unless block ~ ~-1 ~ minecraft:magma_block run function stardust:destroy/seeds/all
		execute if entity @s[tag=stardust.dark_seed] unless block ~ ~-1 ~ minecraft:obsidian run function stardust:destroy/seeds/all
	execute if entity @s[tag=stardust.life_crystal] unless block ~ ~ ~ minecraft:glass run function stardust:destroy/life_crystal
	execute if entity @s[tag=stardust.wind_turbine] unless block ~ ~ ~ minecraft:iron_trapdoor run function stardust:destroy/wind_turbine
	execute if entity @s[tag=stardust.stardust_battery] unless block ~ ~ ~ minecraft:diamond_block run function stardust:destroy/stardust_battery
