
#> stardust:custom_blocks/growth_accelerator/blocks/beetroots
#
# @executed	positioned ~10 ~10 ~10
#
# @within	stardust:custom_blocks/growth_accelerator/layer_z
#

execute if block ~ ~ ~ beetroots[age=3] run return 0
execute if block ~ ~ ~ beetroots[age=2] run return run setblock ~ ~ ~ beetroots[age=3] strict
execute if block ~ ~ ~ beetroots[age=1] run return run setblock ~ ~ ~ beetroots[age=2] strict
execute if block ~ ~ ~ beetroots[age=0] run return run setblock ~ ~ ~ beetroots[age=1] strict

