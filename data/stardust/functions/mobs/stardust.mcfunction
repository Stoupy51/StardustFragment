
scoreboard players set #temp stardust.data 1
execute if predicate stardust:random_0_75 run scoreboard players set #temp stardust.data 0

execute if score #temp stardust.data matches 0 run function stardust:mobs/stray
execute if score #temp stardust.data matches 1 run function stardust:mobs/evoker

tp @s 0 -10000 0

