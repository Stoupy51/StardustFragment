
scoreboard players set #temp stardust.data 0
execute if predicate stardust:sneaking positioned ~ ~-3 ~ run function stardust:work/elevator/go_down
execute if score @s stardust.jump matches 1.. positioned ~ ~1 ~ run function stardust:work/elevator/go_up
execute if score #temp stardust.data matches 1 run advancement grant @s only stardust:visible/technology/elevator
execute if score #temp stardust.data matches 1 run scoreboard players set @s stardust.data_2 -3

