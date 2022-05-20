
scoreboard players remove #count_x stardust.data 1
scoreboard players set #count_z stardust.data 20
function stardust:work/growth_accelerator/layer_z
execute if score #count_x stardust.data matches 1.. positioned ~-1 ~ ~ run function stardust:work/growth_accelerator/layer_x
