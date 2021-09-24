#Choose Type Of Furnace
	data modify storage simplenergy:items Furnace set from block ~ ~ ~
	execute store result score CookTime SE_Data2 run data get storage simplenergy:items Furnace.CookTime
	execute store result score Item SE_Data2 run data get storage simplenergy:items Furnace.Items[{Slot:2b}].tag.CustomModelData
	execute if data storage simplenergy:items Furnace.RecipesUsed."simplenergy:barrel" if score CookTime SE_Data2 matches ..8 run function stardust:work/all_furnace_2
	execute if data storage simplenergy:items Furnace.RecipesUsed."simplenergy:barrel_blast" if score CookTime SE_Data2 matches ..8 run function stardust:work/all_furnace_2

execute store result score @s SE_Data2 run data get storage simplenergy:items Furnace.Items[{Slot:0b}].tag.CustomModelData
execute if score CookTime SE_Data2 matches 0 store result block ~ ~ ~ CookTime short 1 run scoreboard players get CookTime SE_Data2
data modify block ~ ~ ~ Items set from storage simplenergy:items Furnace.Items
