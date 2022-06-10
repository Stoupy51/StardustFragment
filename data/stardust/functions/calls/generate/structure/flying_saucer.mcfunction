
function stardust:calls/generate/structure/height_variation
tp @s ~ ~96 ~

#Choose a Structure
	execute if score #rotation stardust.data matches 0 at @s run place template stardust:flying_saucer ~ ~ ~ none
	execute if score #rotation stardust.data matches 1 at @s run place template stardust:flying_saucer ~ ~ ~ clockwise_90
	execute if score #rotation stardust.data matches 2 at @s run place template stardust:flying_saucer ~ ~ ~ 180
	execute if score #rotation stardust.data matches 3 at @s run place template stardust:flying_saucer ~ ~ ~ counterclockwise_90
