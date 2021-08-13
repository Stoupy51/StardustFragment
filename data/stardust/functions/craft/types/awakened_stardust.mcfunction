#Awakened Stardust Block
    execute if entity @s[tag=!SF_WaitingCraft] if block ~ ~ ~ barrel{Items:[{Slot:2b,tag:{SF_AwakenedStardust:1b}},{Slot:3b,tag:{SF_AwakenedStardust:1b}},{Slot:4b,tag:{SF_AwakenedStardust:1b}},{Slot:11b,tag:{SF_AwakenedStardust:1b}},{Slot:12b,tag:{SF_AwakenedStardust:1b}},{Slot:13b,tag:{SF_AwakenedStardust:1b}},{Slot:20b,tag:{SF_AwakenedStardust:1b}},{Slot:21b,tag:{SF_AwakenedStardust:1b}},{Slot:22b,tag:{SF_AwakenedStardust:1b}}]} run function stardust:craft/items/awakened_stardust_block
#Legendary Seed
    execute if entity @s[tag=!SF_WaitingCraft] if block ~ ~ ~ barrel{Items:[{Slot:2b,tag:{SF_AwakenedStardust:1b}},{Slot:3b,tag:{SF_AwakenedStardust:1b}},{Slot:4b,tag:{SF_AwakenedStardust:1b}},{Slot:11b,tag:{SF_AwakenedStardust:1b}},{Slot:12b,id:"minecraft:lime_dye"},{Slot:13b,tag:{SF_AwakenedStardust:1b}},{Slot:20b,tag:{SF_AwakenedStardust:1b}},{Slot:21b,tag:{SF_AwakenedStardust:1b}},{Slot:22b,tag:{SF_AwakenedStardust:1b}}]} run function stardust:craft/items/seeds/legendary
#Solar Seed
    execute if entity @s[tag=!SF_WaitingCraft] if block ~ ~ ~ barrel{Items:[{Slot:2b,tag:{SF_AwakenedStardust:1b}},{Slot:3b,tag:{SF_AwakenedStardust:1b}},{Slot:4b,tag:{SF_AwakenedStardust:1b}},{Slot:11b,tag:{SF_AwakenedStardust:1b}},{Slot:12b,id:"minecraft:orange_dye"},{Slot:13b,tag:{SF_AwakenedStardust:1b}},{Slot:20b,tag:{SF_AwakenedStardust:1b}},{Slot:21b,tag:{SF_AwakenedStardust:1b}},{Slot:22b,tag:{SF_AwakenedStardust:1b}}]} run function stardust:craft/items/seeds/solar
#Dark Seed
    execute if entity @s[tag=!SF_WaitingCraft] if block ~ ~ ~ barrel{Items:[{Slot:2b,tag:{SF_AwakenedStardust:1b}},{Slot:3b,tag:{SF_AwakenedStardust:1b}},{Slot:4b,tag:{SF_AwakenedStardust:1b}},{Slot:11b,tag:{SF_AwakenedStardust:1b}},{Slot:12b,id:"minecraft:black_dye"},{Slot:13b,tag:{SF_AwakenedStardust:1b}},{Slot:20b,tag:{SF_AwakenedStardust:1b}},{Slot:21b,tag:{SF_AwakenedStardust:1b}},{Slot:22b,tag:{SF_AwakenedStardust:1b}}]} run function stardust:craft/items/seeds/dark
#Wither Killer
    execute if entity @s[tag=!SF_WaitingCraft] if block ~ ~ ~ barrel{Items:[{Slot:2b,id:"minecraft:wither_skeleton_skull"},{Slot:3b,id:"minecraft:wither_skeleton_skull"},{Slot:4b,id:"minecraft:wither_skeleton_skull"},{Slot:11b,id:"minecraft:wither_skeleton_skull"},{Slot:12b,tag:{SF_AwakenedStardust:1b}},{Slot:13b,id:"minecraft:wither_skeleton_skull"},{Slot:20b,id:"minecraft:wither_skeleton_skull"},{Slot:21b,id:"minecraft:wither_skeleton_skull"},{Slot:22b,id:"minecraft:wither_skeleton_skull"}]} run function stardust:craft/items/wither_killer