#Choose Type Of Furnace
	data modify storage simplenergy:items Furnace set from block ~ ~ ~
	execute store result score CookTime SE_Data run data get storage simplenergy:items Furnace.CookTime
	execute store result score Temp SE_Data run data get storage simplenergy:items Furnace.Items[{Slot:2b}].tag.CustomModelData
	execute if data storage simplenergy:items Furnace.RecipesUsed."simplenergy:barrel" if score CookTime SE_Data matches ..8 run function stardust:work/all_furnace_2
	execute if data storage simplenergy:items Furnace.RecipesUsed."simplenergy:barrel_blast" if score CookTime SE_Data matches ..8 run function stardust:work/all_furnace_2
	execute if data storage simplenergy:items Furnace.RecipesUsed."simplenergy:command_block" if score CookTime SE_Data matches ..8 run function stardust:work/all_furnace_2
	execute if data storage simplenergy:items Furnace.RecipesUsed."simplenergy:command_block_blast" if score CookTime SE_Data matches ..8 run function stardust:work/all_furnace_2

execute if score CookTime SE_Data matches 0 store result block ~ ~ ~ CookTime short 1 run scoreboard players get CookTime SE_Data
data modify block ~ ~ ~ Items set from storage simplenergy:items Furnace.Items
