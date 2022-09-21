
#Others 1
	#function stardust:utils/z_personal_profiling_launch
	execute if score #stardust_pillar stardust.data matches 1.. as @e[tag=stardust.stardust_pillar,tag=stardust.has_shield] run data modify entity @s NoAI set value 1b

#Timer
	scoreboard players add #tick_2 stardust.data 1
	scoreboard players add #second stardust.data 1
	scoreboard players add #second_5 stardust.data 1
	execute if score #tick_2 stardust.data matches 3.. run function stardust:tick_2
	execute if score #second stardust.data matches 20.. run function stardust:tick_second
	execute if score #second_5 stardust.data matches 90.. run function stardust:tick_second_5

#Others 2
	execute as @a[sort=random] at @s run function stardust:utils/tick_players
	tp @e[type=vex,predicate=stardust:in_dim/stardust] 0 -10000 0
	execute if score #second stardust.data matches 10 run function stardust:utils/quarry_system
	execute as @e[type=glow_item_frame,tag=stardust.destroy_barrel,sort=random] at @s run function stardust:utils/tick_glows
	execute if score #second stardust.data matches 10 as @e[type=item,predicate=simplenergy:has_tag] at @s run function stardust:forge/detect_craft
	execute as @e[type=armor_stand,tag=stardust.model,tag=!stardust.pillar_tick] at @s run function stardust:mobs/tick/

#Boss
	execute if score #ultimate_boss stardust.data matches 1 in stardust:ultimate run function stardust:boss/ultimate_boss/tick
