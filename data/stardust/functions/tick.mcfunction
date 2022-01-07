#execute as @e as @e[predicate=simplenergy:check_chunk_loaded] run scoreboard players add Temp StardustFragment_Data 0
#execute as @e as @e if blocks ~ ~ ~ ~ ~ ~ ~ ~ ~ all run scoreboard players add Temp StardustFragment_Data 0
#execute as @e[predicate=simplenergy:check_chunk_loaded] run scoreboard players add Temp StardustFragment_Data 0
#execute as @e if blocks ~ ~ ~ ~ ~ ~ ~ ~ ~ all run scoreboard players add Temp StardustFragment_Data 0
#Others 1
	execute if score StardustPillar StardustFragment_Data matches 1.. as @e[type=wither,tag=StardustFragment_StardustPillar,tag=StardustFragment_ShieldOn] run data modify entity @s NoAI set value 1b

#Timer
	scoreboard players add tick_2 StardustFragment_Data 1
	scoreboard players add Second StardustFragment_Data 1
	execute if score tick_2 StardustFragment_Data matches 2.. run function stardust:tick_2
	execute if score Second StardustFragment_Data matches 20.. run function stardust:tick_second

#Players
	execute as @a[scores={StardustFragment_RightClick=1..}] at @s run function stardust:rightclick/all
	scoreboard players remove @a[scores={StardustFragment_Cooldown=1..}] StardustFragment_Cooldown 1
	execute if score Second StardustFragment_Data matches 10 at @a run function stardust:generate/player
	scoreboard players add @a[scores={StardustFragment_X=..-1}] StardustFragment_X 1

#Others 2
	execute in stardust:stardust run tp @e[type=vex,distance=0..] 0 -10000 0
	execute if score Second StardustFragment_Data matches 10 run function stardust:opti/quarry_system
	execute if score Second StardustFragment_Data matches 10 run scoreboard players reset SuperCraft StardustFragment_Data
	execute as @e[type=glow_item_frame,tag=StardustFragment_CraftingTable,predicate=simplenergy:is_barrel_open] at @s if entity @p[distance=..7] run function stardust:craft/all
	execute if score Second StardustFragment_Data matches 10 as @e[type=item,predicate=simplenergy:has_tag] at @s run function stardust:forge/detect_craft
	execute as @e[type=marker,tag=SimplEnergy_Furnaces] at @s run function stardust:work/all_furnace
	execute as @e[type=glow_item_frame,tag=StardustFragment_DestroyBarrel] at @s unless block ~ ~ ~ minecraft:barrel run function stardust:destroy/groups/barrel

#Boss
	execute if score UltimateBoss StardustFragment_Data matches 1 in stardust:ultimate run function stardust:boss/ultimate_boss/tick
