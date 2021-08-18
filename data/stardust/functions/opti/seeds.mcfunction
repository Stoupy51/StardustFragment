#Timer
	scoreboard players add @s[tag=SF_Seed,tag=!SF_SeedDone] SF_Data 1
	execute if entity @s[tag=SF_Seed,tag=!SF_SeedDone] if block ~ ~-2 ~ minecraft:dragon_egg run scoreboard players add @s SF_Data 4
	execute if entity @s[tag=SF_Seed,tag=!SF_SeedDone] if block ~ ~-2 ~ minecraft:dragon_egg if block ~ ~-3 ~ minecraft:netherite_block run scoreboard players add @s SF_Data 5
#FirstStep
	data modify entity @s[tag=SF_DiamondSeed,scores={SF_Data=60..69}] Item.tag.CustomModelData set value 2013208
	data modify entity @s[tag=SF_AdvancedDiamondSeed,scores={SF_Data=60..69}] Item.tag.CustomModelData set value 2013209
	data modify entity @s[tag=SF_StardustSeed,scores={SF_Data=20..29}] Item.tag.CustomModelData set value 2013210
	data modify entity @s[tag=SF_AdvancedStardustSeed,scores={SF_Data=20..29}] Item.tag.CustomModelData set value 2013211
	data modify entity @s[tag=SF_EliteStardustSeed,scores={SF_Data=20..29}] Item.tag.CustomModelData set value 2013212
	data modify entity @s[tag=SF_LegendarySeed,scores={SF_Data=720..729}] Item.tag.CustomModelData set value 2013213
	data modify entity @s[tag=SF_SolarSeed,scores={SF_Data=720..729}] Item.tag.CustomModelData set value 2013214
	data modify entity @s[tag=SF_DarkSeed,scores={SF_Data=720..729}] Item.tag.CustomModelData set value 2013215
#FinalStep
	data modify entity @s[tag=SF_DiamondSeed,scores={SF_Data=120..}] Item.tag.CustomModelData set value 2013216
	data modify entity @s[tag=SF_AdvancedDiamondSeed,scores={SF_Data=120..}] Item.tag.CustomModelData set value 2013217
	data modify entity @s[tag=SF_StardustSeed,scores={SF_Data=40..}] Item.tag.CustomModelData set value 2013218
	data modify entity @s[tag=SF_AdvancedStardustSeed,scores={SF_Data=40..}] Item.tag.CustomModelData set value 2013219
	data modify entity @s[tag=SF_EliteStardustSeed,scores={SF_Data=40..}] Item.tag.CustomModelData set value 2013220
	data modify entity @s[tag=SF_LegendarySeed,scores={SF_Data=1440..}] Item.tag.CustomModelData set value 2013221
	data modify entity @s[tag=SF_SolarSeed,scores={SF_Data=1440..}] Item.tag.CustomModelData set value 2013222
	data modify entity @s[tag=SF_DarkSeed,scores={SF_Data=1440..}] Item.tag.CustomModelData set value 2013223
	execute if entity @s[tag=SF_DiamondSeeds,scores={SF_Data=120..}] run tag @s add SF_SeedDone
	execute if entity @s[tag=SF_StardustSeeds,scores={SF_Data=40..}] run tag @s add SF_SeedDone
	execute if entity @s[tag=SF_ElementarySeeds,scores={SF_Data=1440..}] run tag @s add SF_SeedDone
