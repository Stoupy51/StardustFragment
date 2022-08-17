
#Groups By Block
	execute if entity @s[tag=stardust.destroy_redstone_block] unless block ~ ~ ~ redstone_block run function stardust:destroy/groups/redstone_block
	execute if entity @s[tag=stardust.destroy_cobblestone] unless block ~ ~ ~ cobblestone run function stardust:destroy/groups/cobblestone
	execute if entity @s[tag=stardust.destroy_cobbled_deepslate] unless block ~ ~ ~ cobbled_deepslate run function stardust:destroy/groups/cobbled_deepslate
	execute if entity @s[tag=stardust.destroy_lapis_block] unless block ~ ~ ~ lapis_block run function stardust:destroy/groups/lapis_block
	execute if entity @s[tag=stardust.destroy_iron_block] unless block ~ ~ ~ iron_block run function stardust:destroy/groups/iron_block
	execute if entity @s[tag=stardust.destroy_crying_obsidian] unless block ~ ~ ~ crying_obsidian run function stardust:destroy/groups/crying_obsidian
	execute if entity @s[tag=stardust.destroy_spawner] unless block ~ ~ ~ spawner run function stardust:destroy/groups/spawner
	execute if entity @s[tag=stardust.destroy_furnace] unless block ~ ~ ~ furnace run function stardust:destroy/groups/furnace
	execute if entity @s[tag=stardust.destroy_daylight_detector] unless block ~ ~ ~ daylight_detector run function stardust:destroy/groups/daylight_detector
	execute if entity @s[tag=stardust.destroy_polished_deepslate] unless block ~ ~ ~ polished_deepslate run function stardust:destroy/groups/polished_deepslate
	execute if entity @s[tag=stardust.destroy_player_head] unless block ~ ~ ~ player_head run function stardust:destroy/groups/player_head
	execute if entity @s[tag=stardust.destroy_diamond_block] unless block ~ ~ ~ diamond_block run function stardust:destroy/groups/diamond_block
	execute if entity @s[tag=stardust.seed] run function stardust:destroy/groups/seed

#Out of a Group
	execute if entity @s[tag=stardust.life_crystal] unless block ~ ~ ~ glass run function stardust:destroy/life_crystal
	execute if entity @s[tag=stardust.wind_turbine] unless block ~ ~ ~ iron_trapdoor run function stardust:destroy/wind_turbine

#Update
	execute if entity @s[tag=stardust.awakened_stardust_ore,tag=!simplenergy.item_destroy] run function stardust:utils/update_3_4_8
	execute if entity @s[tag=stardust.nether_stardust_ore,tag=!simplenergy.item_destroy] run function stardust:utils/update_3_4_8

