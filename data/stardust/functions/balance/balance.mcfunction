execute as @e[type=glow_item_frame,tag=!SF_Balance,tag=!SF_Balanced,tag=!SF_Elevator,tag=SF_Destroyer,distance=..1.1] if score @s energy.max_storage = Temp SF_Data at @s run function stardust:balance/found
#Redistributes Energy
	scoreboard players set Temp SF_Data 0
	scoreboard players set Count SF_Data 0
	execute as @e[type=glow_item_frame,tag=SF_Balance] run function stardust:balance/add
	scoreboard players operation Remain SF_Data = Temp SF_Data
	scoreboard players operation Balance SF_Data = Temp SF_Data
	scoreboard players operation Balance SF_Data /= Count SF_Data
	scoreboard players operation Remain SF_Data %= Count SF_Data
	scoreboard players operation @e[type=glow_item_frame,tag=SF_Balance] energy.storage = Balance SF_Data
	scoreboard players operation @s energy.storage += Remain SF_Data
	execute if score @s energy.storage > @s energy.max_storage run scoreboard players operation @s energy.storage = @s energy.max_storage
	scoreboard players reset Count SF_Data
	scoreboard players reset Remain SF_Data
	scoreboard players reset Balance SF_Data
	
#Continue
	tag @e[type=glow_item_frame,tag=SF_Balance] remove SF_Balance
	execute if entity @s[tag=SF_HeatGenerator] as @e[type=glow_item_frame,tag=SF_HeatGenerator,tag=!SF_Balanced,limit=1] at @s run function stardust:balance/all
	execute if entity @s[tag=SF_PhotovoltaicPanel] as @e[type=glow_item_frame,tag=SF_PhotovoltaicPanel,tag=!SF_Balanced,limit=1] at @s run function stardust:balance/all
	execute if entity @s[tag=SF_StardustBattery] as @e[type=glow_item_frame,tag=SF_StardustBattery,tag=!SF_Balanced,limit=1] at @s run function stardust:balance/all
	execute if entity @s[tag=SF_AwakenedStardustBattery] as @e[type=glow_item_frame,tag=SF_AwakenedStardustBattery,tag=!SF_Balanced,limit=1] at @s run function stardust:balance/all
	execute if entity @s[tag=SF_UltimateBattery] as @e[type=glow_item_frame,tag=SF_UltimateBattery,tag=!SF_Balanced,limit=1] at @s run function stardust:balance/all
