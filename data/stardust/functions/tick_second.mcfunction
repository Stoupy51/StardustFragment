#Others
	scoreboard players set #second stardust.data 0
	scoreboard players add #minute stardust.data 1
	execute if score #minute stardust.data matches 60.. run function stardust:tick_minute
	execute if score #dragon_killed stardust.data matches ..10 run function stardust:opti/dragon_egg/all
	execute as @e[type=item,nbt={Item:{tag:{stardust:{stardust_fragment:1b}}}}] at @s if block ~ ~-1 ~ minecraft:crafting_table run function stardust:place/stardust_crafting_table
	execute as @e[type=glow_item_frame,tag=stardust.balancing,limit=1] at @s run function stardust:balance/all
	execute as @e[type=glow_item_frame,tag=stardust.destroyer] at @s run function stardust:opti/tick_second_glows
	tag @e[type=glow_item_frame,tag=stardust.balanced] remove stardust.balanced
	execute as @a at @s run function stardust:opti/tick_second_players
	execute if entity @a[tag=stardust.is_in_dungeon,limit=1] in stardust:dungeon run function stardust:tick_second_dungeon

#Boss
	execute if score #ultimate_boss stardust.data matches 1 in stardust:ultimate run function stardust:boss/ultimate_boss/tick_second
	execute if score #stardust_pillar stardust.data matches 1.. as @e[type=wither,tag=stardust.stardust_pillar] at @s run function stardust:boss/stardust_pillar/tick_second
	execute if score #stardust_pillar stardust.data matches 1.. as @e[type=marker,tag=stardust.pillar_tick] at @s unless entity @e[type=wither,tag=stardust.stardust_pillar,distance=..3] run function stardust:boss/stardust_pillar/defeated
	execute as @e[type=wolf,tag=stardust.stoup_army] at @s run function stardust:boss/stouparmy
	scoreboard players reset #max_count stardust.data

#Mobs spawn
	execute as @e[type=#stardust:global,predicate=stardust:in_celestial_or_stardust,tag=!stardust.celestial_dim,tag=!stardust.stardust_dim,tag=!global.ignore,tag=!global.ignore.pos,tag=!smithed.entity] at @s run function stardust:mobs/dimensions_check
	execute in stardust:ultimate as @e[type=ender_dragon,tag=!stardust.dragon,distance=0..,tag=!global.ignore,tag=!global.ignore.pos,tag=!smithed.entity,nbt={Brain:{memories:{}}},limit=1] at @s run function stardust:boss/ultimate_boss/spawn
	execute in stardust:stardust as @e[type=bat,distance=0..,tag=!global.ignore,tag=!global.ignore.pos,tag=!smithed.entity] at @s run function stardust:mobs/stardust_bat

