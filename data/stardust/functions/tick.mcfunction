#execute as @e as @a if data entity @s SelectedItem.tag.StardustFragment_QuarryConfigurator
#execute as @e as @a if data entity @s {SelectedItem:{tag:{StardustFragment_QuarryConfigurator:1b}}}
#Others 1
	execute if score StardustPillar StardustFragment_Data matches 1.. as @e[type=wither,tag=StardustFragment_StardustPillar,tag=StardustFragment_ShieldOn] run data modify entity @s NoAI set value 1b

#Timer
	scoreboard players add tick_2 StardustFragment_Data 1
	scoreboard players add Second StardustFragment_Data 1
	execute if score tick_2 StardustFragment_Data matches 2.. run function stardust:tick_2
	execute if score Second StardustFragment_Data matches 20.. run function stardust:tick_second

#Others 2
	execute as @a at @s run function stardust:opti/tick_players
	execute in stardust:stardust run tp @e[type=vex,distance=0..] 0 -10000 0
	execute if score Second StardustFragment_Data matches 10 run function stardust:opti/quarry_system
	execute if score Second StardustFragment_Data matches 10 run scoreboard players reset SuperCraft StardustFragment_Data
	execute as @e[type=glow_item_frame,tag=StardustFragment_DestroyBarrel] at @s run function stardust:opti/tick_glows
	execute if score Second StardustFragment_Data matches 10 as @e[type=item,predicate=simplenergy:has_tag] at @s run function stardust:forge/detect_craft
	execute as @e[type=marker,tag=SimplEnergy_Furnaces] at @s run function stardust:work/all_furnace

#Boss
	execute if score UltimateBoss StardustFragment_Data matches 1 in stardust:ultimate run function stardust:boss/ultimate_boss/tick
