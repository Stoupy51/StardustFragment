scoreboard players add Quarry SF_Data 1
#Select Zone
	execute if entity @p[distance=..3] run function stardust:quarry/select
#Display
	execute if entity @p[distance=..3] run function stardust:quarry/display/all
execute if score @s SF_StatQ matches 1.. run function stardust:quarry/working
forceload add ~-3 ~-3 ~3 ~3
