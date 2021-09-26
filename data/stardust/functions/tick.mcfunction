#execute at @e as @e[limit=24] as @s[tag=SF_Truc] run scoreboard players set Temp SF_Data 0
#execute at @e as @e[limit=24] as @s[tag=SF_Truc] run scoreboard players set Temp SF_Data 0
#Others 1
	execute if score StardustPillar SF_Data matches 1.. as @e[type=wither,tag=SF_StardustPillar,tag=SF_ShieldOn] run data modify entity @s NoAI set value 1b

#Timer
	scoreboard players add tick_2 SF_Data 1
	scoreboard players add Second SF_Data 1
	execute if score tick_2 SF_Data matches 2.. run function stardust:tick_2
	execute if score Second SF_Data matches 20.. run function stardust:tick_second

#Players
	execute as @a[scores={SF_RightClick=1..}] at @s run function stardust:rightclick/all
	scoreboard players remove @a[scores={SF_Cooldown=1..}] SF_Cooldown 1
	execute if score Second SF_Data matches 10 at @a run function stardust:generate/player
	scoreboard players add @a[scores={SF_X=..-1}] SF_X 1

#Others 2
	execute in stardust:stardust run tp @e[type=vex,distance=0..] 0 -10000 0
	execute if score Second SF_Data matches 10 run function stardust:opti/quarry_system
	###execute if score Second SF_Data matches 10 as @e[type=item] at @s run function stardust:forge/detect_craft
	execute as @e[type=armor_stand,tag=SE_Furnaces] at @s run function stardust:work/all_furnace
	execute as @e[type=glow_item_frame,tag=SF_DestroyBarrel] at @s unless block ~ ~ ~ minecraft:barrel run function stardust:destroy/groups/barrel

#Boss
	execute if score UltimateBoss SF_Data matches 1 in stardust:ultimate run function stardust:boss/ultimate_boss/tick
