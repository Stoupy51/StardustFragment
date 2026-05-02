
#> stardust:v4.0.7/tick
#
# @within	stardust:v4.0.7/load/tick_verification
#

# Timers
scoreboard players add #tick_2 stardust.data 1
scoreboard players add #second stardust.data 1
scoreboard players add #second_5 stardust.data 1
scoreboard players add #minute stardust.data 1
execute if score #tick_2 stardust.data matches 3.. run function stardust:v4.0.7/tick_2
execute if score #second stardust.data matches 20.. run function stardust:v4.0.7/second
execute if score #second_5 stardust.data matches 90.. run function stardust:v4.0.7/second_5
execute if score #minute stardust.data matches 1200.. run function stardust:v4.0.7/minute

# Global counter for various features
scoreboard players add #global_tick stardust.data 1

