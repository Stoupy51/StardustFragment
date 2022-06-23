
#Produce Energy depends on Power of daylight sensor
execute unless predicate simplenergy:check_daylight_power if score #day_time simplenergy.data matches 12000.. run scoreboard players add @s energy.storage 32
execute if score @s energy.storage > @s energy.max_storage run scoreboard players operation @s energy.storage = @s energy.max_storage
