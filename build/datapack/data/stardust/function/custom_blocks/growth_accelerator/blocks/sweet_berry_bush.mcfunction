
#> stardust:custom_blocks/growth_accelerator/blocks/sweet_berry_bush
#
# @executed	positioned ~10 ~10 ~10
#
# @within	stardust:custom_blocks/growth_accelerator/layer_z
#

execute if block ~ ~ ~ sweet_berry_bush[age=3] run return 0
execute if block ~ ~ ~ sweet_berry_bush[age=2] run return run setblock ~ ~ ~ sweet_berry_bush[age=3] strict
execute if block ~ ~ ~ sweet_berry_bush[age=1] run return run setblock ~ ~ ~ sweet_berry_bush[age=2] strict
execute if block ~ ~ ~ sweet_berry_bush[age=0] run return run setblock ~ ~ ~ sweet_berry_bush[age=1] strict

