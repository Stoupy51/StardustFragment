scoreboard players set tick_2 StardustFragment_Data 0
#Destroy
	execute as @e[type=#energy:valid_block_entities,tag=StardustFragment_Destroyer] at @s run function stardust:destroy/all

#Others
	execute as @e[type=glow_item_frame,tag=StardustFragment_Destroyer] run function stardust:opti/tick_2_glows
	execute if score StardustPillar StardustFragment_Data matches 1.. at @e[type=marker,tag=StardustFragment_StardustPillarTick] run particle dust 0 0 255 1 ~ ~1 ~ 2 2 2 0 20
	execute if score SuperCraft StardustFragment_Data matches 1.. as @e[type=item,scores={StardustFragment_SCraft=0..}] at @s run function stardust:forge/particles
	execute as @e[predicate=stardust:transition,tag=!global.ignore,tag=!global.ignore.pos,tag=!smithed.entity] at @s run function stardust:dimensions/transitions
	execute as @a at @s run function stardust:opti/tick_2_players
