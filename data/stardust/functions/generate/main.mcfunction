
#Generate Stardust Ore (x4)
#Or Awakened Stardust Ore (x4) in minecraft:the_nether
	scoreboard players set #xz_variation simplenergy.data 400
	scoreboard players set #max_height simplenergy.data 400
	execute as @e[limit=8] run summon area_effect_cloud ~ 0 ~ {Tags:["stardust.ore_pos"],Duration:0}
	execute in minecraft:the_nether if entity @e[type=area_effect_cloud,tag=stardust.ore_pos,distance=0..] run scoreboard players set #max_height simplenergy.data 1600
	execute in minecraft:the_nether as @e[type=area_effect_cloud,tag=stardust.ore_pos,distance=0..,limit=3] at @s run function stardust:generate/awakened_stardust
	execute as @e[type=area_effect_cloud,tag=stardust.ore_pos] at @s run function stardust:generate/stardust


#Generate Simplunium Ore Or More Stardust Ores (x8)
	scoreboard players set #xz_variation simplenergy.data 400
	scoreboard players set #max_height simplenergy.data 400
	execute as @e[limit=8] run summon area_effect_cloud ~ 0 ~ {Tags:["stardust.ore_pos"]}
	execute in stardust:stardust as @e[type=area_effect_cloud,tag=stardust.ore_pos,distance=0..,limit=4] at @s run function stardust:generate/simplunium
	execute in stardust:stardust as @e[type=area_effect_cloud,tag=stardust.ore_pos,distance=0..] at @s run function stardust:generate/stardust
	execute in minecraft:the_end if entity @e[type=area_effect_cloud,tag=stardust.ore_pos,distance=0..] run scoreboard players set #max_height simplenergy.data 1600
	execute in minecraft:the_end as @e[type=area_effect_cloud,tag=stardust.ore_pos,distance=0..] at @s run function stardust:generate/stardust


#Generate More Iron Ores in Cavern Dimension
	scoreboard players set #xz_variation simplenergy.data 400
	scoreboard players set #max_height simplenergy.data 800
	execute in stardust:cavern as @s[distance=0..] as @e[limit=56] run summon area_effect_cloud ~ 0 ~ {Tags:["stardust.ore_pos"]}
	execute in stardust:cavern as @e[type=area_effect_cloud,tag=stardust.ore_pos,distance=0..] at @s run function stardust:generate/iron

#Generate Life Crystals
	scoreboard players set #xz_variation simplenergy.data 500
	scoreboard players set #max_height simplenergy.data 400
	execute as @e[limit=8] run summon area_effect_cloud ~ 0 ~ {Tags:["stardust.ore_pos"],Duration:0}
	execute as @e[type=area_effect_cloud,tag=stardust.ore_pos,limit=8] at @s run function stardust:generate/life_crystal

kill @e[type=area_effect_cloud,tag=stardust.ore_pos]

