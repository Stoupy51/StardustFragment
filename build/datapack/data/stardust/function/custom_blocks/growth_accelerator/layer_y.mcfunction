
#> stardust:custom_blocks/growth_accelerator/layer_y
#
# @executed	positioned ~10 ~10 ~10
#
# @within	stardust:custom_blocks/growth_accelerator/second_5 [ positioned ~10 ~10 ~10 ]
#			stardust:custom_blocks/growth_accelerator/layer_y [ positioned ~ ~-1 ~ ]
#

# Loop through X axis
scoreboard players set #count_x stardust.data 21
function stardust:custom_blocks/growth_accelerator/layer_x

# Continue to next Y layer
scoreboard players remove #count_y stardust.data 1
execute if score #count_y stardust.data matches 1.. positioned ~ ~-1 ~ run function stardust:custom_blocks/growth_accelerator/layer_y

