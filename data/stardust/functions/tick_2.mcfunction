scoreboard players set tick_2 StardustFragment_Data 0
#Destroy
	function stardust:destroy/all

#Others
	execute as @e[type=glow_item_frame,tag=StardustFragment_WorkingPortal] run function stardust:visual/portal_particules
	execute as @e[type=glow_item_frame,tag=StardustFragment_Quarry] at @s run function stardust:quarry/gui/all
	execute if score StardustPillar StardustFragment_Data matches 1.. at @e[type=marker,tag=StardustFragment_StardustPillarTick] run particle dust 0 0 255 1 ~ ~1 ~ 2 2 2 0 20
	execute if score SuperCraft StardustFragment_Data matches 1.. as @e[type=item,scores={StardustFragment_SCraft=0..}] at @s run function stardust:forge/particles

#Players
	execute as @a run function stardust:dimensions/transitions
	execute in stardust:celestial as @e[distance=0..,predicate=stardust:transition_down] at @s run function stardust:dimensions/transition_down
	execute in stardust:stardust as @e[distance=0..,predicate=stardust:transition_down] at @s run function stardust:dimensions/transition_down
	effect give @a[nbt={SelectedItem:{tag:{StardustFragment_LegendarySword:1b}}}] minecraft:jump_boost 1 3 true
	execute at @a[nbt={Inventory:[{Slot:-106b,tag:{StardustFragment_ItemMagnet:1b}}]}] run tp @e[type=item,distance=..4] ~ ~ ~
	execute at @a[nbt={SelectedItem:{tag:{StardustFragment_TravelStaff:1b}}},scores={StardustFragment_Data=1..}] run particle minecraft:portal ~ ~ ~ 1 1 1 0 100

#Machines Visuals & Work
	execute as @e[type=glow_item_frame,tag=StardustFragment_Elevator] at @s run function stardust:visual/elevator
	scoreboard players reset @a StardustFragment_Jump
