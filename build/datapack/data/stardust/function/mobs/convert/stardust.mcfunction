
#> stardust:mobs/convert/stardust
#
# @executed	at @s
#
# @within	stardust:mobs/check_dimension
#

# If skeleton, convert to stardust soldier
execute if entity @s[type=minecraft:skeleton] run return run function stardust:mobs/stardust_soldier/convert

# If evoker, convert to stardust evoker
execute if entity @s[type=minecraft:evoker] run return run function stardust:mobs/stardust_evoker/convert

# If bat, convert to stardust bat
execute if entity @s[type=minecraft:bat] run return run function stardust:mobs/stardust_bat/convert

