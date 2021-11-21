execute if score @s SF_StatQ matches 1 run function stardust:quarry/working/start
#Check Size
	execute if score @s SF_SizeQ matches 2000001.. run tellraw @a[distance=..3] [{"text":"ERROR: More than 2M blocks","italic":false,"color":"red"}]
	scoreboard players set @s[scores={SF_SizeQ=2000001..}] SF_StatQ 0
	scoreboard players add @s SF_SpeedQ 0
	execute if score @s SF_StatQ matches 2 run scoreboard players operation @s EF_kJ -= @s EF_kW
	execute as @s[scores={SF_StatQ=2},tag=SF_QuarryLv1] at @s run function stardust:quarry/working/pos_check
	execute as @s[scores={SF_StatQ=2},tag=SF_QuarryLv2] at @e[limit=2] at @s run function stardust:quarry/working/pos_check
	execute as @s[scores={SF_StatQ=2},tag=SF_QuarryLv3] at @e[limit=3] at @s run function stardust:quarry/working/pos_check
	execute as @s[scores={SF_StatQ=2},tag=SF_QuarryLv4] at @e[limit=4] at @s run function stardust:quarry/working/pos_check
	execute as @s[scores={SF_StatQ=2},tag=SF_QuarryLv5] at @e[limit=5] at @s run function stardust:quarry/working/pos_check
	execute as @s[scores={SF_StatQ=2},tag=SF_QuarryLv6] at @e[limit=50] at @s run function stardust:quarry/working/pos_check
