
#> stardust:custom_blocks/growth_accelerator/blocks/nether_wart
#
# @executed	positioned ~10 ~10 ~10
#
# @within	stardust:custom_blocks/growth_accelerator/layer_z
#

execute if block ~ ~ ~ nether_wart[age=3] run return 0
execute if block ~ ~ ~ nether_wart[age=2] run return run setblock ~ ~ ~ nether_wart[age=3] strict
execute if block ~ ~ ~ nether_wart[age=1] run return run setblock ~ ~ ~ nether_wart[age=2] strict
execute if block ~ ~ ~ nether_wart[age=0] run return run setblock ~ ~ ~ nether_wart[age=1] strict

