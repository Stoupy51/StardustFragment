
#> stardust:v3.5.0/load/resolve
#
# @within	#stardust:resolve
#

# If correct version, load the datapack
execute if score #stardust.major load.status matches 3 if score #stardust.minor load.status matches 5 if score #stardust.patch load.status matches 0 run function stardust:v3.5.0/load/main

