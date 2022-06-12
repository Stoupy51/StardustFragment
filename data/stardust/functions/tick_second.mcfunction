#Others
	scoreboard players set #second stardust.data 0
	execute if score #dragon_killed stardust.data matches ..10 run function stardust:utils/dragon_egg/all
	execute as @e[type=glow_item_frame,tag=stardust.destroyer,sort=random] at @s run function stardust:utils/tick_second_glows
	execute as @a[sort=random] at @s run function stardust:utils/tick_second_players
	execute if entity @a[tag=stardust.is_in_dungeon,limit=1] in stardust:dungeon run function stardust:tick_second_dungeon

#Boss
	execute if score #ultimate_boss stardust.data matches 1 in stardust:ultimate run function stardust:boss/ultimate_boss/tick_second
	execute if score #stardust_pillar stardust.data matches 1.. as @e[type=wither,tag=stardust.stardust_pillar,sort=random] at @s run function stardust:boss/stardust_pillar/tick_second
	execute as @e[type=wolf,tag=stardust.stoup_army] at @s run function stardust:boss/stouparmy

#Mobs
	execute as @e[type=#stardust:global,predicate=stardust:in_dim/celestial_or_stardust,tag=] at @s run function stardust:mobs/dimensions_check
	execute as @e[type=ender_dragon,predicate=stardust:in_dim/ultimate,tag=,nbt={Brain:{memories:{}}},limit=1] at @s run function stardust:boss/ultimate_boss/spawn

