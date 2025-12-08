
#> stardust:v4.0.0/load/main
#
# @within	stardust:v4.0.0/load/resolve
#

# Avoiding multiple executions of the same load function
execute unless score #stardust.loaded load.status matches 1 run function stardust:v4.0.0/load/secondary

