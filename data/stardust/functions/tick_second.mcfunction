#Others
	scoreboard players set #second stardust.data 0
	scoreboard players add #minute stardust.data 1
	execute if score #minute stardust.data matches 60.. run function stardust:tick_minute
	execute if score #dragon_killed stardust.data matches ..10 run function stardust:opti/dragon_egg/all
	execute as @e[type=#energy:valid_block_entities,tag=stardust.destroyer] at @s run function stardust:destroy/all
	execute as @e[type=glow_item_frame,tag=stardust.destroyer,sort=random] at @s run function stardust:opti/tick_second_glows
	execute as @a[sort=random] at @s run function stardust:opti/tick_second_players
	execute if entity @a[tag=stardust.is_in_dungeon,limit=1] in stardust:dungeon run function stardust:tick_second_dungeon

#Boss
	execute if score #ultimate_boss stardust.data matches 1 in stardust:ultimate run function stardust:boss/ultimate_boss/tick_second
	execute if score #stardust_pillar stardust.data matches 1.. as @e[type=wither,tag=stardust.stardust_pillar,sort=random] at @s run function stardust:boss/stardust_pillar/tick_second
	execute if score #stardust_pillar stardust.data matches 1.. as @e[type=armor_stand,tag=stardust.pillar_tick] at @s unless entity @e[type=wither,tag=stardust.stardust_pillar,distance=..3] run function stardust:boss/stardust_pillar/defeated
	execute as @e[type=wolf,tag=stardust.stoup_army] at @s run function stardust:boss/stouparmy

#Mobs
	execute as @e[type=#stardust:global,predicate=stardust:in_celestial_or_stardust,tag=!stardust.celestial_dim,tag=!stardust.stardust_dim,tag=!global.ignore,tag=!global.ignore.pos,tag=!smithed.entity] at @s run function stardust:mobs/dimensions_check
	execute as @e[type=ender_dragon,predicate=stardust:in_ultimate,tag=!stardust.dragon,tag=!global.ignore,tag=!global.ignore.pos,tag=!smithed.entity,nbt={Brain:{memories:{}}},limit=1] at @s run function stardust:boss/ultimate_boss/spawn
	execute at @e[type=bat,tag=stardust.stardust_bat] at @a[distance=5..12,tag=!stardust.no_bolt,gamemode=!spectator,gamemode=!creative] run summon lightning_bolt

