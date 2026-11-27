
#> stardust:v4.5.2/load/tick_verification
#
# @within	#minecraft:tick
#

execute if score #stardust.major load.status matches 4 if score #stardust.minor load.status matches 5 if score #stardust.patch load.status matches 2 run function stardust:v4.5.2/tick

