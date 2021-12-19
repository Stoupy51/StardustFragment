#Octuple Compressed Cobblestone
	execute if score @s SE_Data2 matches 2013022 if score Temp SE_Data matches 0 run data modify storage simplenergy:items Furnace.Items[{Slot:2b}].tag set from storage stardust:items 2013012.tag
	execute if score @s SE_Data2 matches 2013022 if score Temp SE_Data matches 2013012 run data modify storage simplenergy:items Furnace.Items[{Slot:2b}].tag set from storage stardust:items 2013012.tag
	execute if score @s SE_Data2 matches 2013022 unless score Temp SE_Data matches 0 unless score Temp SE_Data matches 2013012 run scoreboard players set CookTime SE_Data 0

#Stardust ore
	execute if score @s SE_Data2 matches 2013023 if score Temp SE_Data matches 0 run data modify storage simplenergy:items Furnace.Items[{Slot:2b}].tag set from storage stardust:items 2013000.tag
	execute if score @s SE_Data2 matches 2013023 if score Temp SE_Data matches 2013000 run data modify storage simplenergy:items Furnace.Items[{Slot:2b}].tag set from storage stardust:items 2013000.tag
	execute if score @s SE_Data2 matches 2013023 unless score Temp SE_Data matches 0 unless score Temp SE_Data matches 2013000 run scoreboard players set CookTime SE_Data 0

#Deepslate Stardust ore
	execute if score @s SE_Data2 matches 2013025 if score Temp SE_Data matches 0 run data modify storage simplenergy:items Furnace.Items[{Slot:2b}].tag set from storage stardust:items 2013000.tag
	execute if score @s SE_Data2 matches 2013025 if score Temp SE_Data matches 2013000 run data modify storage simplenergy:items Furnace.Items[{Slot:2b}].tag set from storage stardust:items 2013000.tag
	execute if score @s SE_Data2 matches 2013025 unless score Temp SE_Data matches 0 unless score Temp SE_Data matches 2013000 run scoreboard players set CookTime SE_Data 0

#Nether Stardust Ore
	execute if score @s SE_Data2 matches 2013026 if score Temp SE_Data matches 0 run data modify storage simplenergy:items Furnace.Items[{Slot:2b}].tag set from storage stardust:items 2013000.tag
	execute if score @s SE_Data2 matches 2013026 if score Temp SE_Data matches 2013000 run data modify storage simplenergy:items Furnace.Items[{Slot:2b}].tag set from storage stardust:items 2013000.tag
	execute if score @s SE_Data2 matches 2013026 unless score Temp SE_Data matches 0 unless score Temp SE_Data matches 2013000 run scoreboard players set CookTime SE_Data 0

#Ender Stardust Ore
	execute if score @s SE_Data2 matches 2013027 if score Temp SE_Data matches 0 run data modify storage simplenergy:items Furnace.Items[{Slot:2b}].tag set from storage stardust:items 2013000.tag
	execute if score @s SE_Data2 matches 2013027 if score Temp SE_Data matches 2013000 run data modify storage simplenergy:items Furnace.Items[{Slot:2b}].tag set from storage stardust:items 2013000.tag
	execute if score @s SE_Data2 matches 2013027 unless score Temp SE_Data matches 0 unless score Temp SE_Data matches 2013000 run scoreboard players set CookTime SE_Data 0

#Awakened Stardust ore
	execute if score @s SE_Data2 matches 2013024 if score Temp SE_Data matches 0 run data modify storage simplenergy:items Furnace.Items[{Slot:2b}].tag set from storage stardust:items 2013004.tag
	execute if score @s SE_Data2 matches 2013024 if score Temp SE_Data matches 2013004 run data modify storage simplenergy:items Furnace.Items[{Slot:2b}].tag set from storage stardust:items 2013004.tag
	execute if score @s SE_Data2 matches 2013024 unless score Temp SE_Data matches 0 unless score Temp SE_Data matches 2013004 run scoreboard players set CookTime SE_Data 0

#Stardust Essence
	execute if score @s SE_Data2 matches 2013002 if score Temp SE_Data matches 0 run data modify storage simplenergy:items Furnace.Items[{Slot:2b}].tag set from storage stardust:items 2013004.tag
	execute if score @s SE_Data2 matches 2013002 if score Temp SE_Data matches 2013004 run data modify storage simplenergy:items Furnace.Items[{Slot:2b}].tag set from storage stardust:items 2013004.tag
	#Make 2 Essences
		execute if score @s SE_Data2 matches 2013002 if score @s SE_CraftCount matches 0 store success score @s SE_CraftCount store result storage simplenergy:items Furnace.Items[{Slot:2b}].Count byte -1 run data get storage simplenergy:items Furnace.Items[{Slot:2b}].Count -1.000001
	execute if score @s SE_Data2 matches 2013002 unless score Temp SE_Data matches 0 unless score Temp SE_Data matches 2013004 run scoreboard players set CookTime SE_Data 0
