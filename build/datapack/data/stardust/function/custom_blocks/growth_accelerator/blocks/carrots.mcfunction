
#> stardust:custom_blocks/growth_accelerator/blocks/carrots
#
# @executed	positioned ~10 ~10 ~10
#
# @within	stardust:custom_blocks/growth_accelerator/layer_z
#

execute if block ~ ~ ~ carrots[age=7] run return 0
execute if block ~ ~ ~ carrots[age=6] run return run setblock ~ ~ ~ carrots[age=7] strict
execute if block ~ ~ ~ carrots[age=5] run return run setblock ~ ~ ~ carrots[age=6] strict
execute if block ~ ~ ~ carrots[age=4] run return run setblock ~ ~ ~ carrots[age=5] strict
execute if block ~ ~ ~ carrots[age=3] run return run setblock ~ ~ ~ carrots[age=4] strict
execute if block ~ ~ ~ carrots[age=2] run return run setblock ~ ~ ~ carrots[age=3] strict
execute if block ~ ~ ~ carrots[age=1] run return run setblock ~ ~ ~ carrots[age=2] strict
execute if block ~ ~ ~ carrots[age=0] run return run setblock ~ ~ ~ carrots[age=1] strict

