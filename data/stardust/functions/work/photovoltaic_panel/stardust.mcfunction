#Check if there is no block above
	scoreboard players set Count SF_Data 1
	scoreboard players set Temp SF_Data 1
	execute positioned ~ ~1 ~ run function stardust:work/photovoltaic_panel/check

#Produce Energy depends on DayTime
execute if score Temp SF_Data matches 1 if score DayTime SF_Data matches 13500..22500 run scoreboard players add @s EF_kJ 2
execute if score Temp SF_Data matches 1 unless score DayTime SF_Data matches 13500..22500 run scoreboard players add @s EF_kJ 8

execute if score @s EF_kJ matches 800.. run scoreboard players set @s EF_kJ 800
