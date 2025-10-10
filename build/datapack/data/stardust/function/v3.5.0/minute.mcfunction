
#> stardust:v3.5.0/minute
#
# @within	stardust:v3.5.0/tick
#

# Reset timer
scoreboard players set #minute stardust.data 1

# Custom blocks minute functions
execute if score #minute_entities stardust.data matches 1.. as @e[tag=stardust.minute] at @s run function stardust:custom_blocks/minute

