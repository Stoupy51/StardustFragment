#Choose Type Of Furnace
	data modify storage simplenergy:items all.Furnace set from block ~ ~ ~
	execute store result score CookTime SimplEnergy_Data run data get storage simplenergy:items all.Furnace.CookTime
	execute store result score Temp SimplEnergy_Data run data get storage simplenergy:items all.Furnace.Items[{Slot:2b}].tag.CustomModelData
	execute if data storage simplenergy:items all.Furnace.RecipesUsed."simplenergy:barrel" if score CookTime SimplEnergy_Data matches ..8 run function stardust:work/all_furnace_2
	execute if data storage simplenergy:items all.Furnace.RecipesUsed."simplenergy:barrel_blast" if score CookTime SimplEnergy_Data matches ..8 run function stardust:work/all_furnace_2
	execute if data storage simplenergy:items all.Furnace.RecipesUsed."simplenergy:command_block" if score CookTime SimplEnergy_Data matches ..8 run function stardust:work/all_furnace_2
	execute if data storage simplenergy:items all.Furnace.RecipesUsed."simplenergy:command_block_blast" if score CookTime SimplEnergy_Data matches ..8 run function stardust:work/all_furnace_2

execute if score CookTime SimplEnergy_Data matches 0 store result block ~ ~ ~ CookTime short 1 run scoreboard players get CookTime SimplEnergy_Data
data modify block ~ ~ ~ Items set from storage simplenergy:items all.Furnace.Items
