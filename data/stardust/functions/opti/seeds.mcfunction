#Timer
	scoreboard players add @s[tag=StardustFragment_Seed] StardustFragment_Data 1
	execute as @s[tag=StardustFragment_Seed] if block ~ ~-2 ~ minecraft:dragon_egg run scoreboard players add @s StardustFragment_Data 4
	execute as @s[tag=StardustFragment_Seed] if block ~ ~-2 ~ minecraft:dragon_egg if block ~ ~-3 ~ minecraft:netherite_block run scoreboard players add @s StardustFragment_Data 5
#FirstStep
	data modify entity @s[tag=StardustFragment_DiamondSeed,scores={StardustFragment_Data=60..69}] Item.tag.CustomModelData set value 2013208
	data modify entity @s[tag=StardustFragment_AdvancedDiamondSeed,scores={StardustFragment_Data=60..69}] Item.tag.CustomModelData set value 2013209
	data modify entity @s[tag=StardustFragment_StardustSeed,scores={StardustFragment_Data=20..29}] Item.tag.CustomModelData set value 2013210
	data modify entity @s[tag=StardustFragment_AdvancedStardustSeed,scores={StardustFragment_Data=20..29}] Item.tag.CustomModelData set value 2013211
	data modify entity @s[tag=StardustFragment_EliteStardustSeed,scores={StardustFragment_Data=20..29}] Item.tag.CustomModelData set value 2013212
	data modify entity @s[tag=StardustFragment_LegendarySeed,scores={StardustFragment_Data=720..729}] Item.tag.CustomModelData set value 2013213
	data modify entity @s[tag=StardustFragment_SolarSeed,scores={StardustFragment_Data=720..729}] Item.tag.CustomModelData set value 2013214
	data modify entity @s[tag=StardustFragment_DarkSeed,scores={StardustFragment_Data=720..729}] Item.tag.CustomModelData set value 2013215
#FinalStep
	data modify entity @s[tag=StardustFragment_DiamondSeed,scores={StardustFragment_Data=120..}] Item.tag.CustomModelData set value 2013216
	data modify entity @s[tag=StardustFragment_AdvancedDiamondSeed,scores={StardustFragment_Data=120..}] Item.tag.CustomModelData set value 2013217
	data modify entity @s[tag=StardustFragment_StardustSeed,scores={StardustFragment_Data=40..}] Item.tag.CustomModelData set value 2013218
	data modify entity @s[tag=StardustFragment_AdvancedStardustSeed,scores={StardustFragment_Data=40..}] Item.tag.CustomModelData set value 2013219
	data modify entity @s[tag=StardustFragment_EliteStardustSeed,scores={StardustFragment_Data=40..}] Item.tag.CustomModelData set value 2013220
	data modify entity @s[tag=StardustFragment_LegendarySeed,scores={StardustFragment_Data=1440..}] Item.tag.CustomModelData set value 2013221
	data modify entity @s[tag=StardustFragment_SolarSeed,scores={StardustFragment_Data=1440..}] Item.tag.CustomModelData set value 2013222
	data modify entity @s[tag=StardustFragment_DarkSeed,scores={StardustFragment_Data=1440..}] Item.tag.CustomModelData set value 2013223
	execute as @s[tag=StardustFragment_DiamondSeeds,scores={StardustFragment_Data=120..}] run tag @s add StardustFragment_SeedDone
	execute as @s[tag=StardustFragment_StardustSeeds,scores={StardustFragment_Data=40..}] run tag @s add StardustFragment_SeedDone
	execute as @s[tag=StardustFragment_ElementarySeeds,scores={StardustFragment_Data=1440..}] run tag @s add StardustFragment_SeedDone
