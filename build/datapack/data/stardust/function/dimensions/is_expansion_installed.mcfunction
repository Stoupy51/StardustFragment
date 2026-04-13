
#> stardust:dimensions/is_expansion_installed
#
# @executed	as @e[tag=!...,predicate=stardust:transitions/outside] & at @s
#
# @within	stardust:dimensions/transitions/upward run return fail
#

# Check if the expansion is installed
execute unless score #stoupy51 exp.const matches 1 run return 1
return fail

