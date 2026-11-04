
#> stardust:custom_blocks/growth_accelerator/layer_z
#
# @executed	positioned ~10 ~10 ~10
#
# @within	stardust:custom_blocks/growth_accelerator/layer_x
#			stardust:custom_blocks/growth_accelerator/layer_z [ positioned ~ ~ ~-1 ]
#

# Loop through all crops
execute if block ~ ~ ~ wheat run function stardust:custom_blocks/growth_accelerator/blocks/wheat
execute if block ~ ~ ~ carrots run function stardust:custom_blocks/growth_accelerator/blocks/carrots
execute if block ~ ~ ~ potatoes run function stardust:custom_blocks/growth_accelerator/blocks/potatoes
execute if block ~ ~ ~ nether_wart run function stardust:custom_blocks/growth_accelerator/blocks/nether_wart
execute if block ~ ~ ~ beetroots run function stardust:custom_blocks/growth_accelerator/blocks/beetroots
execute if block ~ ~ ~ melon_stem run function stardust:custom_blocks/growth_accelerator/blocks/melon_stem
execute if block ~ ~ ~ pumpkin_stem run function stardust:custom_blocks/growth_accelerator/blocks/pumpkin_stem
execute if block ~ ~ ~ sweet_berry_bush run function stardust:custom_blocks/growth_accelerator/blocks/sweet_berry_bush
execute if block ~ ~ ~ cave_vines run function stardust:custom_blocks/growth_accelerator/blocks/cave_vines
execute if block ~ ~ ~ cave_vines_plant run function stardust:custom_blocks/growth_accelerator/blocks/cave_vines_plant

# Continue to next Z row
scoreboard players remove #count_z stardust.data 1
execute if score #count_z stardust.data matches 1.. positioned ~ ~ ~-1 run function stardust:custom_blocks/growth_accelerator/layer_z

