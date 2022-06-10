
#Generate Stardust Ore (x4)
#Or Awakened Stardust Ore (x4) in minecraft:the_nether
	scoreboard players set #xz_variation simplenergy.data 400
	scoreboard players set #max_height simplenergy.data 400
	execute as @e[limit=8] run summon area_effect_cloud ~ 0 ~ {Tags:["stardust.ore_pos"],Duration:0}
	execute if predicate stardust:in_dim/the_nether run scoreboard players set #max_height simplenergy.data 1600
	execute as @e[type=area_effect_cloud,tag=stardust.ore_pos,predicate=stardust:in_dim/the_nether,limit=3] at @s run function stardust:calls/generate/awakened_stardust
	execute as @e[type=area_effect_cloud,tag=stardust.ore_pos] at @s run function stardust:calls/generate/stardust


#Generate Simplunium Ore Or More Stardust Ores (x8)
	scoreboard players set #xz_variation simplenergy.data 400
	scoreboard players set #max_height simplenergy.data 400
	execute as @e[limit=8] run summon area_effect_cloud ~ 0 ~ {Tags:["stardust.ore_pos"]}
	execute as @e[type=area_effect_cloud,tag=stardust.ore_pos,predicate=stardust:in_dim/stardust,limit=4] at @s run function stardust:calls/generate/simplunium
	execute as @e[type=area_effect_cloud,tag=stardust.ore_pos,predicate=stardust:in_dim/stardust] at @s run function stardust:calls/generate/stardust
	execute if predicate stardust:in_dim/the_end run scoreboard players set #max_height simplenergy.data 1600
	execute as @e[type=area_effect_cloud,tag=stardust.ore_pos,predicate=stardust:in_dim/the_end] at @s run function stardust:calls/generate/stardust


#Generate More Iron Ores in Cavern Dimension
	scoreboard players set #xz_variation simplenergy.data 400
	scoreboard players set #max_height simplenergy.data 800
	execute if predicate stardust:in_dim/cavern as @e[limit=56] run summon area_effect_cloud ~ 0 ~ {Tags:["stardust.ore_pos"]}
	execute as @e[type=area_effect_cloud,tag=stardust.ore_pos,predicate=stardust:in_dim/cavern] at @s run function stardust:calls/generate/iron

#Generate Life Crystals
	scoreboard players set #xz_variation simplenergy.data 500
	scoreboard players set #max_height simplenergy.data 400
	execute as @e[limit=8] run summon area_effect_cloud ~ 0 ~ {Tags:["stardust.ore_pos"],Duration:0}
	execute as @e[type=area_effect_cloud,tag=stardust.ore_pos,limit=8,predicate=stardust:in_dim/all] at @s run function stardust:calls/generate/life_crystal

#Generate Post Structures (Cave bases)
	scoreboard players set #xz_variation simplenergy.data 500
	scoreboard players set #max_height simplenergy.data 550
	summon area_effect_cloud ~ 0 ~ {Tags:["stardust.struct_pos"],Duration:0}
	execute as @e[type=area_effect_cloud,tag=stardust.struct_pos,predicate=stardust:in_dim/overworld,limit=1] at @s run function stardust:calls/generate/structure/cave_base

kill @e[type=area_effect_cloud,tag=stardust.ore_pos]

