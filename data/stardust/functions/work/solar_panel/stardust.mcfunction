
#Check if there is no block above
	scoreboard players set #temp stardust.data 1
	execute positioned ~ ~1 ~ run function stardust:work/solar_panel/check

#Produce Energy depends on DayTime
execute if score #temp stardust.data matches 1 if score #day_time simplenergy.data matches 13500..22500 run scoreboard players add @s energy.storage 2
execute if score #temp stardust.data matches 1 unless score #day_time simplenergy.data matches 13500..22500 run scoreboard players add @s energy.storage 8

execute if score @s energy.storage >= @s energy.max_storage run scoreboard players operation @s energy.storage = @s energy.max_storage