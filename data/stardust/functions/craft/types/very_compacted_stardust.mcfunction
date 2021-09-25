#Quarry Lv.1
	execute as @s[tag=!SF_FoundCraft] if block ~ ~ ~ barrel{Items:[{Slot:2b,tag:{SF_VeryCompactedStardust:1s}},{Slot:3b,tag:{SF_VeryCompactedStardust:1s}},{Slot:4b,tag:{SF_VeryCompactedStardust:1s}},{Slot:11b,tag:{SF_TripleCompressedCobblestone:1s}},{Slot:12b,id:"minecraft:netherite_pickaxe"},{Slot:13b,tag:{SF_TripleCompressedCobblestone:1s}},{Slot:20b,tag:{SF_TripleCompressedCobblestone:1s}},{Slot:21b,tag:{SF_TripleCompressedCobblestone:1s}},{Slot:22b,tag:{SF_TripleCompressedCobblestone:1s}}]} run function stardust:craft/items/quarry/lv1
#Stardust Portal
	execute as @s[tag=!SF_FoundCraft] unless data storage stardust:items Crafting[{Slot:12b}] if block ~ ~ ~ barrel{Items:[{Slot:2b,tag:{SF_VeryCompactedStardust:1s}},{Slot:3b,tag:{SF_VeryCompactedStardust:1s}},{Slot:4b,tag:{SF_VeryCompactedStardust:1s}},{Slot:11b,tag:{SF_VeryCompactedStardust:1s}},{Slot:13b,tag:{SF_VeryCompactedStardust:1s}},{Slot:20b,tag:{SF_VeryCompactedStardust:1s}},{Slot:21b,tag:{SF_VeryCompactedStardust:1s}},{Slot:22b,tag:{SF_VeryCompactedStardust:1s}}]} run function stardust:craft/items/portals/stardust

#Compacted Stardust
	execute as @s[tag=!SF_FoundCraft] if data storage stardust:items Crafting[{Slot:2b,tag:{SF_VeryCompactedStardust:1s}}] unless data storage stardust:items Crafting[{Slot:3b}] unless data storage stardust:items Crafting[{Slot:4b}] unless data storage stardust:items Crafting[{Slot:11b}] unless data storage stardust:items Crafting[{Slot:12b}] unless data storage stardust:items Crafting[{Slot:13b}] unless data storage stardust:items Crafting[{Slot:20b}] unless data storage stardust:items Crafting[{Slot:21b}] unless data storage stardust:items Crafting[{Slot:22b}] run function stardust:craft/items/compacted_stardust_x9
	execute as @s[tag=!SF_FoundCraft] if data storage stardust:items Crafting[{Slot:3b,tag:{SF_VeryCompactedStardust:1s}}] unless data storage stardust:items Crafting[{Slot:2b}] unless data storage stardust:items Crafting[{Slot:4b}] unless data storage stardust:items Crafting[{Slot:11b}] unless data storage stardust:items Crafting[{Slot:12b}] unless data storage stardust:items Crafting[{Slot:13b}] unless data storage stardust:items Crafting[{Slot:20b}] unless data storage stardust:items Crafting[{Slot:21b}] unless data storage stardust:items Crafting[{Slot:22b}] run function stardust:craft/items/compacted_stardust_x9
	execute as @s[tag=!SF_FoundCraft] if data storage stardust:items Crafting[{Slot:4b,tag:{SF_VeryCompactedStardust:1s}}] unless data storage stardust:items Crafting[{Slot:2b}] unless data storage stardust:items Crafting[{Slot:3b}] unless data storage stardust:items Crafting[{Slot:11b}] unless data storage stardust:items Crafting[{Slot:12b}] unless data storage stardust:items Crafting[{Slot:13b}] unless data storage stardust:items Crafting[{Slot:20b}] unless data storage stardust:items Crafting[{Slot:21b}] unless data storage stardust:items Crafting[{Slot:22b}] run function stardust:craft/items/compacted_stardust_x9
	execute as @s[tag=!SF_FoundCraft] if data storage stardust:items Crafting[{Slot:11b,tag:{SF_VeryCompactedStardust:1s}}] unless data storage stardust:items Crafting[{Slot:2b}] unless data storage stardust:items Crafting[{Slot:3b}] unless data storage stardust:items Crafting[{Slot:4b}] unless data storage stardust:items Crafting[{Slot:12b}] unless data storage stardust:items Crafting[{Slot:13b}] unless data storage stardust:items Crafting[{Slot:20b}] unless data storage stardust:items Crafting[{Slot:21b}] unless data storage stardust:items Crafting[{Slot:22b}] run function stardust:craft/items/compacted_stardust_x9
	execute as @s[tag=!SF_FoundCraft] if data storage stardust:items Crafting[{Slot:12b,tag:{SF_VeryCompactedStardust:1s}}] unless data storage stardust:items Crafting[{Slot:2b}] unless data storage stardust:items Crafting[{Slot:3b}] unless data storage stardust:items Crafting[{Slot:4b}] unless data storage stardust:items Crafting[{Slot:11b}] unless data storage stardust:items Crafting[{Slot:13b}] unless data storage stardust:items Crafting[{Slot:20b}] unless data storage stardust:items Crafting[{Slot:21b}] unless data storage stardust:items Crafting[{Slot:22b}] run function stardust:craft/items/compacted_stardust_x9
	execute as @s[tag=!SF_FoundCraft] if data storage stardust:items Crafting[{Slot:13b,tag:{SF_VeryCompactedStardust:1s}}] unless data storage stardust:items Crafting[{Slot:2b}] unless data storage stardust:items Crafting[{Slot:3b}] unless data storage stardust:items Crafting[{Slot:4b}] unless data storage stardust:items Crafting[{Slot:11b}] unless data storage stardust:items Crafting[{Slot:12b}] unless data storage stardust:items Crafting[{Slot:20b}] unless data storage stardust:items Crafting[{Slot:21b}] unless data storage stardust:items Crafting[{Slot:22b}] run function stardust:craft/items/compacted_stardust_x9
	execute as @s[tag=!SF_FoundCraft] if data storage stardust:items Crafting[{Slot:20b,tag:{SF_VeryCompactedStardust:1s}}] unless data storage stardust:items Crafting[{Slot:2b}] unless data storage stardust:items Crafting[{Slot:3b}] unless data storage stardust:items Crafting[{Slot:4b}] unless data storage stardust:items Crafting[{Slot:11b}] unless data storage stardust:items Crafting[{Slot:12b}] unless data storage stardust:items Crafting[{Slot:13b}] unless data storage stardust:items Crafting[{Slot:21b}] unless data storage stardust:items Crafting[{Slot:22b}] run function stardust:craft/items/compacted_stardust_x9
	execute as @s[tag=!SF_FoundCraft] if data storage stardust:items Crafting[{Slot:21b,tag:{SF_VeryCompactedStardust:1s}}] unless data storage stardust:items Crafting[{Slot:2b}] unless data storage stardust:items Crafting[{Slot:3b}] unless data storage stardust:items Crafting[{Slot:4b}] unless data storage stardust:items Crafting[{Slot:11b}] unless data storage stardust:items Crafting[{Slot:12b}] unless data storage stardust:items Crafting[{Slot:13b}] unless data storage stardust:items Crafting[{Slot:20b}] unless data storage stardust:items Crafting[{Slot:22b}] run function stardust:craft/items/compacted_stardust_x9
	execute as @s[tag=!SF_FoundCraft] if data storage stardust:items Crafting[{Slot:22b,tag:{SF_VeryCompactedStardust:1s}}] unless data storage stardust:items Crafting[{Slot:2b}] unless data storage stardust:items Crafting[{Slot:3b}] unless data storage stardust:items Crafting[{Slot:4b}] unless data storage stardust:items Crafting[{Slot:11b}] unless data storage stardust:items Crafting[{Slot:12b}] unless data storage stardust:items Crafting[{Slot:13b}] unless data storage stardust:items Crafting[{Slot:20b}] unless data storage stardust:items Crafting[{Slot:21b}] run function stardust:craft/items/compacted_stardust_x9
#Stardust Furnace Generator
	execute as @s[tag=!SF_FoundCraft] if block ~ ~ ~ barrel{Items:[{Slot:2b,tag:{SF_StardustFrame:1s}},{Slot:3b,tag:{SF_StardustFrame:1s}},{Slot:4b,tag:{SF_StardustFrame:1s}},{Slot:11b,tag:{SF_VeryCompactedStardust:1s}},{Slot:12b,tag:{SF_AdvancedFurnaceGenerator:1s}},{Slot:13b,tag:{SF_VeryCompactedStardust:1s}},{Slot:20b,tag:{SF_VeryCompactedStardust:1s}},{Slot:21b,tag:{SF_VeryCompactedStardust:1s}},{Slot:22b,tag:{SF_VeryCompactedStardust:1s}}]} run function stardust:craft/items/stardust/stardust_furnace_generator

#No Craft Found
	execute as @s[tag=!SF_FoundCraft] unless data storage stardust:items Crafting[{Slot:16b,tag:{SF_VeryCompactedStardust:1s}}] run function stardust:craft/no_craft_found
