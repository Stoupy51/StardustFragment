
#> stardust:custom_blocks/awakened_stardust_solar_panel/second
#
# @executed	as @e[tag=stardust.second] & at @s
#
# @within	stardust:custom_blocks/second
#

# Produce Energy depending on the power of daylight sensor
execute if predicate simplenergy:check_daylight_power run scoreboard players add @s energy.storage 16
execute if score @s energy.storage > @s energy.max_storage run scoreboard players operation @s energy.storage = @s energy.max_storage

