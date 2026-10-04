
#> stardust:v4.1.1/load/resolve
#
# @within	#stardust:resolve
#

# If correct version, load the datapack
execute if score #stardust.major load.status matches 4 if score #stardust.minor load.status matches 1 if score #stardust.patch load.status matches 1 run function stardust:v4.1.1/load/main

