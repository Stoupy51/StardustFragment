
#Timer
	scoreboard players add @s stardust.data 1
	execute if score #boost stardust.data matches 1 run scoreboard players add @s stardust.data 9

#FirstStep
	data modify entity @s[tag=stardust.diamond_seed				,scores={stardust.data=60..69}] item.tag.CustomModelData set value 2013208
	data modify entity @s[tag=stardust.advanced_diamond_seed	,scores={stardust.data=60..69}] item.tag.CustomModelData set value 2013209
	data modify entity @s[tag=stardust.stardust_seed			,scores={stardust.data=20..29}] item.tag.CustomModelData set value 2013210
	data modify entity @s[tag=stardust.advanced_stardust_seed	,scores={stardust.data=20..29}] item.tag.CustomModelData set value 2013211
	data modify entity @s[tag=stardust.elite_stardust_seed		,scores={stardust.data=20..29}] item.tag.CustomModelData set value 2013212
	data modify entity @s[tag=stardust.legendarium_seed			,scores={stardust.data=720..729}] item.tag.CustomModelData set value 2013300
	data modify entity @s[tag=stardust.solarium_seed			,scores={stardust.data=720..729}] item.tag.CustomModelData set value 2013301
	data modify entity @s[tag=stardust.darkium_seed				,scores={stardust.data=720..729}] item.tag.CustomModelData set value 2013302

#FinalStep
	data modify entity @s[tag=stardust.diamond_seed				,scores={stardust.data=120..}] item.tag.CustomModelData set value 2013303
	data modify entity @s[tag=stardust.advanced_diamond_seed	,scores={stardust.data=120..}] item.tag.CustomModelData set value 2013304
	data modify entity @s[tag=stardust.stardust_seed			,scores={stardust.data=40..}] item.tag.CustomModelData set value 2013305
	data modify entity @s[tag=stardust.advanced_stardust_seed	,scores={stardust.data=40..}] item.tag.CustomModelData set value 2013306
	data modify entity @s[tag=stardust.elite_stardust_seed		,scores={stardust.data=40..}] item.tag.CustomModelData set value 2013307
	data modify entity @s[tag=stardust.legendarium_seed			,scores={stardust.data=1440..}] item.tag.CustomModelData set value 2013308
	data modify entity @s[tag=stardust.solarium_seed			,scores={stardust.data=1440..}] item.tag.CustomModelData set value 2013309
	data modify entity @s[tag=stardust.darkium_seed				,scores={stardust.data=1440..}] item.tag.CustomModelData set value 2013313
	execute if entity @s[tag=stardust.diamond_seeds				,scores={stardust.data=120..}] run tag @s add stardust.seed_done
	execute if entity @s[tag=stardust.stardust_seeds			,scores={stardust.data=40..}] run tag @s add stardust.seed_done
	execute if entity @s[tag=stardust.elementary_seeds			,scores={stardust.data=1440..}] run tag @s add stardust.seed_done

