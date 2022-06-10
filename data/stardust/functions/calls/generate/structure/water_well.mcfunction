
#Choose a Structure
	execute if score #rotation stardust.data matches 0 at @s run place template stardust:water_well ~ ~-4 ~ none
	execute if score #rotation stardust.data matches 1 at @s run place template stardust:water_well ~ ~-4 ~ clockwise_90
	execute if score #rotation stardust.data matches 2 at @s run place template stardust:water_well ~ ~-4 ~ 180
	execute if score #rotation stardust.data matches 3 at @s run place template stardust:water_well ~ ~-4 ~ counterclockwise_90
