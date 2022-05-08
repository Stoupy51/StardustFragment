
#execute as @e at @e[limit=10] run function stardust:opti/z_personal_profiling
#Others 1
	execute if score #stardust_pillar stardust.data matches 1.. as @e[type=wither,tag=stardust.stardust_pillar,tag=stardust.has_shield] run data modify entity @s NoAI set value 1b

#Timer
	scoreboard players add #tick_2 stardust.data 1
	scoreboard players add #second stardust.data 1
	execute if score #tick_2 stardust.data matches 2.. run function stardust:tick_2
	execute if score #second stardust.data matches 20.. run function stardust:tick_second

#Others 2
	execute as @e[type=area_effect_cloud,tag=stardust.structure] at @s run function stardust:calls/generate/structure/all
	execute as @a[sort=random] at @s run function stardust:opti/tick_players
	tp @e[type=vex,predicate=stardust:in_stardust] 0 -10000 0
	execute if score #second stardust.data matches 10 run function stardust:opti/quarry_system
	execute if score #second stardust.data matches 10 run scoreboard players reset #forge_craft stardust.data
	execute as @e[type=glow_item_frame,tag=stardust.destroy_barrel,sort=random] at @s run function stardust:opti/tick_glows
	execute if score #second stardust.data matches 10 as @e[type=item,predicate=simplenergy:has_tag] at @s run function stardust:forge/detect_craft

#Boss
	execute if score #ultimate_boss stardust.data matches 1 in stardust:ultimate run function stardust:boss/ultimate_boss/tick

