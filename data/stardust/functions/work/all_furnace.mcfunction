#Choose Type Of Furnace
	data modify storage simplenergy:items furnace set from block ~ ~ ~
	execute store result score CookTime simplenergy.data run data get storage simplenergy:items furnace.CookTime
	execute store result score #temp simplenergy.data run data get storage simplenergy:items furnace.Items[{Slot:2b}].tag.CustomModelData
	execute if data storage simplenergy:items furnace.RecipesUsed."simplenergy:barrel" if score CookTime simplenergy.data matches ..8 run function stardust:work/all_furnace_2
	execute if data storage simplenergy:items furnace.RecipesUsed."simplenergy:barrel_blast" if score CookTime simplenergy.data matches ..8 run function stardust:work/all_furnace_2
	execute if data storage simplenergy:items furnace.RecipesUsed."simplenergy:command_block" if score CookTime simplenergy.data matches ..8 run function stardust:work/all_furnace_2
	execute if data storage simplenergy:items furnace.RecipesUsed."simplenergy:command_block_blast" if score CookTime simplenergy.data matches ..8 run function stardust:work/all_furnace_2

execute if score CookTime simplenergy.data matches 0 store result block ~ ~ ~ CookTime short 1 run scoreboard players get CookTime simplenergy.data
data modify block ~ ~ ~ Items set from storage simplenergy:items furnace.Items
