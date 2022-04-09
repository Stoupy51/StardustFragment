execute if score @s stardust.quarry_status matches 1 run function stardust:quarry/working/start
#Check Size
	execute if score @s stardust.quarry_size matches 2000001.. run tellraw @a[distance=..3] [{"text":"ERROR: More than 2M blocks","italic":false,"color":"red"}]
	scoreboard players set @s[scores={stardust.quarry_size=2000001..}] stardust.quarry_status 0
	scoreboard players add @s stardust.quarry_speed 0
	scoreboard players set #count stardust.data 0
	scoreboard players set #temp stardust.data 0

	execute if score @s stardust.quarry_status matches 2 run scoreboard players remove @s[tag=stardust.quarry_lv1] energy.storage 125
	execute if score @s stardust.quarry_status matches 2 run scoreboard players remove @s[tag=stardust.quarry_lv2] energy.storage 250
	execute if score @s stardust.quarry_status matches 2 run scoreboard players remove @s[tag=stardust.quarry_lv3] energy.storage 375
	execute if score @s stardust.quarry_status matches 2 run scoreboard players remove @s[tag=stardust.quarry_lv4] energy.storage 500
	execute if score @s stardust.quarry_status matches 2 run scoreboard players remove @s[tag=stardust.quarry_lv5] energy.storage 625
	execute if entity @s[scores={stardust.quarry_status=2},tag=stardust.quarry_lv1] run scoreboard players set #count stardust.data 50
	execute if entity @s[scores={stardust.quarry_status=2},tag=stardust.quarry_lv2] run scoreboard players set #count stardust.data 100
	execute if entity @s[scores={stardust.quarry_status=2},tag=stardust.quarry_lv3] run scoreboard players set #count stardust.data 150
	execute if entity @s[scores={stardust.quarry_status=2},tag=stardust.quarry_lv4] run scoreboard players set #count stardust.data 200
	execute if entity @s[scores={stardust.quarry_status=2},tag=stardust.quarry_lv5] run scoreboard players set #count stardust.data 250
	execute if entity @s[scores={stardust.quarry_status=2},tag=stardust.quarry_lv6] run scoreboard players set #count stardust.data 2500
	execute if score @s stardust.quarry_status matches 2 if score #count stardust.data matches 1.. at @s run function stardust:quarry/working/pos_check
