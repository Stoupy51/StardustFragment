#execute at @e at @e[limit=8] run tag @e[tag=SF_Truc] remove SF_Truc
#execute at @e at @e[limit=8] run tag @e remove SF_Truc
#Others 1
    execute if entity @e[type=minecraft:glow_item_frame,tag=SF_Destroyer,limit=1] run function stardust:destroy/all
    execute if score StardustPillar SF_Data matches 1.. as @e[type=minecraft:wither,tag=SF_StardustPillar,tag=SF_ShieldOn] run data modify entity @s NoAI set value 1b

#Timer
    scoreboard players add Second SF_Data 1
    execute if score Second SF_Data matches 20.. run function stardust:tick_second

#Players
    execute as @a[scores={SF_RightClick=1..}] at @s run function stardust:rightclick/all
    scoreboard players remove @a[scores={SF_Cooldown=1..}] SF_Cooldown 1
    effect give @a[nbt={SelectedItem:{tag:{SF_LegendarySword:1b}}}] minecraft:jump_boost 1 3 true
    execute at @a[nbt={Inventory:[{Slot:-106b,tag:{SF_ItemMagnet:1b}}]}] run tp @e[type=minecraft:item,distance=..4] ~ ~ ~
    execute at @a[nbt={SelectedItem:{tag:{SF_TravelStaff:1b}}},scores={SF_Data=1..}] run particle minecraft:portal ~ ~ ~ 1 1 1 0 100
    execute as @a run function stardust:dimensions/transitions
    scoreboard players add @a[scores={SF_X=..-1}] SF_X 1

#Others 2
    execute as @e[type=minecraft:glow_item_frame,tag=SF_WorkingPortal] run function stardust:visual/portal_particules
    execute as @e[type=minecraft:glow_item_frame,tag=SF_CraftingTable] at @s if entity @p[distance=..7] run function stardust:craft/all
    execute as @e[type=minecraft:glow_item_frame,tag=SF_Quarry] at @s run function stardust:quarry/gui/all
    execute if score SuperCraft SF_Data matches 1 as @e[type=minecraft:item,scores={SF_SCraft=0..}] at @s run function stardust:forge/particles
    execute in stardust:stardust run tp @e[type=minecraft:vex,distance=0..] 0 -10000 0
    execute if score Second SF_Data matches 10 run function stardust:opti/quarry_system
	###execute if score Second SF_Data matches 10 as @e[type=minecraft:item] at @s run function stardust:forge/detect_craft

#Boss
    execute if score UltimateBoss SF_Data matches 1 in stardust:ultimate run function stardust:boss/ultimate_boss/tick
    execute if score StardustPillar SF_Data matches 1.. at @e[type=minecraft:armor_stand,tag=SF_StardustPillarTick] run particle dust 0 0 255 1 ~ ~1 ~ 2 2 2 0 20

#Machines Visuals & Work
    execute as @e[type=minecraft:glow_item_frame,tag=SF_Elevator] at @s run function stardust:visual/elevator
    scoreboard players reset @a SF_Jump
