
#> stardust:custom_blocks/growth_accelerator/blocks/pumpkin_stem
#
# @executed	positioned ~10 ~10 ~10
#
# @within	stardust:custom_blocks/growth_accelerator/layer_z
#

execute if block ~ ~ ~ pumpkin_stem[age=7] run return 0
execute if block ~ ~ ~ pumpkin_stem[age=6] run return run setblock ~ ~ ~ pumpkin_stem[age=7] strict
execute if block ~ ~ ~ pumpkin_stem[age=5] run return run setblock ~ ~ ~ pumpkin_stem[age=6] strict
execute if block ~ ~ ~ pumpkin_stem[age=4] run return run setblock ~ ~ ~ pumpkin_stem[age=5] strict
execute if block ~ ~ ~ pumpkin_stem[age=3] run return run setblock ~ ~ ~ pumpkin_stem[age=4] strict
execute if block ~ ~ ~ pumpkin_stem[age=2] run return run setblock ~ ~ ~ pumpkin_stem[age=3] strict
execute if block ~ ~ ~ pumpkin_stem[age=1] run return run setblock ~ ~ ~ pumpkin_stem[age=2] strict
execute if block ~ ~ ~ pumpkin_stem[age=0] run return run setblock ~ ~ ~ pumpkin_stem[age=1] strict

