scoreboard players set Found SF_Jump 0
execute if predicate stardust:sneaking positioned ~ ~-3 ~ run function stardust:work/elevator/go_down
execute if score @s SF_Jump matches 1.. positioned ~ ~1 ~ run function stardust:work/elevator/go_up
