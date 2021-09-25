#Original Armor/Tools
	execute as @s[tag=!SF_FoundCraft] if block ~ ~ ~ barrel{Items:[{Slot:2b,tag:{SF_StardustConfig:1s}},{Slot:3b,tag:{SF_StardustConfig:1s}},{Slot:4b,tag:{SF_StardustConfig:1s}},{Slot:11b,tag:{SF_StardustConfig:1s}},{Slot:12b,tag:{SF_ReinforcedHelmet:1s}},{Slot:13b,tag:{SF_StardustConfig:1s}},{Slot:20b,tag:{SF_StardustConfig:1s}},{Slot:21b,tag:{SF_StardustConfig:1s}},{Slot:22b,tag:{SF_StardustConfig:1s}}]} run function stardust:craft/items/original_stardust/helmet
	execute as @s[tag=!SF_FoundCraft] if block ~ ~ ~ barrel{Items:[{Slot:2b,tag:{SF_StardustConfig:1s}},{Slot:3b,tag:{SF_StardustConfig:1s}},{Slot:4b,tag:{SF_StardustConfig:1s}},{Slot:11b,tag:{SF_StardustConfig:1s}},{Slot:12b,tag:{SF_ReinforcedChestplate:1s}},{Slot:13b,tag:{SF_StardustConfig:1s}},{Slot:20b,tag:{SF_StardustConfig:1s}},{Slot:21b,tag:{SF_StardustConfig:1s}},{Slot:22b,tag:{SF_StardustConfig:1s}}]} run function stardust:craft/items/original_stardust/chestplate
	execute as @s[tag=!SF_FoundCraft] if block ~ ~ ~ barrel{Items:[{Slot:2b,tag:{SF_StardustConfig:1s}},{Slot:3b,tag:{SF_StardustConfig:1s}},{Slot:4b,tag:{SF_StardustConfig:1s}},{Slot:11b,tag:{SF_StardustConfig:1s}},{Slot:12b,tag:{SF_ReinforcedLeggings:1s}},{Slot:13b,tag:{SF_StardustConfig:1s}},{Slot:20b,tag:{SF_StardustConfig:1s}},{Slot:21b,tag:{SF_StardustConfig:1s}},{Slot:22b,tag:{SF_StardustConfig:1s}}]} run function stardust:craft/items/original_stardust/leggings
	execute as @s[tag=!SF_FoundCraft] if block ~ ~ ~ barrel{Items:[{Slot:2b,tag:{SF_StardustConfig:1s}},{Slot:3b,tag:{SF_StardustConfig:1s}},{Slot:4b,tag:{SF_StardustConfig:1s}},{Slot:11b,tag:{SF_StardustConfig:1s}},{Slot:12b,tag:{SF_ReinforcedBoots:1s}},{Slot:13b,tag:{SF_StardustConfig:1s}},{Slot:20b,tag:{SF_StardustConfig:1s}},{Slot:21b,tag:{SF_StardustConfig:1s}},{Slot:22b,tag:{SF_StardustConfig:1s}}]} run function stardust:craft/items/original_stardust/boots
	execute as @s[tag=!SF_FoundCraft] if block ~ ~ ~ barrel{Items:[{Slot:2b,tag:{SF_StardustConfig:1s}},{Slot:3b,tag:{SF_StardustConfig:1s}},{Slot:4b,tag:{SF_StardustConfig:1s}},{Slot:11b,tag:{SF_StardustConfig:1s}},{Slot:12b,tag:{SF_ReinforcedSword:1s}},{Slot:13b,tag:{SF_StardustConfig:1s}},{Slot:20b,tag:{SF_StardustConfig:1s}},{Slot:21b,tag:{SF_StardustConfig:1s}},{Slot:22b,tag:{SF_StardustConfig:1s}}]} run function stardust:craft/items/original_stardust/sword
	execute as @s[tag=!SF_FoundCraft] if block ~ ~ ~ barrel{Items:[{Slot:2b,tag:{SF_StardustConfig:1s}},{Slot:3b,tag:{SF_StardustConfig:1s}},{Slot:4b,tag:{SF_StardustConfig:1s}},{Slot:11b,tag:{SF_StardustConfig:1s}},{Slot:12b,tag:{SF_ReinforcedPickaxe:1s}},{Slot:13b,tag:{SF_StardustConfig:1s}},{Slot:20b,tag:{SF_StardustConfig:1s}},{Slot:21b,tag:{SF_StardustConfig:1s}},{Slot:22b,tag:{SF_StardustConfig:1s}}]} run function stardust:craft/items/original_stardust/pickaxe
	execute as @s[tag=!SF_FoundCraft] if block ~ ~ ~ barrel{Items:[{Slot:2b,tag:{SF_StardustConfig:1s}},{Slot:3b,tag:{SF_StardustConfig:1s}},{Slot:4b,tag:{SF_StardustConfig:1s}},{Slot:11b,tag:{SF_StardustConfig:1s}},{Slot:12b,tag:{SF_ReinforcedAxe:1s}},{Slot:13b,tag:{SF_StardustConfig:1s}},{Slot:20b,tag:{SF_StardustConfig:1s}},{Slot:21b,tag:{SF_StardustConfig:1s}},{Slot:22b,tag:{SF_StardustConfig:1s}}]} run function stardust:craft/items/original_stardust/axe
#Cobblestone Miner Lv.5
	execute as @s[tag=!SF_FoundCraft] if block ~ ~ ~ barrel{Items:[{Slot:2b,tag:{SF_StardustConfig:1s}},{Slot:3b,tag:{SF_StardustConfig:1s}},{Slot:4b,tag:{SF_StardustConfig:1s}},{Slot:11b,tag:{SF_StardustConfig:1s}},{Slot:12b,tag:{SF_CobblestoneMinerLv4:1s}},{Slot:13b,tag:{SF_StardustConfig:1s}},{Slot:20b,tag:{SF_StardustConfig:1s}},{Slot:21b,tag:{SF_StardustConfig:1s}},{Slot:22b,tag:{SF_StardustConfig:1s}}]} run function stardust:craft/items/cobblestone_miner/lv5



#Stardust Config
	execute as @s[tag=!SF_FoundCraft] if data storage stardust:items Crafting[{Slot:2b,tag:{SF_StardustConfig:1s}}] unless data storage stardust:items Crafting[{Slot:3b}] unless data storage stardust:items Crafting[{Slot:4b}] unless data storage stardust:items Crafting[{Slot:11b}] unless data storage stardust:items Crafting[{Slot:12b}] unless data storage stardust:items Crafting[{Slot:13b}] unless data storage stardust:items Crafting[{Slot:20b}] unless data storage stardust:items Crafting[{Slot:21b}] unless data storage stardust:items Crafting[{Slot:22b}] run function stardust:craft/items/stardust/stardust_essence_x8
	execute as @s[tag=!SF_FoundCraft] if data storage stardust:items Crafting[{Slot:3b,tag:{SF_StardustConfig:1s}}] unless data storage stardust:items Crafting[{Slot:2b}] unless data storage stardust:items Crafting[{Slot:4b}] unless data storage stardust:items Crafting[{Slot:11b}] unless data storage stardust:items Crafting[{Slot:12b}] unless data storage stardust:items Crafting[{Slot:13b}] unless data storage stardust:items Crafting[{Slot:20b}] unless data storage stardust:items Crafting[{Slot:21b}] unless data storage stardust:items Crafting[{Slot:22b}] run function stardust:craft/items/stardust/stardust_essence_x8
	execute as @s[tag=!SF_FoundCraft] if data storage stardust:items Crafting[{Slot:4b,tag:{SF_StardustConfig:1s}}] unless data storage stardust:items Crafting[{Slot:2b}] unless data storage stardust:items Crafting[{Slot:3b}] unless data storage stardust:items Crafting[{Slot:11b}] unless data storage stardust:items Crafting[{Slot:12b}] unless data storage stardust:items Crafting[{Slot:13b}] unless data storage stardust:items Crafting[{Slot:20b}] unless data storage stardust:items Crafting[{Slot:21b}] unless data storage stardust:items Crafting[{Slot:22b}] run function stardust:craft/items/stardust/stardust_essence_x8
	execute as @s[tag=!SF_FoundCraft] if data storage stardust:items Crafting[{Slot:11b,tag:{SF_StardustConfig:1s}}] unless data storage stardust:items Crafting[{Slot:2b}] unless data storage stardust:items Crafting[{Slot:3b}] unless data storage stardust:items Crafting[{Slot:4b}] unless data storage stardust:items Crafting[{Slot:12b}] unless data storage stardust:items Crafting[{Slot:13b}] unless data storage stardust:items Crafting[{Slot:20b}] unless data storage stardust:items Crafting[{Slot:21b}] unless data storage stardust:items Crafting[{Slot:22b}] run function stardust:craft/items/stardust/stardust_essence_x8
	execute as @s[tag=!SF_FoundCraft] if data storage stardust:items Crafting[{Slot:12b,tag:{SF_StardustConfig:1s}}] unless data storage stardust:items Crafting[{Slot:2b}] unless data storage stardust:items Crafting[{Slot:3b}] unless data storage stardust:items Crafting[{Slot:4b}] unless data storage stardust:items Crafting[{Slot:11b}] unless data storage stardust:items Crafting[{Slot:13b}] unless data storage stardust:items Crafting[{Slot:20b}] unless data storage stardust:items Crafting[{Slot:21b}] unless data storage stardust:items Crafting[{Slot:22b}] run function stardust:craft/items/stardust/stardust_essence_x8
	execute as @s[tag=!SF_FoundCraft] if data storage stardust:items Crafting[{Slot:13b,tag:{SF_StardustConfig:1s}}] unless data storage stardust:items Crafting[{Slot:2b}] unless data storage stardust:items Crafting[{Slot:3b}] unless data storage stardust:items Crafting[{Slot:4b}] unless data storage stardust:items Crafting[{Slot:11b}] unless data storage stardust:items Crafting[{Slot:12b}] unless data storage stardust:items Crafting[{Slot:20b}] unless data storage stardust:items Crafting[{Slot:21b}] unless data storage stardust:items Crafting[{Slot:22b}] run function stardust:craft/items/stardust/stardust_essence_x8
	execute as @s[tag=!SF_FoundCraft] if data storage stardust:items Crafting[{Slot:20b,tag:{SF_StardustConfig:1s}}] unless data storage stardust:items Crafting[{Slot:2b}] unless data storage stardust:items Crafting[{Slot:3b}] unless data storage stardust:items Crafting[{Slot:4b}] unless data storage stardust:items Crafting[{Slot:11b}] unless data storage stardust:items Crafting[{Slot:12b}] unless data storage stardust:items Crafting[{Slot:13b}] unless data storage stardust:items Crafting[{Slot:21b}] unless data storage stardust:items Crafting[{Slot:22b}] run function stardust:craft/items/stardust/stardust_essence_x8
	execute as @s[tag=!SF_FoundCraft] if data storage stardust:items Crafting[{Slot:21b,tag:{SF_StardustConfig:1s}}] unless data storage stardust:items Crafting[{Slot:2b}] unless data storage stardust:items Crafting[{Slot:3b}] unless data storage stardust:items Crafting[{Slot:4b}] unless data storage stardust:items Crafting[{Slot:11b}] unless data storage stardust:items Crafting[{Slot:12b}] unless data storage stardust:items Crafting[{Slot:13b}] unless data storage stardust:items Crafting[{Slot:20b}] unless data storage stardust:items Crafting[{Slot:22b}] run function stardust:craft/items/stardust/stardust_essence_x8
	execute as @s[tag=!SF_FoundCraft] if data storage stardust:items Crafting[{Slot:22b,tag:{SF_StardustConfig:1s}}] unless data storage stardust:items Crafting[{Slot:2b}] unless data storage stardust:items Crafting[{Slot:3b}] unless data storage stardust:items Crafting[{Slot:4b}] unless data storage stardust:items Crafting[{Slot:11b}] unless data storage stardust:items Crafting[{Slot:12b}] unless data storage stardust:items Crafting[{Slot:13b}] unless data storage stardust:items Crafting[{Slot:20b}] unless data storage stardust:items Crafting[{Slot:21b}] run function stardust:craft/items/stardust/stardust_essence_x8

#No Craft Found
	execute as @s[tag=!SF_FoundCraft] unless data storage stardust:items Crafting[{Slot:16b,tag:{SF_StardustConfig:1s}}] run function stardust:craft/no_craft_found
