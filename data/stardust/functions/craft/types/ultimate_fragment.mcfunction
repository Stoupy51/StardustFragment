#Ultimate Cable
	execute as @s[tag=!SF_FoundCraft] if block ~ ~ ~ barrel{Items:[{Slot:2b,tag:{SF_UltimateFragment:1b}},{Slot:3b,tag:{SF_UltimateFragment:1b}},{Slot:4b,tag:{SF_UltimateFragment:1b}},{Slot:11b,tag:{SF_UltimateFragment:1b}},{Slot:12b,tag:{SF_AwakenedStardustCable:1b}},{Slot:13b,tag:{SF_UltimateFragment:1b}},{Slot:22b,tag:{SF_UltimateFragment:1b}},{Slot:21b,tag:{SF_UltimateFragment:1b}},{Slot:22b,tag:{SF_UltimateFragment:1b}}]} run function stardust:craft/items/ultimate/ultimate_cable
#Ultimate Battery
	execute as @s[tag=!SF_FoundCraft] if block ~ ~ ~ barrel{Items:[{Slot:2b,tag:{SF_UltimateFragment:1b}},{Slot:3b,tag:{SF_UltimateFragment:1b}},{Slot:4b,tag:{SF_UltimateFragment:1b}},{Slot:11b,tag:{SF_UltimateFragment:1b}},{Slot:12b,tag:{SF_AwakenedStardustBattery:1b}},{Slot:13b,tag:{SF_UltimateFragment:1b}},{Slot:20b,tag:{SF_UltimateFragment:1b}},{Slot:21b,tag:{SF_UltimateFragment:1b}},{Slot:22b,tag:{SF_UltimateFragment:1b}}]} run function stardust:craft/items/ultimate/ultimate_battery
#Ultimate Frame
	execute as @s[tag=!SF_FoundCraft] if block ~ ~ ~ barrel{Items:[{Slot:2b,tag:{SF_UltimateFragment:1b}},{Slot:3b,tag:{SF_UltimateFragment:1b}},{Slot:4b,tag:{SF_UltimateFragment:1b}},{Slot:11b,tag:{SF_UltimateFragment:1b}},{Slot:12b,tag:{SF_AwakenedStardustFrame:1b}},{Slot:13b,tag:{SF_UltimateFragment:1b}},{Slot:20b,tag:{SF_UltimateFragment:1b}},{Slot:21b,tag:{SF_UltimateFragment:1b}},{Slot:22b,tag:{SF_UltimateFragment:1b}}]} run function stardust:craft/items/ultimate/ultimate_frame
#Lucky Artifact Bag
	execute as @s[tag=!SF_FoundCraft] unless data storage stardust:items Crafting[{Slot:3b}] if block ~ ~ ~ barrel{Items:[{Slot:2b,id:"minecraft:leather"},{Slot:4b,id:"minecraft:leather"},{Slot:11b,id:"minecraft:leather"},{Slot:12b,tag:{SF_UltimateFragment:1b}},{Slot:13b,id:"minecraft:leather"},{Slot:20b,id:"minecraft:leather"},{Slot:21b,id:"minecraft:leather"},{Slot:22b,id:"minecraft:leather"}]} run function stardust:craft/items/lucky_artifact_bag

#No Craft Found
	execute as @s[tag=!SF_FoundCraft] unless data storage stardust:items Crafting[{Slot:16b,tag:{SF_UltimateFragment:1b}}] run function stardust:craft/no_craft_found
