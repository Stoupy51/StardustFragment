
#Produce Energy depends on Power of daylight sensor
execute if predicate simplenergy:check_daylight_power run scoreboard players add @s energy.storage 16
execute if score @s energy.storage > @s energy.max_storage run scoreboard players operation @s energy.storage = @s energy.max_storage
