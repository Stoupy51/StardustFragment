
#> stardust:mobs/delay/tick
#
# @executed	as @e[tag=stardust.delayed_convert] & at @s
#
# @within	stardust:mobs/delay/schedule [ as @e[tag=stardust.delayed_convert] & at @s ]
#

# Teleport entity upwards (2.0 blocks / 32 = 0.0625 per tick)
tp @s ~ ~0.0625 ~

# Check if delay is over
execute if score #global_tick stardust.data >= @s stardust.spawn_delay run data modify entity @s NoAI set value false
execute if score #global_tick stardust.data >= @s stardust.spawn_delay run data modify entity @s Invulnerable set value false
execute if score #global_tick stardust.data >= @s stardust.spawn_delay run return run tag @s remove stardust.delayed_convert

# Else, mark as remaining
scoreboard players add #remaining_delays stardust.data 1

