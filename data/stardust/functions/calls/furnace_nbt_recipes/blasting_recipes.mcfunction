
##Called by function tag #furnace_nbt_recipes:v1/blasting_recipes
##You are allowed to call a loot table with more than 1 output count.
##(x1 cobblestone -> x2 stone for instance)

#Stardust Ore
	execute if score #found furnace_nbt_recipes.data matches 0 store result score #found furnace_nbt_recipes.data if data storage furnace_nbt_recipes:main input.tag.ctc{id:"stardust_ore"} run loot replace block ~ ~ ~ container.3 loot stardust:i/stardust_fragment

#Deepslate Stardust Ore
	execute if score #found furnace_nbt_recipes.data matches 0 store result score #found furnace_nbt_recipes.data if data storage furnace_nbt_recipes:main input.tag.ctc{id:"deepslate_stardust_ore"} run loot replace block ~ ~ ~ container.3 loot stardust:i/stardust_fragment

#Nether Stardust Ore
	execute if score #found furnace_nbt_recipes.data matches 0 store result score #found furnace_nbt_recipes.data if data storage furnace_nbt_recipes:main input.tag.ctc{id:"nether_stardust_ore"} run loot replace block ~ ~ ~ container.3 loot stardust:i/stardust_ingot

#Ender Stardust Ore
	execute if score #found furnace_nbt_recipes.data matches 0 store result score #found furnace_nbt_recipes.data if data storage furnace_nbt_recipes:main input.tag.ctc{id:"ender_stardust_ore"} run loot replace block ~ ~ ~ container.3 loot stardust:i/stardust_essence

#Awakened Stardust Ore
	execute if score #found furnace_nbt_recipes.data matches 0 store result score #found furnace_nbt_recipes.data if data storage furnace_nbt_recipes:main input.tag.ctc{id:"awakened_stardust_ore"} run loot replace block ~ ~ ~ container.3 loot stardust:i/awakened_stardust

#Octuple Compressed Cobblestone
	execute if score #found furnace_nbt_recipes.data matches 0 store result score #found furnace_nbt_recipes.data if data storage furnace_nbt_recipes:main input.tag.ctc{id:"octuple_compressed_cobblestone"} run loot replace block ~ ~ ~ container.3 loot stardust:i/ultimate_core

