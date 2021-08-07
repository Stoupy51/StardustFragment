#Others
	scoreboard players set Minute SF_Data 0
	scoreboard players set StardustPillar SF_Data 0
	execute as @e[type=minecraft:wither,tag=SF_StardustPillar] run scoreboard players add StardustPillar SF_Data 1
	execute as @e[type=minecraft:glow_item_frame,tag=SF_CobblestoneMiner] at @s if block ~ ~-1 ~ minecraft:cobblestone run function stardust:work/cobblestone_miner

#Dog Excrements
	execute as @e[type=minecraft:wolf] run scoreboard players add @e[type=minecraft:wolf,limit=1,sort=random] SF_Wolfs 1
	execute at @e[type=minecraft:wolf,scores={SF_Wolfs=10..}] run summon item ~ ~ ~ {Item:{id:"minecraft:cobblestone",Count:64b,tag:{SF_Give:1b}}}
	execute as @e[type=minecraft:item,nbt={Item:{tag:{SF_Give:1b}}}] run data modify entity @s Item set from storage stardust:items 2013011
	scoreboard players remove @e[type=minecraft:wolf,scores={SF_Wolfs=10..}] SF_Wolfs 10

#Seeds
	#Timer
		scoreboard players add @e[type=minecraft:glow_item_frame,tag=SF_Seed,tag=!SF_SeedDone] SF_Data 1
		execute as @e[type=minecraft:glow_item_frame,tag=SF_Seed,tag=!SF_SeedDone] at @s if block ~ ~-2 ~ minecraft:dragon_egg run scoreboard players add @s SF_Data 4
		execute as @e[type=minecraft:glow_item_frame,tag=SF_Seed,tag=!SF_SeedDone] at @s if block ~ ~-2 ~ minecraft:dragon_egg if block ~ ~-3 ~ minecraft:netherite_block run scoreboard players add @s SF_Data 5
	#FirstStep
		execute as @e[type=minecraft:glow_item_frame,tag=SF_StardustSeeds,scores={SF_Data=20..29}] run data modify entity @s Small set value 0b
		execute as @e[type=minecraft:glow_item_frame,tag=SF_ElementarySeeds,scores={SF_Data=720..729}] run data modify entity @s Small set value 0b
		execute as @e[type=minecraft:glow_item_frame,tag=SF_DiamondSeeds,scores={SF_Data=60..69}] run data modify entity @s Small set value 0b
	#FinalStep
		execute as @e[type=minecraft:glow_item_frame,tag=SF_StardustSeed,scores={SF_Data=40..}] run data modify entity @s ArmorItems set value [{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:5476},Enchantments:[{lvl:0,id:"minecraft:protection"}]}},{},{},{}]
		execute as @e[type=minecraft:glow_item_frame,tag=SF_AdvancedStardustSeed,scores={SF_Data=40..}] run data modify entity @s ArmorItems set value [{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:4692735},Enchantments:[{lvl:0,id:"minecraft:protection"}]}},{},{},{}]
		execute as @e[type=minecraft:glow_item_frame,tag=SF_EliteStardustSeed,scores={SF_Data=40..}] run data modify entity @s ArmorItems set value [{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:16711680},Enchantments:[{lvl:0,id:"minecraft:protection"}]}},{},{},{}]
        execute as @e[type=minecraft:glow_item_frame,tag=SF_StardustSeeds,scores={SF_Data=40..}] run tag @s add SF_SeedDone
		execute as @e[type=minecraft:glow_item_frame,tag=SF_LegendarySeed,scores={SF_Data=1440..}] run data modify entity @s ArmorItems set value [{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:65280},Enchantments:[{lvl:0,id:"minecraft:protection"}]}},{},{},{}]
		execute as @e[type=minecraft:glow_item_frame,tag=SF_SolarSeed,scores={SF_Data=1440..}] run data modify entity @s ArmorItems set value [{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:16756224},Enchantments:[{lvl:0,id:"minecraft:protection"}]}},{},{},{}]
		execute as @e[type=minecraft:glow_item_frame,tag=SF_DarkSeed,scores={SF_Data=1440..}] run data modify entity @s ArmorItems set value [{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:0},Enchantments:[{lvl:0,id:"minecraft:protection"}]}},{},{},{}]
        execute as @e[type=minecraft:glow_item_frame,tag=SF_ElementarySeeds,scores={SF_Data=1440..}] run tag @s add SF_SeedDone
		execute as @e[type=minecraft:glow_item_frame,tag=SF_DiamondSeeds,scores={SF_Data=120..}] run data modify entity @s ArmorItems set value [{id:"minecraft:diamond_boots",Count:1b,tag:{Enchantments:[{lvl:0,id:"minecraft:protection"}]}},{},{},{}]
        execute as @e[type=minecraft:glow_item_frame,tag=SF_DiamondSeeds,scores={SF_Data=120..}] run tag @s add SF_SeedDone





