
#> stardust:custom_blocks/growth_accelerator/blocks/wheat
#
# @executed	positioned ~10 ~10 ~10
#
# @within	stardust:custom_blocks/growth_accelerator/layer_z
#

execute if block ~ ~ ~ wheat[age=7] run return 0
execute if block ~ ~ ~ wheat[age=6] run return run setblock ~ ~ ~ wheat[age=7] strict
execute if block ~ ~ ~ wheat[age=5] run return run setblock ~ ~ ~ wheat[age=6] strict
execute if block ~ ~ ~ wheat[age=4] run return run setblock ~ ~ ~ wheat[age=5] strict
execute if block ~ ~ ~ wheat[age=3] run return run setblock ~ ~ ~ wheat[age=4] strict
execute if block ~ ~ ~ wheat[age=2] run return run setblock ~ ~ ~ wheat[age=3] strict
execute if block ~ ~ ~ wheat[age=1] run return run setblock ~ ~ ~ wheat[age=2] strict
execute if block ~ ~ ~ wheat[age=0] run return run setblock ~ ~ ~ wheat[age=1] strict

