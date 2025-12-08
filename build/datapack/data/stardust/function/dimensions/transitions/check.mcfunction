
#> stardust:dimensions/transitions/check
#
# @executed	as @e[tag=!...,predicate=stardust:transitions/outside] & at @s
#
# @within	stardust:v4.0.0/second [ as @e[tag=!...,predicate=stardust:transitions/outside] & at @s ]
#

# If player and transition is up, run upward transition
execute if entity @s[type=player] if predicate stardust:transitions/up run return run function stardust:dimensions/transitions/upward

# Else, if transition is down, run downward transition
execute if predicate stardust:transitions/down run function stardust:dimensions/transitions/downward

