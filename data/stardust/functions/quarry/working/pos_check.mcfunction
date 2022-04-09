execute if score @s stardust.quarry_status matches 2 run function stardust:quarry/working/pos
execute if score @s stardust.quarry_status matches 2 if score #count stardust.data matches 1.. run function stardust:quarry/working/pos_check
