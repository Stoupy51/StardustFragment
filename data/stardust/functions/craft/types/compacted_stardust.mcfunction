#Very Compacted Stardust
	execute as @s[tag=!SF_WaitingCraft] if block ~ ~ ~ barrel{Items:[{Slot:2b,tag:{SF_CompactedStardust:1s}},{Slot:3b,tag:{SF_CompactedStardust:1s}},{Slot:4b,tag:{SF_CompactedStardust:1s}},{Slot:11b,tag:{SF_CompactedStardust:1s}},{Slot:12b,tag:{SF_CompactedStardust:1s}},{Slot:13b,tag:{SF_CompactedStardust:1s}},{Slot:20b,tag:{SF_CompactedStardust:1s}},{Slot:21b,tag:{SF_CompactedStardust:1s}},{Slot:22b,tag:{SF_CompactedStardust:1s}}]} run function stardust:craft/items/very_compacted_stardust


#Stardust Fragment
	execute as @s[tag=!SF_WaitingCraft] if data storage stardust:items Crafting[{Slot:2b,tag:{SF_CompactedStardust:1s}}] unless data storage stardust:items Crafting[{Slot:3b}] unless data storage stardust:items Crafting[{Slot:4b}] unless data storage stardust:items Crafting[{Slot:11b}] unless data storage stardust:items Crafting[{Slot:12b}] unless data storage stardust:items Crafting[{Slot:13b}] unless data storage stardust:items Crafting[{Slot:20b}] unless data storage stardust:items Crafting[{Slot:21b}] unless data storage stardust:items Crafting[{Slot:22b}] run function stardust:craft/items/stardust_fragment
	execute as @s[tag=!SF_WaitingCraft] if data storage stardust:items Crafting[{Slot:3b,tag:{SF_CompactedStardust:1s}}] unless data storage stardust:items Crafting[{Slot:2b}] unless data storage stardust:items Crafting[{Slot:4b}] unless data storage stardust:items Crafting[{Slot:11b}] unless data storage stardust:items Crafting[{Slot:12b}] unless data storage stardust:items Crafting[{Slot:13b}] unless data storage stardust:items Crafting[{Slot:20b}] unless data storage stardust:items Crafting[{Slot:21b}] unless data storage stardust:items Crafting[{Slot:22b}] run function stardust:craft/items/stardust_fragment
	execute as @s[tag=!SF_WaitingCraft] if data storage stardust:items Crafting[{Slot:4b,tag:{SF_CompactedStardust:1s}}] unless data storage stardust:items Crafting[{Slot:2b}] unless data storage stardust:items Crafting[{Slot:3b}] unless data storage stardust:items Crafting[{Slot:11b}] unless data storage stardust:items Crafting[{Slot:12b}] unless data storage stardust:items Crafting[{Slot:13b}] unless data storage stardust:items Crafting[{Slot:20b}] unless data storage stardust:items Crafting[{Slot:21b}] unless data storage stardust:items Crafting[{Slot:22b}] run function stardust:craft/items/stardust_fragment
	execute as @s[tag=!SF_WaitingCraft] if data storage stardust:items Crafting[{Slot:11b,tag:{SF_CompactedStardust:1s}}] unless data storage stardust:items Crafting[{Slot:2b}] unless data storage stardust:items Crafting[{Slot:3b}] unless data storage stardust:items Crafting[{Slot:4b}] unless data storage stardust:items Crafting[{Slot:12b}] unless data storage stardust:items Crafting[{Slot:13b}] unless data storage stardust:items Crafting[{Slot:20b}] unless data storage stardust:items Crafting[{Slot:21b}] unless data storage stardust:items Crafting[{Slot:22b}] run function stardust:craft/items/stardust_fragment
	execute as @s[tag=!SF_WaitingCraft] if data storage stardust:items Crafting[{Slot:12b,tag:{SF_CompactedStardust:1s}}] unless data storage stardust:items Crafting[{Slot:2b}] unless data storage stardust:items Crafting[{Slot:3b}] unless data storage stardust:items Crafting[{Slot:4b}] unless data storage stardust:items Crafting[{Slot:11b}] unless data storage stardust:items Crafting[{Slot:13b}] unless data storage stardust:items Crafting[{Slot:20b}] unless data storage stardust:items Crafting[{Slot:21b}] unless data storage stardust:items Crafting[{Slot:22b}] run function stardust:craft/items/stardust_fragment
	execute as @s[tag=!SF_WaitingCraft] if data storage stardust:items Crafting[{Slot:13b,tag:{SF_CompactedStardust:1s}}] unless data storage stardust:items Crafting[{Slot:2b}] unless data storage stardust:items Crafting[{Slot:3b}] unless data storage stardust:items Crafting[{Slot:4b}] unless data storage stardust:items Crafting[{Slot:11b}] unless data storage stardust:items Crafting[{Slot:12b}] unless data storage stardust:items Crafting[{Slot:20b}] unless data storage stardust:items Crafting[{Slot:21b}] unless data storage stardust:items Crafting[{Slot:22b}] run function stardust:craft/items/stardust_fragment
	execute as @s[tag=!SF_WaitingCraft] if data storage stardust:items Crafting[{Slot:20b,tag:{SF_CompactedStardust:1s}}] unless data storage stardust:items Crafting[{Slot:2b}] unless data storage stardust:items Crafting[{Slot:3b}] unless data storage stardust:items Crafting[{Slot:4b}] unless data storage stardust:items Crafting[{Slot:11b}] unless data storage stardust:items Crafting[{Slot:12b}] unless data storage stardust:items Crafting[{Slot:13b}] unless data storage stardust:items Crafting[{Slot:21b}] unless data storage stardust:items Crafting[{Slot:22b}] run function stardust:craft/items/stardust_fragment
	execute as @s[tag=!SF_WaitingCraft] if data storage stardust:items Crafting[{Slot:21b,tag:{SF_CompactedStardust:1s}}] unless data storage stardust:items Crafting[{Slot:2b}] unless data storage stardust:items Crafting[{Slot:3b}] unless data storage stardust:items Crafting[{Slot:4b}] unless data storage stardust:items Crafting[{Slot:11b}] unless data storage stardust:items Crafting[{Slot:12b}] unless data storage stardust:items Crafting[{Slot:13b}] unless data storage stardust:items Crafting[{Slot:20b}] unless data storage stardust:items Crafting[{Slot:22b}] run function stardust:craft/items/stardust_fragment
	execute as @s[tag=!SF_WaitingCraft] if data storage stardust:items Crafting[{Slot:22b,tag:{SF_CompactedStardust:1s}}] unless data storage stardust:items Crafting[{Slot:2b}] unless data storage stardust:items Crafting[{Slot:3b}] unless data storage stardust:items Crafting[{Slot:4b}] unless data storage stardust:items Crafting[{Slot:11b}] unless data storage stardust:items Crafting[{Slot:12b}] unless data storage stardust:items Crafting[{Slot:13b}] unless data storage stardust:items Crafting[{Slot:20b}] unless data storage stardust:items Crafting[{Slot:21b}] run function stardust:craft/items/stardust_fragment

#No Craft Found
	execute as @s[tag=!SF_WaitingCraft] unless data storage stardust:items Crafting[{Slot:16b,tag:{SF_CompactedStardust:1s}}] run function stardust:craft/no_craft_found
