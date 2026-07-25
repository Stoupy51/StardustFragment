
#> stardust:dimensions/is_expansion_installed
#
# @within	string in stardust:dimensions/transitions/upward
#

# Check if the expansion is installed
execute unless score #stoupy51 exp.const matches 1 run return 1
return fail

