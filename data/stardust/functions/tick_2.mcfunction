scoreboard players set tick_2 SF_Data 0
#Destroy
	function stardust:destroy/all

#Others
	execute as @e[type=glow_item_frame,tag=SF_WorkingPortal] run function stardust:visual/portal_particules
	execute as @e[type=glow_item_frame,tag=SF_Quarry] at @s run function stardust:quarry/gui/all
	execute if score StardustPillar SF_Data matches 1.. at @e[type=armor_stand,tag=SF_StardustPillarTick] run particle dust 0 0 255 1 ~ ~1 ~ 2 2 2 0 20
	execute if score SuperCraft SF_Data matches 1.. as @e[type=item,scores={SF_SCraft=0..}] at @s run function stardust:forge/particles

#Players
	execute as @a run function stardust:dimensions/transitions
	execute in stardust:celestial as @e[distance=0..,predicate=stardust:transition_down] at @s run function stardust:dimensions/transition_down
	execute in stardust:stardust as @e[distance=0..,predicate=stardust:transition_down] at @s run function stardust:dimensions/transition_down
	effect give @a[nbt={SelectedItem:{tag:{SF_LegendarySword:1b}}}] minecraft:jump_boost 1 3 true
	execute at @a[nbt={Inventory:[{Slot:-106b,tag:{SF_ItemMagnet:1b}}]}] run tp @e[type=item,distance=..4] ~ ~ ~
	execute at @a[nbt={SelectedItem:{tag:{SF_TravelStaff:1b}}},scores={SF_Data=1..}] run particle minecraft:portal ~ ~ ~ 1 1 1 0 100

#Machines Visuals & Work
	execute as @e[type=glow_item_frame,tag=SF_Elevator] at @s run function stardust:visual/elevator
	scoreboard players reset @a SF_Jump
