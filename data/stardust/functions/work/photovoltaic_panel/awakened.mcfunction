#Check if there is no block above
	scoreboard players set Count SF_Data 1
	scoreboard players set YES SF_Data 1
	execute positioned ~ ~1 ~ run function stardust:work/photovoltaic_panel/check

#Produce Energy depends on DayTime
execute if score YES SF_Data matches 1 if score DayTime SF_Data matches 13500..22500 run scoreboard players add @s EF_kJ 4
execute if score YES SF_Data matches 1 unless score DayTime SF_Data matches 13500..22500 run scoreboard players add @s EF_kJ 16

execute if score @s EF_kJ matches 1600.. run scoreboard players set @s EF_kJ 1600
