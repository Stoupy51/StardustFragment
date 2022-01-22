#Get and Search machines with same Energy Storage from Stardust
	scoreboard players operation Temp StardustFragment_Data = @s energy.max_storage
	tag @s add StardustFragment_Balance
	tag @s add StardustFragment_Balanced
	execute if entity @e[type=glow_item_frame,tag=!StardustFragment_Balance,tag=!StardustFragment_Balanced,tag=StardustFragment_Destroyer,distance=..1.1] run function stardust:balance/balance
	tag @s remove StardustFragment_Balance

#Continue
	tag @e[type=glow_item_frame,tag=StardustFragment_Balance] remove StardustFragment_Balance
	execute if entity @s[tag=StardustFragment_HeatGenerator] as @e[type=glow_item_frame,tag=StardustFragment_HeatGenerator,tag=!StardustFragment_Balanced,limit=1] at @s run function stardust:balance/all
	execute if entity @s[tag=StardustFragment_PhotovoltaicPanel] as @e[type=glow_item_frame,tag=StardustFragment_PhotovoltaicPanel,tag=!StardustFragment_Balanced,limit=1] at @s run function stardust:balance/all
	execute if entity @s[tag=StardustFragment_StardustBattery] as @e[type=glow_item_frame,tag=StardustFragment_StardustBattery,tag=!StardustFragment_Balanced,limit=1] at @s run function stardust:balance/all
	execute if entity @s[tag=StardustFragment_AwakenedStardustBattery] as @e[type=glow_item_frame,tag=StardustFragment_AwakenedStardustBattery,tag=!StardustFragment_Balanced,limit=1] at @s run function stardust:balance/all
	execute if entity @s[tag=StardustFragment_UltimateBattery] as @e[type=glow_item_frame,tag=StardustFragment_UltimateBattery,tag=!StardustFragment_Balanced,limit=1] at @s run function stardust:balance/all
