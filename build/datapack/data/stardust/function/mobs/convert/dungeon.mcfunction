
#> stardust:mobs/convert/dungeon
#
# @executed	at @s
#
# @within	stardust:mobs/check_dimension
#

# Set attributes (x3 health, x4 damage, x1.35 speed)
attribute @s minecraft:max_health modifier add stardust:health_scale 2 add_multiplied_base
attribute @s minecraft:attack_damage modifier add stardust:damage_scale 3 add_multiplied_base
attribute @s minecraft:movement_speed modifier add stardust:speed_scale 0.35 add_multiplied_base
data modify entity @s Health set value 2048.0f

# Set loot table & tags
data modify entity @s DeathLootTable set value "stardust:entities/dungeon_dimension"
tag @s add smithed.entity

# Join mob team
team join stardust.mob @s

