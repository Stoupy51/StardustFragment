#Ultimate Wire
	execute as @s[tag=!SF_FoundCraft] if block ~ ~ ~ barrel{Items:[{Slot:2b,tag:{SF_UltimateFragment:1s}},{Slot:3b,tag:{SF_UltimateFragment:1s}},{Slot:4b,tag:{SF_UltimateFragment:1s}},{Slot:11b,tag:{SF_UltimateFragment:1s}},{Slot:12b,tag:{SF_AwakenedStardustWire:1s}},{Slot:13b,tag:{SF_UltimateFragment:1s}},{Slot:22b,tag:{SF_UltimateFragment:1s}},{Slot:21b,tag:{SF_UltimateFragment:1s}},{Slot:22b,tag:{SF_UltimateFragment:1s}}]} run function stardust:craft/items/ultimate_wire

#No Craft Found
	execute as @s[tag=!SF_FoundCraft] unless data storage stardust:items Crafting[{Slot:16b,tag:{SF_UltimateFragment:1s}}] run function stardust:craft/no_craft_found
