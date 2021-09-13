#execute at @e at @e[limit=8] if entity @e[nbt={Item:{tag:{SF_AdvancedDiamondSeed:1}}}]
#execute at @e at @e[limit=8] if entity @e[nbt={Item:{tag:{SF_AdvancedDiamondSeed:1s}}}]
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
    execute if score SuperCraft SF_Data matches 1 as @e[type=item,scores={SF_SCraft=0..}] at @s run function stardust:forge/particles
    execute in stardust:stardust run tp @e[type=vex,distance=0..] 0 -10000 0
    execute if score Second SF_Data matches 10 run function stardust:opti/quarry_system
	###execute if score Second SF_Data matches 10 as @e[type=item] at @s run function stardust:forge/detect_craft

#Boss
    execute if score UltimateBoss SF_Data matches 1 in stardust:ultimate run function stardust:boss/ultimate_boss/tick
