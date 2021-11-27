execute if score @s SF_StatQ matches 1 run function stardust:quarry/working/start
#Check Size
	execute if score @s SF_SizeQ matches 2000001.. run tellraw @a[distance=..3] [{"text":"ERROR: More than 2M blocks","italic":false,"color":"red"}]
	scoreboard players set @s[scores={SF_SizeQ=2000001..}] SF_StatQ 0
	scoreboard players add @s SF_SpeedQ 0
	scoreboard players set Count SF_Data 0
	scoreboard players set Temp SF_Data 0

	execute if score @s SF_StatQ matches 2 run scoreboard players operation @s EF_kJ -= @s EF_kW
	execute as @s[scores={SF_StatQ=2},tag=SF_QuarryLv1] run scoreboard players set Count SF_Data 50
	execute as @s[scores={SF_StatQ=2},tag=SF_QuarryLv2] run scoreboard players set Count SF_Data 100
	execute as @s[scores={SF_StatQ=2},tag=SF_QuarryLv3] run scoreboard players set Count SF_Data 150
	execute as @s[scores={SF_StatQ=2},tag=SF_QuarryLv4] run scoreboard players set Count SF_Data 200
	execute as @s[scores={SF_StatQ=2},tag=SF_QuarryLv5] run scoreboard players set Count SF_Data 250
	execute as @s[scores={SF_StatQ=2},tag=SF_QuarryLv6] run scoreboard players set Count SF_Data 2500
	execute if score @s SF_StatQ matches 2 if score Count SF_Data matches 1.. at @s run function stardust:quarry/working/pos_check
