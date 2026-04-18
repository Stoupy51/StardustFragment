
#> stardust:v4.0.6/load/resolve
#
# @within	#stardust:resolve
#

# If correct version, load the datapack
execute if score #stardust.major load.status matches 4 if score #stardust.minor load.status matches 0 if score #stardust.patch load.status matches 6 run function stardust:v4.0.6/load/main

