
#> stardust:mobs/convert/cavern
#
# @executed	at @s
#
# @within	stardust:mobs/check_dimension
#

# Set attributes (x0.75 scale)
attribute @s minecraft:scale modifier add stardust:scale 0.75 add_multiplied_base

# Set loot table
data modify entity @s DeathLootTable set value "stardust:entities/cavern_dimension"

