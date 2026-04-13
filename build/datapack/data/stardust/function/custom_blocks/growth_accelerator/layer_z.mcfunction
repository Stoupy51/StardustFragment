
#> stardust:custom_blocks/growth_accelerator/layer_z
#
# @executed	positioned ~10 ~10 ~10
#
# @within	stardust:custom_blocks/growth_accelerator/layer_x
#			stardust:custom_blocks/growth_accelerator/layer_z [ positioned ~ ~ ~-1 ]
#

# Loop through all crops
execute if block ~ ~ ~ wheat run return run function stardust:custom_blocks/growth_accelerator/blocks/wheat
execute if block ~ ~ ~ carrots run return run function stardust:custom_blocks/growth_accelerator/blocks/carrots
execute if block ~ ~ ~ potatoes run return run function stardust:custom_blocks/growth_accelerator/blocks/potatoes
execute if block ~ ~ ~ nether_wart run return run function stardust:custom_blocks/growth_accelerator/blocks/nether_wart
execute if block ~ ~ ~ beetroots run return run function stardust:custom_blocks/growth_accelerator/blocks/beetroots
execute if block ~ ~ ~ melon_stem run return run function stardust:custom_blocks/growth_accelerator/blocks/melon_stem
execute if block ~ ~ ~ pumpkin_stem run return run function stardust:custom_blocks/growth_accelerator/blocks/pumpkin_stem
execute if block ~ ~ ~ sweet_berry_bush run return run function stardust:custom_blocks/growth_accelerator/blocks/sweet_berry_bush
execute if block ~ ~ ~ cave_vines run return run function stardust:custom_blocks/growth_accelerator/blocks/cave_vines
execute if block ~ ~ ~ cave_vines_plant run return run function stardust:custom_blocks/growth_accelerator/blocks/cave_vines_plant

# Continue to next Z row
scoreboard players remove #count_z stardust.data 1
execute if score #count_z stardust.data matches 1.. positioned ~ ~ ~-1 run function stardust:custom_blocks/growth_accelerator/layer_z

