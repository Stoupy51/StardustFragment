
#Called by function tag #simplenergy:furnace_recipes

#Stardust Ore
	execute if score #found simplenergy.data matches 0 store result score #found simplenergy.data if data storage simplenergy:items furnace.input_ctc{id:"stardust_ore"} run loot replace block ~ ~ ~ container.3 loot stardust:i/stardust_fragment

#Deepslate Stardust Ore
	execute if score #found simplenergy.data matches 0 store result score #found simplenergy.data if data storage simplenergy:items furnace.input_ctc{id:"deepslate_stardust_ore"} run loot replace block ~ ~ ~ container.3 loot stardust:i/stardust_fragment

#Nether Stardust Ore
	execute if score #found simplenergy.data matches 0 store result score #found simplenergy.data if data storage simplenergy:items furnace.input_ctc{id:"nether_stardust_ore"} run loot replace block ~ ~ ~ container.3 loot stardust:i/stardust_ingot

#Ender Stardust Ore
	execute if score #found simplenergy.data matches 0 store result score #found simplenergy.data if data storage simplenergy:items furnace.input_ctc{id:"ender_stardust_ore"} run loot replace block ~ ~ ~ container.3 loot stardust:i/stardust_essence

#Awakened Stardust Ore
	execute if score #found simplenergy.data matches 0 store result score #found simplenergy.data if data storage simplenergy:items furnace.input_ctc{id:"awakened_stardust_ore"} run loot replace block ~ ~ ~ container.3 loot stardust:i/awakened_stardust

#Stardust Essence
	execute if score #found simplenergy.data matches 0 store result score #found simplenergy.data if data storage simplenergy:items furnace.input_ctc{id:"stardust_essence"} run loot replace block ~ ~ ~ container.3 loot stardust:i/awakened_stardust_x2

#Octuple Compressed Cobblestone
	execute if score #found simplenergy.data matches 0 store result score #found simplenergy.data if data storage simplenergy:items furnace.input_ctc{id:"octuple_compressed_cobblestone"} run loot replace block ~ ~ ~ container.3 loot stardust:i/ultimate_core
