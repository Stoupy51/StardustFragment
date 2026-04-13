
#> stardust:mobs/convert/celestial
#
# @executed	at @s
#
# @within	stardust:mobs/check_dimension
#

# Set attributes (x1.5 health, x1.5 damage, x1.1 speed)
attribute @s minecraft:max_health modifier add stardust:health_scale 0.5 add_multiplied_base
attribute @s minecraft:attack_damage modifier add stardust:damage_scale 0.5 add_multiplied_base
attribute @s minecraft:movement_speed modifier add stardust:speed_scale 0.1 add_multiplied_base
data modify entity @s Health set value 2048.0f

# Set loot table & tags
data modify entity @s DeathLootTable set value "stardust:entities/celestial_dimension"
tag @s add smithed.entity

