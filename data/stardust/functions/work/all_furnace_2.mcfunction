#Octuple Compressed Cobblestone
	execute if score @s simplenergy.data_2 matches 2013022 if score #temp simplenergy.data matches 0 run data modify storage simplenergy:items furnace.Items[{Slot:2b}].tag set from storage stardust:items all.2013012.tag
	execute if score @s simplenergy.data_2 matches 2013022 if score #temp simplenergy.data matches 2013012 run data modify storage simplenergy:items furnace.Items[{Slot:2b}].tag set from storage stardust:items all.2013012.tag
	execute if score @s simplenergy.data_2 matches 2013022 unless score #temp simplenergy.data matches 0 unless score #temp simplenergy.data matches 2013012 run scoreboard players set CookTime simplenergy.data 0

#Stardust ore
	execute if score @s simplenergy.data_2 matches 2013023 if score #temp simplenergy.data matches 0 run data modify storage simplenergy:items furnace.Items[{Slot:2b}].tag set from storage stardust:items all.2013000.tag
	execute if score @s simplenergy.data_2 matches 2013023 if score #temp simplenergy.data matches 2013000 run data modify storage simplenergy:items furnace.Items[{Slot:2b}].tag set from storage stardust:items all.2013000.tag
	execute if score @s simplenergy.data_2 matches 2013023 unless score #temp simplenergy.data matches 0 unless score #temp simplenergy.data matches 2013000 run scoreboard players set CookTime simplenergy.data 0

#Deepslate Stardust ore
	execute if score @s simplenergy.data_2 matches 2013025 if score #temp simplenergy.data matches 0 run data modify storage simplenergy:items furnace.Items[{Slot:2b}].tag set from storage stardust:items all.2013000.tag
	execute if score @s simplenergy.data_2 matches 2013025 if score #temp simplenergy.data matches 2013000 run data modify storage simplenergy:items furnace.Items[{Slot:2b}].tag set from storage stardust:items all.2013000.tag
	execute if score @s simplenergy.data_2 matches 2013025 unless score #temp simplenergy.data matches 0 unless score #temp simplenergy.data matches 2013000 run scoreboard players set CookTime simplenergy.data 0

#Nether Stardust Ore
	execute if score @s simplenergy.data_2 matches 2013026 if score #temp simplenergy.data matches 0 run data modify storage simplenergy:items furnace.Items[{Slot:2b}].tag set from storage stardust:items all.2013000.tag
	execute if score @s simplenergy.data_2 matches 2013026 if score #temp simplenergy.data matches 2013000 run data modify storage simplenergy:items furnace.Items[{Slot:2b}].tag set from storage stardust:items all.2013000.tag
	execute if score @s simplenergy.data_2 matches 2013026 unless score #temp simplenergy.data matches 0 unless score #temp simplenergy.data matches 2013000 run scoreboard players set CookTime simplenergy.data 0

#Ender Stardust Ore
	execute if score @s simplenergy.data_2 matches 2013027 if score #temp simplenergy.data matches 0 run data modify storage simplenergy:items furnace.Items[{Slot:2b}].tag set from storage stardust:items all.2013000.tag
	execute if score @s simplenergy.data_2 matches 2013027 if score #temp simplenergy.data matches 2013000 run data modify storage simplenergy:items furnace.Items[{Slot:2b}].tag set from storage stardust:items all.2013000.tag
	execute if score @s simplenergy.data_2 matches 2013027 unless score #temp simplenergy.data matches 0 unless score #temp simplenergy.data matches 2013000 run scoreboard players set CookTime simplenergy.data 0

#Awakened Stardust ore
	execute if score @s simplenergy.data_2 matches 2013024 if score #temp simplenergy.data matches 0 run data modify storage simplenergy:items furnace.Items[{Slot:2b}].tag set from storage stardust:items all.2013004.tag
	execute if score @s simplenergy.data_2 matches 2013024 if score #temp simplenergy.data matches 2013004 run data modify storage simplenergy:items furnace.Items[{Slot:2b}].tag set from storage stardust:items all.2013004.tag
	execute if score @s simplenergy.data_2 matches 2013024 unless score #temp simplenergy.data matches 0 unless score #temp simplenergy.data matches 2013004 run scoreboard players set CookTime simplenergy.data 0

#Stardust Essence
	execute if score @s simplenergy.data_2 matches 2013002 if score #temp simplenergy.data matches 0 run data modify storage simplenergy:items furnace.Items[{Slot:2b}].tag set from storage stardust:items all.2013004.tag
	execute if score @s simplenergy.data_2 matches 2013002 if score #temp simplenergy.data matches 2013004 run data modify storage simplenergy:items furnace.Items[{Slot:2b}].tag set from storage stardust:items all.2013004.tag
	#Make 2 Essences
		execute if score @s simplenergy.data_2 matches 2013002 if score @s simplenergy.craft_count matches 0 store success score @s simplenergy.craft_count store result storage simplenergy:items furnace.Items[{Slot:2b}].Count byte -1 run data get storage simplenergy:items furnace.Items[{Slot:2b}].Count -1.001
	execute if score @s simplenergy.data_2 matches 2013002 unless score #temp simplenergy.data matches 0 unless score #temp simplenergy.data matches 2013004 run scoreboard players set CookTime simplenergy.data 0
