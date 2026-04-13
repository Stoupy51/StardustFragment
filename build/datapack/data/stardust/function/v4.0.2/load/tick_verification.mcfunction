
#> stardust:v4.0.2/load/tick_verification
#
# @within	#minecraft:tick
#

execute if score #stardust.major load.status matches 4 if score #stardust.minor load.status matches 0 if score #stardust.patch load.status matches 2 run function stardust:v4.0.2/tick

