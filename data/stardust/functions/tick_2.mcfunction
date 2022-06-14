
scoreboard players set #tick_2 stardust.data 0
#Destroy
	execute as @e[tag=stardust.destroyer,tag=!simplenergy.item_destroy,predicate=!stardust:check_destroyer] at @s run function stardust:destroy/all

#Others
	execute as @e[type=glow_item_frame,tag=stardust.tick_2_glows,sort=random] at @s run function stardust:utils/tick_2_glows
	execute if score #stardust_pillar stardust.data matches 1.. as @e[tag=stardust.pillar_tick] at @s positioned ~ ~-2 ~ run function stardust:boss/stardust_pillar/tick_2
	execute as @e[type=armor_stand,tag=stardust.stardust.model] at @s run function stardust:mobs/tick_2/main
	execute if score #forge_craft stardust.data matches 1.. as @e[type=item,scores={stardust.forge_craft=0..}] at @s run function stardust:forge/particles
	execute as @e[type=area_effect_cloud,tag=stardust.dimension_platform] at @s run function stardust:dimensions/platform
	execute as @e[type=!#energy:valid_block_entities,predicate=stardust:transition,tag=!global.ignore,tag=!global.ignore.pos,tag=!smithed.entity,tag=!simplenergy.item_destroy] at @s run function stardust:dimensions/transitions
	execute as @a[sort=random] at @s run function stardust:utils/tick_2_players

