
scoreboard players remove #count_z stardust.data 1
execute if block ~ ~ ~ wheat run function stardust:work/growth_accelerator/wheat
execute if score #count_z stardust.data matches 1.. positioned ~ ~ ~-1 run function stardust:work/growth_accelerator/layer_z
