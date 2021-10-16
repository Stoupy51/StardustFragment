function stardust:craft/drop_gui
function stardust:craft/gui

#Verifying if craft has been done
scoreboard players set Crafted SF_Data 0
scoreboard players set Count SF_Data 0
data modify storage stardust:items Crafting set from block ~ ~ ~ Items
execute store result score Crafted SF_Data run data get storage stardust:items Crafting[{Slot:16b}].tag.CustomModelData
execute store result score Count SF_Data run data get storage stardust:items Crafting[{Slot:16b}].Count
execute if score Crafted SF_Data matches 2011929 run scoreboard players set Count SF_Data 0
execute if score @s[tag=SF_WaitingCraft] SF_Data = Crafted SF_Data unless score Count SF_Data = @s SF_X run function stardust:craft/crafted
execute unless score @s[tag=SF_WaitingCraft] SF_Data = Crafted SF_Data run function stardust:craft/crafted
execute unless score @s SF_X = Count SF_Data run function stardust:craft/drop

tag @s remove SF_WaitingCraft
tag @s remove SF_FoundCraft
item replace block ~ ~ ~ container.16 with minecraft:cobblestone{CustomModelData:2011929,CustomItem:1s,SE_CustomTextureItem:1s,display:{Name:'[{"text":""}]'}}
scoreboard players set @s SF_Data 0
scoreboard players set @s SF_X 1

#Skip useless checks
	execute as @s[tag=!SF_FoundCraft] unless data storage stardust:items Crafting[{Slot:2b}] unless data storage stardust:items Crafting[{Slot:3b}] unless data storage stardust:items Crafting[{Slot:4b}] unless data storage stardust:items Crafting[{Slot:12b}] unless data storage stardust:items Crafting[{Slot:12b}] unless data storage stardust:items Crafting[{Slot:13b}] unless data storage stardust:items Crafting[{Slot:20b}] unless data storage stardust:items Crafting[{Slot:21b}] unless data storage stardust:items Crafting[{Slot:22b}] run function stardust:craft/no_craft_found
#Dragon Pearl
	execute as @s[tag=!SF_FoundCraft] if block ~ ~ ~ barrel{Items:[{Slot:2b,id:"minecraft:dragon_breath"},{Slot:3b,id:"minecraft:dragon_breath"},{Slot:4b,id:"minecraft:dragon_breath"},{Slot:11b,id:"minecraft:dragon_breath"},{Slot:12b,id:"minecraft:ender_pearl"},{Slot:13b,id:"minecraft:dragon_breath"},{Slot:20b,id:"minecraft:dragon_breath"},{Slot:21b,id:"minecraft:dragon_breath"},{Slot:22b,id:"minecraft:dragon_breath"}]} run function stardust:craft/items/dragon_pearl
#Wormhole Potion
	execute as @s[tag=!SF_FoundCraft] if block ~ ~ ~ barrel{Items:[{Slot:2b,id:"minecraft:tropical_fish"},{Slot:3b,id:"minecraft:tropical_fish"},{Slot:4b,id:"minecraft:tropical_fish"},{Slot:11b,id:"minecraft:tropical_fish"},{Slot:12b,tag:{Potion:"minecraft:water"}},{Slot:13b,id:"minecraft:tropical_fish"},{Slot:20b,id:"minecraft:tropical_fish"},{Slot:21b,id:"minecraft:tropical_fish"},{Slot:22b,id:"minecraft:tropical_fish"}]} run function stardust:craft/items/wormhole_potion
	execute as @s[tag=!SF_FoundCraft] if block ~ ~ ~ barrel{Items:[{Slot:2b,tag:{SF_WormholePotion:1s}},{Slot:3b,tag:{SF_WormholePotion:1s}},{Slot:4b,tag:{SF_WormholePotion:1s}},{Slot:11b,tag:{SF_WormholePotion:1s}},{Slot:12b,tag:{SF_WormholePotion:1s}},{Slot:13b,tag:{SF_WormholePotion:1s}},{Slot:20b,tag:{SF_WormholePotion:1s}},{Slot:21b,tag:{SF_WormholePotion:1s}},{Slot:22b,tag:{SF_WormholePotion:1s}}]} run function stardust:craft/items/wormhole_potion_x9
#Diamond Seeds
	execute as @s[tag=!SF_FoundCraft] if block ~ ~ ~ barrel{Items:[{Slot:2b,id:"minecraft:wheat_seeds"},{Slot:3b,id:"minecraft:wheat_seeds"},{Slot:4b,id:"minecraft:wheat_seeds"},{Slot:11b,id:"minecraft:wheat_seeds"},{Slot:12b,id:"minecraft:diamond"},{Slot:13b,id:"minecraft:wheat_seeds"},{Slot:20b,id:"minecraft:wheat_seeds"},{Slot:21b,id:"minecraft:wheat_seeds"},{Slot:22b,id:"minecraft:wheat_seeds"}]} run function stardust:craft/items/seeds/diamond
	execute as @s[tag=!SF_FoundCraft] if block ~ ~ ~ barrel{Items:[{Slot:2b,id:"minecraft:diamond"},{Slot:3b,id:"minecraft:diamond"},{Slot:4b,id:"minecraft:diamond"},{Slot:11b,id:"minecraft:diamond"},{Slot:12b,tag:{SF_DiamondSeed:1s}},{Slot:13b,id:"minecraft:diamond"},{Slot:20b,id:"minecraft:diamond"},{Slot:21b,id:"minecraft:diamond"},{Slot:22b,id:"minecraft:diamond"}]} run function stardust:craft/items/seeds/advanced_diamond
#Celestial Portal
	execute as @s[tag=!SF_FoundCraft] unless data storage stardust:items Crafting[{Slot:12b}] if block ~ ~ ~ barrel{Items:[{Slot:2b,id:"minecraft:iron_block"},{Slot:3b,id:"minecraft:iron_block"},{Slot:4b,id:"minecraft:iron_block"},{Slot:11b,id:"minecraft:iron_block"},{Slot:13b,id:"minecraft:iron_block"},{Slot:20b,id:"minecraft:iron_block"},{Slot:21b,id:"minecraft:iron_block"},{Slot:22b,id:"minecraft:iron_block"}]} run function stardust:craft/items/portals/celestial
#Stoupy's Egg
	execute as @s[tag=!SF_FoundCraft] if block ~ ~ ~ barrel{Items:[{Slot:2b,tag:{SF_DogExcrement:1s}},{Slot:3b,tag:{SF_DogExcrement:1s}},{Slot:4b,tag:{SF_DogExcrement:1s}},{Slot:11b,tag:{SF_DogExcrement:1s}},{Slot:12b,id:"minecraft:cake"},{Slot:13b,tag:{SF_DogExcrement:1s}},{Slot:20b,tag:{SF_DogExcrement:1s}},{Slot:21b,tag:{SF_DogExcrement:1s}},{Slot:22b,tag:{SF_DogExcrement:1s}}]} run function stardust:craft/items/stoup_egg
#Compressed Cobblestone
	execute as @s[tag=!SF_FoundCraft] if block ~ ~ ~ barrel{Items:[{Slot:2b,id:"minecraft:cobblestone"},{Slot:3b,id:"minecraft:cobblestone"},{Slot:4b,id:"minecraft:cobblestone"},{Slot:11b,id:"minecraft:cobblestone"},{Slot:12b,id:"minecraft:cobblestone"},{Slot:13b,id:"minecraft:cobblestone"},{Slot:20b,id:"minecraft:cobblestone"},{Slot:21b,id:"minecraft:cobblestone"},{Slot:22b,id:"minecraft:cobblestone"}]} run function stardust:craft/items/cobblestones/compressed
#Mirror
	execute as @s[tag=!SF_FoundCraft] if block ~ ~ ~ barrel{Items:[{Slot:2b,id:"minecraft:glass"},{Slot:3b,id:"minecraft:glass"},{Slot:4b,id:"minecraft:glass"},{Slot:12b,id:"minecraft:quartz"}]} run function stardust:craft/items/mirror
	execute as @s[tag=!SF_FoundCraft] if block ~ ~ ~ barrel{Items:[{Slot:11b,id:"minecraft:glass"},{Slot:12b,id:"minecraft:glass"},{Slot:13b,id:"minecraft:glass"},{Slot:21b,id:"minecraft:quartz"}]} run function stardust:craft/items/mirror
#Machine Frame
	execute as @s[tag=!SF_FoundCraft] if block ~ ~ ~ barrel{Items:[{Slot:2b,id:"minecraft:iron_ingot"},{Slot:3b,id:"minecraft:iron_ingot"},{Slot:4b,id:"minecraft:iron_ingot"},{Slot:11b,id:"minecraft:iron_ingot"},{Slot:12b,tag:{SE_SimpluniumBlock:1s}},{Slot:13b,id:"minecraft:iron_ingot"},{Slot:20b,id:"minecraft:iron_ingot"},{Slot:21b,id:"minecraft:iron_ingot"},{Slot:22b,id:"minecraft:iron_ingot"}]} run function stardust:craft/items/machine_frame
#Advanced Furnace Generator
	execute as @s[tag=!SF_FoundCraft] if block ~ ~ ~ barrel{Items:[{Slot:2b,tag:{SF_MachineFrame:1s}},{Slot:3b,tag:{SF_MachineFrame:1s}},{Slot:4b,tag:{SF_MachineFrame:1s}},{Slot:11b,id:"minecraft:glass"},{Slot:12b,tag:{SE_FurnaceGenerator:1s}},{Slot:13b,id:"minecraft:glass"},{Slot:20b,id:"minecraft:iron_block"},{Slot:21b,id:"minecraft:iron_block"},{Slot:22b,id:"minecraft:iron_block"}]} run function stardust:craft/items/advanced_furnace_generator
#Redstone Generator
	execute as @s[tag=!SF_FoundCraft] if block ~ ~ ~ barrel{Items:[{Slot:2b,tag:{SF_MachineFrame:1s}},{Slot:3b,tag:{SF_MachineFrame:1s}},{Slot:4b,tag:{SF_MachineFrame:1s}},{Slot:11b,id:"minecraft:redstone_block"},{Slot:12b,tag:{SE_FurnaceGenerator:1s}},{Slot:13b,id:"minecraft:redstone_block"},{Slot:20b,id:"minecraft:redstone_block"},{Slot:21b,id:"minecraft:redstone_block"},{Slot:22b,id:"minecraft:redstone_block"}]} run function stardust:craft/items/redstone_generator
#Nether Star Generator
	execute as @s[tag=!SF_FoundCraft] if block ~ ~ ~ barrel{Items:[{Slot:2b,tag:{SF_MachineFrame:1s}},{Slot:3b,tag:{SF_MachineFrame:1s}},{Slot:4b,tag:{SF_MachineFrame:1s}},{Slot:11b,id:"minecraft:nether_star"},{Slot:12b,tag:{SF_RedstoneGenerator:1s}},{Slot:13b,id:"minecraft:nether_star"},{Slot:20b,id:"minecraft:iron_block"},{Slot:21b,id:"minecraft:iron_block"},{Slot:22b,id:"minecraft:iron_block"}]} run function stardust:craft/items/nether_star_generator
#Heat Generator
	execute as @s[tag=!SF_FoundCraft] if block ~ ~ ~ barrel{Items:[{Slot:2b,id:"minecraft:iron_block"},{Slot:3b,id:"minecraft:glass"},{Slot:4b,id:"minecraft:iron_block"},{Slot:11b,id:"minecraft:glass"},{Slot:12b,tag:{SF_MachineFrame:1s}},{Slot:13b,id:"minecraft:glass"},{Slot:20b,id:"minecraft:iron_block"},{Slot:21b,id:"minecraft:glass"},{Slot:22b,id:"minecraft:iron_block"}]} run function stardust:craft/items/heat_generator
#Empty Module
	execute as @s[tag=!SF_FoundCraft] if block ~ ~ ~ barrel{Items:[{Slot:2b,id:"minecraft:paper"},{Slot:3b,id:"minecraft:paper"},{Slot:4b,id:"minecraft:paper"},{Slot:11b,id:"minecraft:paper"},{Slot:12b,tag:{SE_SimpluniumIngot:1s}},{Slot:13b,id:"minecraft:paper"},{Slot:20b,id:"minecraft:paper"},{Slot:21b,id:"minecraft:paper"},{Slot:22b,id:"minecraft:paper"}]} run function stardust:craft/items/empty_module
#Silk Touch Module
	execute as @s[tag=!SF_FoundCraft] if block ~ ~ ~ barrel{Items:[{Slot:2b,id:"minecraft:iron_ore"},{Slot:3b,id:"minecraft:iron_ore"},{Slot:4b,id:"minecraft:iron_ore"},{Slot:11b,id:"minecraft:iron_ore"},{Slot:12b,tag:{SF_EmptyModule:1s}},{Slot:13b,id:"minecraft:iron_ore"},{Slot:20b,id:"minecraft:iron_ore"},{Slot:21b,id:"minecraft:iron_ore"},{Slot:22b,id:"minecraft:iron_ore"}]} run function stardust:craft/items/silk_touch_module
#Fortune Module
	execute as @s[tag=!SF_FoundCraft] if block ~ ~ ~ barrel{Items:[{Slot:2b,id:"minecraft:emerald"},{Slot:3b,id:"minecraft:diamond"},{Slot:4b,id:"minecraft:emerald"},{Slot:11b,id:"minecraft:diamond"},{Slot:12b,tag:{SF_EmptyModule:1s}},{Slot:13b,id:"minecraft:diamond"},{Slot:20b,id:"minecraft:emerald"},{Slot:21b,id:"minecraft:diamond"},{Slot:22b,id:"minecraft:emerald"}]} run function stardust:craft/items/fortune_module
#Quarry Configurator
	execute as @s[tag=!SE_WaitingCraft] unless data storage simplenergy:items Crafting[{Slot:2b}] unless data storage simplenergy:items Crafting[{Slot:11b}] unless data storage simplenergy:items Crafting[{Slot:20b}] if block ~ ~ ~ barrel{Items:[{Slot:3b,id:"minecraft:diamond"},{Slot:4b,id:"minecraft:diamond"},{Slot:12b,id:"minecraft:quartz"},{Slot:13b,id:"minecraft:quartz"},{Slot:21b,id:"minecraft:quartz"},{Slot:22b,id:"minecraft:quartz"}]} run function stardust:craft/items/quarry/configurator
	execute as @s[tag=!SE_WaitingCraft] unless data storage simplenergy:items Crafting[{Slot:4b}] unless data storage simplenergy:items Crafting[{Slot:13b}] unless data storage simplenergy:items Crafting[{Slot:22b}] if block ~ ~ ~ barrel{Items:[{Slot:2b,id:"minecraft:diamond"},{Slot:3b,id:"minecraft:diamond"},{Slot:11b,id:"minecraft:quartz"},{Slot:12b,id:"minecraft:quartz"},{Slot:20b,id:"minecraft:quartz"},{Slot:21b,id:"minecraft:quartz"}]} run function stardust:craft/items/quarry/configurator
#Elevator
	execute as @s[tag=!SF_FoundCraft] if block ~ ~ ~ barrel{Items:[{Slot:2b,id:"minecraft:iron_block"},{Slot:3b,id:"minecraft:iron_block"},{Slot:4b,id:"minecraft:iron_block"},{Slot:11b,id:"minecraft:iron_block"},{Slot:12b,id:"minecraft:copper_block"},{Slot:13b,id:"minecraft:iron_block"},{Slot:20b,id:"minecraft:iron_block"},{Slot:21b,id:"minecraft:iron_block"},{Slot:22b,id:"minecraft:iron_block"}]} run function stardust:craft/items/elevator
#Wind Turbine
	execute as @s[tag=!SF_FoundCraft] unless data storage simplenergy:items Crafting[{Slot:2b}] unless data storage simplenergy:items Crafting[{Slot:4b}] if block ~ ~ ~ barrel{Items:[{Slot:3b,id:"minecraft:iron_ingot"},{Slot:11b,id:"minecraft:iron_ingot"},{Slot:12b,id:"minecraft:copper_ingot"},{Slot:13b,id:"minecraft:iron_ingot"},{Slot:20b,id:"minecraft:iron_block"},{Slot:21b,id:"minecraft:iron_block"},{Slot:22b,id:"minecraft:iron_block"}]} run function stardust:craft/items/wind_turbine

#Types Crafts
	execute as @s[tag=!SF_FoundCraft] run function stardust:craft/types/all
