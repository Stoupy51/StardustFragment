#Get and Search machines with same Energy Storage from Stardust
	scoreboard players operation Temp SF_Data = @s EF_kJmax
	tag @s add SF_Balance
	tag @s add SF_Balanced
	execute if entity @e[type=glow_item_frame,tag=!SF_Balance,tag=!SF_Balanced,tag=SF_Destroyer,distance=..1.1] run function stardust:balance/balance
	tag @s remove SF_Balance
