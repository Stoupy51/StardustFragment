execute as @e[type=glow_item_frame,tag=!StardustFragment_Balance,tag=!StardustFragment_Balanced,tag=!StardustFragment_Elevator,tag=StardustFragment_Destroyer,distance=..1.1] if score @s energy.max_storage = Temp StardustFragment_Data at @s run function stardust:balance/found
#Redistributes Energy
	scoreboard players set Temp StardustFragment_Data 0
	scoreboard players set Count StardustFragment_Data 0
	execute as @e[type=glow_item_frame,tag=StardustFragment_Balance] run function stardust:balance/add
	scoreboard players operation Remain StardustFragment_Data = Temp StardustFragment_Data
	scoreboard players operation Balance StardustFragment_Data = Temp StardustFragment_Data
	scoreboard players operation Balance StardustFragment_Data /= Count StardustFragment_Data
	scoreboard players operation Remain StardustFragment_Data %= Count StardustFragment_Data
	scoreboard players operation @e[type=glow_item_frame,tag=StardustFragment_Balance] energy.storage = Balance StardustFragment_Data
	scoreboard players operation @s energy.storage += Remain StardustFragment_Data
	execute if score @s energy.storage > @s energy.max_storage run scoreboard players operation @s energy.storage = @s energy.max_storage
	scoreboard players reset Count StardustFragment_Data
	scoreboard players reset Remain StardustFragment_Data
	scoreboard players reset Balance StardustFragment_Data
	