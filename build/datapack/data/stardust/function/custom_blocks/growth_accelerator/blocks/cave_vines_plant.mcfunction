
#> stardust:custom_blocks/growth_accelerator/blocks/cave_vines_plant
#
# @executed	positioned ~10 ~10 ~10
#
# @within	stardust:custom_blocks/growth_accelerator/layer_z
#

execute if block ~ ~ ~ cave_vines_plant[berries=false] run return run setblock ~ ~ ~ cave_vines_plant[berries=true] strict

