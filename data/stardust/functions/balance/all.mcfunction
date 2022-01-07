#Get and Search machines with same Energy Storage from Stardust
	scoreboard players operation Temp StardustFragment_Data = @s energy.max_storage
	tag @s add StardustFragment_Balance
	tag @s add StardustFragment_Balanced
	execute if entity @e[type=glow_item_frame,tag=!StardustFragment_Balance,tag=!StardustFragment_Balanced,tag=StardustFragment_Destroyer,distance=..1.1] run function stardust:balance/balance
	tag @s remove StardustFragment_Balance
