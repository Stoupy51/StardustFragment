execute if score @s StardustFragment_StatQ matches 1 run function stardust:quarry/working/start
#Check Size
	execute if score @s StardustFragment_SizeQ matches 2000001.. run tellraw @a[distance=..3] [{"text":"ERROR: More than 2M blocks","italic":false,"color":"red"}]
	scoreboard players set @s[scores={StardustFragment_SizeQ=2000001..}] StardustFragment_StatQ 0
	scoreboard players add @s StardustFragment_SpeedQ 0
	scoreboard players set Count StardustFragment_Data 0
	scoreboard players set Temp StardustFragment_Data 0

	execute if score @s StardustFragment_StatQ matches 2 run scoreboard players remove @s[tag=StardustFragment_QuarryLv1] energy.storage 125
	execute if score @s StardustFragment_StatQ matches 2 run scoreboard players remove @s[tag=StardustFragment_QuarryLv2] energy.storage 250
	execute if score @s StardustFragment_StatQ matches 2 run scoreboard players remove @s[tag=StardustFragment_QuarryLv3] energy.storage 375
	execute if score @s StardustFragment_StatQ matches 2 run scoreboard players remove @s[tag=StardustFragment_QuarryLv4] energy.storage 500
	execute if score @s StardustFragment_StatQ matches 2 run scoreboard players remove @s[tag=StardustFragment_QuarryLv5] energy.storage 625
	execute as @s[scores={StardustFragment_StatQ=2},tag=StardustFragment_QuarryLv1] run scoreboard players set Count StardustFragment_Data 50
	execute as @s[scores={StardustFragment_StatQ=2},tag=StardustFragment_QuarryLv2] run scoreboard players set Count StardustFragment_Data 100
	execute as @s[scores={StardustFragment_StatQ=2},tag=StardustFragment_QuarryLv3] run scoreboard players set Count StardustFragment_Data 150
	execute as @s[scores={StardustFragment_StatQ=2},tag=StardustFragment_QuarryLv4] run scoreboard players set Count StardustFragment_Data 200
	execute as @s[scores={StardustFragment_StatQ=2},tag=StardustFragment_QuarryLv5] run scoreboard players set Count StardustFragment_Data 250
	execute as @s[scores={StardustFragment_StatQ=2},tag=StardustFragment_QuarryLv6] run scoreboard players set Count StardustFragment_Data 2500
	execute if score @s StardustFragment_StatQ matches 2 if score Count StardustFragment_Data matches 1.. at @s run function stardust:quarry/working/pos_check
