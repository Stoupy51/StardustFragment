#Dragon Pearl
	execute as @s[tag=!SF_FoundCraft] if block ~ ~ ~ barrel{Items:[{Slot:2b,id:"minecraft:dragon_breath"},{Slot:3b,id:"minecraft:dragon_breath"},{Slot:4b,id:"minecraft:dragon_breath"},{Slot:11b,id:"minecraft:dragon_breath"},{Slot:12b,id:"minecraft:ender_pearl"},{Slot:13b,id:"minecraft:dragon_breath"},{Slot:20b,id:"minecraft:dragon_breath"},{Slot:21b,id:"minecraft:dragon_breath"},{Slot:22b,id:"minecraft:dragon_breath"}]} run function stardust:craft/items/dragon_pearl
#Wormhole Potion
	execute as @s[tag=!SF_FoundCraft] if block ~ ~ ~ barrel{Items:[{Slot:2b,id:"minecraft:tropical_fish"},{Slot:3b,id:"minecraft:tropical_fish"},{Slot:4b,id:"minecraft:tropical_fish"},{Slot:11b,id:"minecraft:tropical_fish"},{Slot:12b,tag:{Potion:"minecraft:water"}},{Slot:13b,id:"minecraft:tropical_fish"},{Slot:20b,id:"minecraft:tropical_fish"},{Slot:21b,id:"minecraft:tropical_fish"},{Slot:22b,id:"minecraft:tropical_fish"}]} run function stardust:craft/items/wormhole_potion
#Diamond Seeds
	execute as @s[tag=!SF_FoundCraft] if block ~ ~ ~ barrel{Items:[{Slot:2b,id:"minecraft:wheat_seeds"},{Slot:3b,id:"minecraft:wheat_seeds"},{Slot:4b,id:"minecraft:wheat_seeds"},{Slot:11b,id:"minecraft:wheat_seeds"},{Slot:12b,id:"minecraft:diamond"},{Slot:13b,id:"minecraft:wheat_seeds"},{Slot:20b,id:"minecraft:wheat_seeds"},{Slot:21b,id:"minecraft:wheat_seeds"},{Slot:22b,id:"minecraft:wheat_seeds"}]} run function stardust:craft/items/seeds/diamond
#Celestial Portal
	execute as @s[tag=!SF_FoundCraft] unless data storage stardust:items Crafting[{Slot:12b}] if block ~ ~ ~ barrel{Items:[{Slot:2b,id:"minecraft:iron_block"},{Slot:3b,id:"minecraft:iron_block"},{Slot:4b,id:"minecraft:iron_block"},{Slot:11b,id:"minecraft:iron_block"},{Slot:13b,id:"minecraft:iron_block"},{Slot:20b,id:"minecraft:iron_block"},{Slot:21b,id:"minecraft:iron_block"},{Slot:22b,id:"minecraft:iron_block"}]} run function stardust:craft/items/portals/celestial
#Compressed Cobblestone
	execute as @s[tag=!SF_FoundCraft] if block ~ ~ ~ barrel{Items:[{Slot:2b,id:"minecraft:cobblestone"},{Slot:3b,id:"minecraft:cobblestone"},{Slot:4b,id:"minecraft:cobblestone"},{Slot:11b,id:"minecraft:cobblestone"},{Slot:12b,id:"minecraft:cobblestone"},{Slot:13b,id:"minecraft:cobblestone"},{Slot:20b,id:"minecraft:cobblestone"},{Slot:21b,id:"minecraft:cobblestone"},{Slot:22b,id:"minecraft:cobblestone"}]} run function stardust:craft/items/cobblestones/compressed
#Mirror
	execute as @s[tag=!SF_FoundCraft] if block ~ ~ ~ barrel{Items:[{Slot:2b,id:"minecraft:glass"},{Slot:3b,id:"minecraft:glass"},{Slot:4b,id:"minecraft:glass"},{Slot:12b,id:"minecraft:quartz"}]} run function stardust:craft/items/mirror
	execute as @s[tag=!SF_FoundCraft] if block ~ ~ ~ barrel{Items:[{Slot:11b,id:"minecraft:glass"},{Slot:12b,id:"minecraft:glass"},{Slot:13b,id:"minecraft:glass"},{Slot:21b,id:"minecraft:quartz"}]} run function stardust:craft/items/mirror
#Quarry Configurator
	execute as @s[tag=!SF_FoundCraft] unless data storage simplenergy:items Crafting[{Slot:2b}] unless data storage simplenergy:items Crafting[{Slot:11b}] unless data storage simplenergy:items Crafting[{Slot:20b}] if block ~ ~ ~ barrel{Items:[{Slot:3b,id:"minecraft:diamond"},{Slot:4b,id:"minecraft:diamond"},{Slot:12b,id:"minecraft:quartz"},{Slot:13b,id:"minecraft:quartz"},{Slot:21b,id:"minecraft:quartz"},{Slot:22b,id:"minecraft:quartz"}]} run function stardust:craft/items/quarry/configurator
	execute as @s[tag=!SF_FoundCraft] unless data storage simplenergy:items Crafting[{Slot:4b}] unless data storage simplenergy:items Crafting[{Slot:13b}] unless data storage simplenergy:items Crafting[{Slot:22b}] if block ~ ~ ~ barrel{Items:[{Slot:2b,id:"minecraft:diamond"},{Slot:3b,id:"minecraft:diamond"},{Slot:11b,id:"minecraft:quartz"},{Slot:12b,id:"minecraft:quartz"},{Slot:20b,id:"minecraft:quartz"},{Slot:21b,id:"minecraft:quartz"}]} run function stardust:craft/items/quarry/configurator
#Elevator
	execute as @s[tag=!SF_FoundCraft] if block ~ ~ ~ barrel{Items:[{Slot:2b,id:"minecraft:iron_block"},{Slot:3b,id:"minecraft:iron_block"},{Slot:4b,id:"minecraft:iron_block"},{Slot:11b,id:"minecraft:iron_block"},{Slot:12b,id:"minecraft:copper_block"},{Slot:13b,id:"minecraft:iron_block"},{Slot:20b,id:"minecraft:iron_block"},{Slot:21b,id:"minecraft:iron_block"},{Slot:22b,id:"minecraft:iron_block"}]} run function stardust:craft/items/elevator
#Wind Turbine
	execute as @s[tag=!SF_FoundCraft] unless data storage simplenergy:items Crafting[{Slot:2b}] unless data storage simplenergy:items Crafting[{Slot:4b}] if block ~ ~ ~ barrel{Items:[{Slot:3b,id:"minecraft:iron_ingot"},{Slot:11b,id:"minecraft:iron_ingot"},{Slot:12b,id:"minecraft:copper_ingot"},{Slot:13b,id:"minecraft:iron_ingot"},{Slot:20b,id:"minecraft:iron_block"},{Slot:21b,id:"minecraft:iron_block"},{Slot:22b,id:"minecraft:iron_block"}]} run function stardust:craft/items/wind_turbine

tag @s add SF_FoundCraft
