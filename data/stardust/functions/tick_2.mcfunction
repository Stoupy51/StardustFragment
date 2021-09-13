scoreboard players set tick_2 SF_Data 0
#Others
    execute if entity @e[type=glow_item_frame,tag=SF_Destroyer,limit=1] run function stardust:destroy/all
    execute as @e[type=glow_item_frame,tag=SF_WorkingPortal] run function stardust:visual/portal_particules
    execute as @e[type=glow_item_frame,tag=SF_CraftingTable] at @s if entity @p[distance=..7] run function stardust:craft/all
    execute as @e[type=glow_item_frame,tag=SF_Quarry] at @s run function stardust:quarry/gui/all
    execute if score StardustPillar SF_Data matches 1.. at @e[type=armor_stand,tag=SF_StardustPillarTick] run particle dust 0 0 255 1 ~ ~1 ~ 2 2 2 0 20

#Players
    execute as @a run function stardust:dimensions/transitions
    effect give @a[nbt={SelectedItem:{tag:{SF_LegendarySword:1s}}}] minecraft:jump_boost 1 3 true
    execute at @a[nbt={Inventory:[{Slot:-106b,tag:{SF_ItemMagnet:1s}}]}] run tp @e[type=item,distance=..4] ~ ~ ~
    execute at @a[nbt={SelectedItem:{tag:{SF_TravelStaff:1s}}},scores={SF_Data=1..}] run particle minecraft:portal ~ ~ ~ 1 1 1 0 100

#Machines Visuals & Work
    execute as @e[type=glow_item_frame,tag=SF_Elevator] at @s run function stardust:visual/elevator
    scoreboard players reset @a SF_Jump
