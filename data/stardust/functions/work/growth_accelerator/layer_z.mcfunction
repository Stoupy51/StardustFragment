
scoreboard players remove #count_z stardust.data 1

scoreboard players set #block stardust.data 0
execute if score #block stardust.data matches 0 if block ~ ~ ~ wheat run function stardust:work/growth_accelerator/blocks/wheat
execute if score #block stardust.data matches 0 if block ~ ~ ~ carrots run function stardust:work/growth_accelerator/blocks/carrots
execute if score #block stardust.data matches 0 if block ~ ~ ~ potatoes run function stardust:work/growth_accelerator/blocks/potatoes
execute if score #block stardust.data matches 0 if block ~ ~ ~ nether_wart run function stardust:work/growth_accelerator/blocks/nether_wart
execute if score #block stardust.data matches 0 if block ~ ~ ~ beetroots run function stardust:work/growth_accelerator/blocks/beetroots
execute if score #block stardust.data matches 0 if block ~ ~ ~ melon_stem run function stardust:work/growth_accelerator/blocks/melon_stem
execute if score #block stardust.data matches 0 if block ~ ~ ~ pumpkin_stem run function stardust:work/growth_accelerator/blocks/pumpkin_stem
execute if score #block stardust.data matches 0 if block ~ ~ ~ sweet_berry_bush run function stardust:work/growth_accelerator/blocks/sweet_berry_bush
execute if score #block stardust.data matches 0 if block ~ ~ ~ cave_vines run function stardust:work/growth_accelerator/blocks/cave_vines
execute if score #block stardust.data matches 0 if block ~ ~ ~ cave_vines_plant run function stardust:work/growth_accelerator/blocks/cave_vines_plant

execute if score #count_z stardust.data matches 1.. positioned ~ ~ ~-1 run function stardust:work/growth_accelerator/layer_z

