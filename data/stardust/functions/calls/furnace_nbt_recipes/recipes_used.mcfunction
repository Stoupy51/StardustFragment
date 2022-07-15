
##Called by function tag #furnace_nbt_recipes:v1.0/recipes_used
##Default recipe used is recipes/xp/1.0
##score #type furnace_nbt_recipes.data has 3 values:
##value 0: smelting
##value 1: blasting
##value 2: smoking

#Stardust Ore
	execute if score #found furnace_nbt_recipes.data matches 0 store result score #found furnace_nbt_recipes.data if data storage furnace_nbt_recipes:main input.tag.ctc{id:"stardust_ore"} run function simplenergy:calls/furnace_nbt_recipes/xp/2.0

#Deepslate Stardust Ore
	execute if score #found furnace_nbt_recipes.data matches 0 store result score #found furnace_nbt_recipes.data if data storage furnace_nbt_recipes:main input.tag.ctc{id:"deepslate_stardust_ore"} run function simplenergy:calls/furnace_nbt_recipes/xp/2.0

#Nether Stardust Ore
	execute if score #found furnace_nbt_recipes.data matches 0 store result score #found furnace_nbt_recipes.data if data storage furnace_nbt_recipes:main input.tag.ctc{id:"nether_stardust_ore"} run function simplenergy:calls/furnace_nbt_recipes/xp/2.5

#Ender Stardust Ore
	execute if score #found furnace_nbt_recipes.data matches 0 store result score #found furnace_nbt_recipes.data if data storage furnace_nbt_recipes:main input.tag.ctc{id:"ender_stardust_ore"} run function simplenergy:calls/furnace_nbt_recipes/xp/2.5

#Awakened Stardust Ore
	execute if score #found furnace_nbt_recipes.data matches 0 store result score #found furnace_nbt_recipes.data if data storage furnace_nbt_recipes:main input.tag.ctc{id:"awakened_stardust_ore"} run function simplenergy:calls/furnace_nbt_recipes/xp/2.5

#Octuple Compressed Cobblestone
	execute if score #found furnace_nbt_recipes.data matches 0 store result score #found furnace_nbt_recipes.data if data storage furnace_nbt_recipes:main input.tag.ctc{id:"octuple_compressed_cobblestone"} run function simplenergy:calls/furnace_nbt_recipes/xp/50.0

