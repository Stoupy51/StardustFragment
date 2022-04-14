scoreboard players set #tick_2 stardust.data 0
#Destroy
	execute as @e[type=#energy:valid_block_entities,tag=stardust.destroyer,predicate=!stardust:check_destroyer] at @s run function stardust:destroy/all

#Others
	execute as @e[type=glow_item_frame,tag=stardust.tick_2_glows] at @s run function stardust:opti/tick_2_glows
	execute if score #stardust_pillar stardust.data matches 1.. at @e[type=marker,tag=stardust.pillar_tick] run particle dust 0 0 255 1 ~ ~1 ~ 2 2 2 0 20
	execute if score #forge_craft stardust.data matches 1.. as @e[type=item,scores={stardust.forge_craft=0..}] at @s run function stardust:forge/particles
	execute as @e[type=area_effect_cloud,tag=stardust.dimension_platform] at @s run function stardust:dimensions/platform
	execute as @e[predicate=stardust:transition,tag=!global.ignore,tag=!global.ignore.pos,tag=!smithed.entity] at @s run function stardust:dimensions/transitions
	execute as @a at @s run function stardust:opti/tick_2_players
