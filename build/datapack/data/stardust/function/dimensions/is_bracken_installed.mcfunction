
#> stardust:dimensions/is_bracken_installed
#
# @within	string in stardust:dimensions/transitions/upward
#			string in stardust:dimensions/transitions/downward
#

# Check if the bracken is installed
execute unless score #stoupy51 bp.var matches 1 run return 1
return fail

