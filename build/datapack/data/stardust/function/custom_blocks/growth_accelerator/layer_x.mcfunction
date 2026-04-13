
#> stardust:custom_blocks/growth_accelerator/layer_x
#
# @executed	positioned ~10 ~10 ~10
#
# @within	stardust:custom_blocks/growth_accelerator/layer_y
#			stardust:custom_blocks/growth_accelerator/layer_x [ positioned ~-1 ~ ~ ]
#

# Loop through Z axis
scoreboard players set #count_z stardust.data 21
function stardust:custom_blocks/growth_accelerator/layer_z

# Continue to next X column
scoreboard players remove #count_x stardust.data 1
execute if score #count_x stardust.data matches 1.. positioned ~-1 ~ ~ run function stardust:custom_blocks/growth_accelerator/layer_x

