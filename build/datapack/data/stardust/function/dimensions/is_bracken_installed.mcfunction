
#> stardust:dimensions/is_bracken_installed
#
# @executed	as @e[tag=!...,predicate=stardust:transitions/outside] & at @s
#
# @within	stardust:dimensions/transitions/upward run return fail
#			stardust:dimensions/transitions/downward if dimension stardust:celestial in bracken:pax run tp @s ~ 575 ~ [ in bracken:pax ]
#

# Check if the bracken is installed
execute unless score #stoupy51 bp.var matches 1 run return 1
return fail

