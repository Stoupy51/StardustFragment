
#> stardust:custom_blocks/growth_accelerator/blocks/potatoes
#
# @executed	positioned ~10 ~10 ~10
#
# @within	stardust:custom_blocks/growth_accelerator/layer_z
#

execute if block ~ ~ ~ potatoes[age=7] run return 0
execute if block ~ ~ ~ potatoes[age=6] run return run setblock ~ ~ ~ potatoes[age=7] strict
execute if block ~ ~ ~ potatoes[age=5] run return run setblock ~ ~ ~ potatoes[age=6] strict
execute if block ~ ~ ~ potatoes[age=4] run return run setblock ~ ~ ~ potatoes[age=5] strict
execute if block ~ ~ ~ potatoes[age=3] run return run setblock ~ ~ ~ potatoes[age=4] strict
execute if block ~ ~ ~ potatoes[age=2] run return run setblock ~ ~ ~ potatoes[age=3] strict
execute if block ~ ~ ~ potatoes[age=1] run return run setblock ~ ~ ~ potatoes[age=2] strict
execute if block ~ ~ ~ potatoes[age=0] run return run setblock ~ ~ ~ potatoes[age=1] strict

