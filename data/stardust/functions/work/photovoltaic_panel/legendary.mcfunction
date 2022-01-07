#Check if there is no block above
	scoreboard players set Count StardustFragment_Data 1
	scoreboard players set Temp StardustFragment_Data 1
	execute positioned ~ ~1 ~ run function stardust:work/photovoltaic_panel/check

#Produce Energy depends on DayTime
execute if score Temp StardustFragment_Data matches 1 if score DayTime StardustFragment_Data matches 13500..22500 run scoreboard players add @s energy.storage 8
execute if score Temp StardustFragment_Data matches 1 unless score DayTime StardustFragment_Data matches 13500..22500 run scoreboard players add @s energy.storage 32

execute if score @s energy.storage >= @s energy.max_storage run scoreboard players operation @s energy.storage = @s energy.max_storage
