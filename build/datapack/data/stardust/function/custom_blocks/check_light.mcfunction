
#> stardust:custom_blocks/check_light
#
# @executed	positioned ~ ~1 ~
#
# @within	stardust:custom_blocks/compute_brightness [ positioned ~ ~1 ~ ]
#			stardust:custom_blocks/compute_brightness [ positioned ~ ~-1 ~ ]
#			stardust:custom_blocks/compute_brightness [ positioned ~1 ~ ~ ]
#			stardust:custom_blocks/compute_brightness [ positioned ~-1 ~ ~ ]
#			stardust:custom_blocks/compute_brightness [ positioned ~ ~ ~1 ]
#			stardust:custom_blocks/compute_brightness [ positioned ~ ~ ~-1 ]
#

# Check light level at current position and update #light if higher
execute if score #light stardust.data matches ..0 if predicate stardust:light/1 run return run scoreboard players set #light stardust.data 1
execute if score #light stardust.data matches ..1 if predicate stardust:light/2 run return run scoreboard players set #light stardust.data 2
execute if score #light stardust.data matches ..2 if predicate stardust:light/3 run return run scoreboard players set #light stardust.data 3
execute if score #light stardust.data matches ..3 if predicate stardust:light/4 run return run scoreboard players set #light stardust.data 4
execute if score #light stardust.data matches ..4 if predicate stardust:light/5 run return run scoreboard players set #light stardust.data 5
execute if score #light stardust.data matches ..5 if predicate stardust:light/6 run return run scoreboard players set #light stardust.data 6
execute if score #light stardust.data matches ..6 if predicate stardust:light/7 run return run scoreboard players set #light stardust.data 7
execute if score #light stardust.data matches ..7 if predicate stardust:light/8 run return run scoreboard players set #light stardust.data 8
execute if score #light stardust.data matches ..8 if predicate stardust:light/9 run return run scoreboard players set #light stardust.data 9
execute if score #light stardust.data matches ..9 if predicate stardust:light/10 run return run scoreboard players set #light stardust.data 10
execute if score #light stardust.data matches ..10 if predicate stardust:light/11 run return run scoreboard players set #light stardust.data 11
execute if score #light stardust.data matches ..11 if predicate stardust:light/12 run return run scoreboard players set #light stardust.data 12
execute if score #light stardust.data matches ..12 if predicate stardust:light/13 run return run scoreboard players set #light stardust.data 13
execute if score #light stardust.data matches ..13 if predicate stardust:light/14 run return run scoreboard players set #light stardust.data 14
execute if score #light stardust.data matches ..14 if predicate stardust:light/15 run return run scoreboard players set #light stardust.data 15

