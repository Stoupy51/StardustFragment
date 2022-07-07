
scoreboard players remove #count_y stardust.data 1
scoreboard players set #count_x stardust.data 21
function stardust:work/growth_accelerator/layer_x
execute if score #count_y stardust.data matches 1.. positioned ~ ~-1 ~ run function stardust:work/growth_accelerator/layer_y
