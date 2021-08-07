#Destroy
    ###execute if entity @e[type=minecraft:glow_item_frame,tag=SF_Destroyer,limit=1] run function stardust:destroy/all

#Timer
    scoreboard players add Second SF_Data 1
    execute if score Second SF_Data matches 20.. run function stardust:tick_second

#Players
    ###execute as @a[scores={SF_RightClick=1..}] run function stardust:rightclick/all
    scoreboard players remove @a[scores={SF_Cooldown=1..}] SF_Cooldown 1
    effect give @a[nbt={SelectedItem:{tag:{SF_LegendarySword:1b}}}] jump_boost 1 3 true
    execute at @a[nbt={Inventory:[{Slot:-106b,tag:{SF_ItemMagnet:1b}}]}] run tp @e[type=minecraft:item,distance=..4] ~ ~ ~
    execute at @a[nbt={SelectedItem:{tag:{SF_TravelStaff:1b}}},scores={SF_Data=1..}] run particle minecraft:portal ~ ~ ~ 1 1 1 0 100

#Dimensions Transitions
    execute as @a store result score @s SF_Y run data get entity @s Pos[1] 1
	execute as @a[scores={SF_Y=500..}] at @s run function stardust:dimensions/transition_up
	execute as @a[scores={SF_Y=..-15}] at @s run function stardust:dimensions/transition_down

#Portals Particules
    execute at @e[type=minecraft:glow_item_frame,tag=SF_CavernPortal] run particle soul ~ ~1 ~ 0.25 1 0.25 0.05 1
    execute at @e[type=minecraft:glow_item_frame,tag=SF_CelestialPortal] run particle firework ~ ~1 ~ 0.25 1 0.25 0.05 1
    execute at @e[type=minecraft:glow_item_frame,tag=SF_StardustPortal] run particle dust 0 0 255 1 ~ ~1 ~ 0.25 1 0.25 0.05 5
    execute at @e[type=minecraft:glow_item_frame,tag=SF_DungeonPortal] run particle dust 255 0 0 1 ~ ~1 ~ 0.25 1 0.25 0.05 5
    execute at @e[type=minecraft:glow_item_frame,tag=SF_UltimatePortal] run particle dust 255 255 255 2 ~ ~1 ~ 0.25 1 0.25 0.05 1

#Others
    ###execute as @e[type=minecraft:glow_item_frame,tag=SF_CraftingTable] at @s if entity @p[distance=..7] run function stardust:craft/all
    ###execute as @e[type=minecraft:glow_item_frame,tag=SF_Quarry] at @s if entity @p[distance=..7] run function stardust:quarry/gui/all
    ###execute if score SuperCraft SF_Data matches 1 as @e[type=minecraft:item,scores={SF_SCraft=0..}] at @s run function stardust:forge/particles
    execute in stardust:stardust run tp @e[type=minecraft:vex,distance=0..] 0 -10000 0

#Boss
    ##execute if score UltimateBoss SF_Data matches 1 run function stardust:boss/ultimate_boss/tick
    execute if score StardustPillar SF_Data matches 1.. as @e[type=minecraft:armor_stand,tag=SF_StardustPillarTick] at @s run particle dust 0 0 255 1 ~ ~1 ~ 2 2 2 0 50 force
