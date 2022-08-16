
function simplenergy:generate/utils/random_position

scoreboard players set #max_attempts simplenergy.data 50
function simplenergy:generate/utils/find_adjacent_air

#Placing Ore
	execute store result score #rotation stardust.data run data get entity @s UUID[0]
	scoreboard players operation #rotation stardust.data %= #4 simplenergy.data
	execute if score #rotation stardust.data matches 1 at @s run tp @s ~ ~ ~ ~50 ~
	execute if score #rotation stardust.data matches 2 at @s run tp @s ~ ~ ~ ~150 ~
	execute if score #rotation stardust.data matches 3 at @s run tp @s ~ ~ ~ ~250 ~
	execute at @s unless block ~ ~ ~ #simplenergy:non_solid positioned ~ ~1 ~ if block ~ ~ ~ air if block ~ ~1 ~ air if block ~ ~2 ~ air run function stardust:place/life_crystal/main

kill @s
