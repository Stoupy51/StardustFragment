
#> stardust:mobs/ultimate_dragon/unique_drop
#
# @executed	as @n[type=item,nbt={...}]
#
# @within	stardust:mobs/ultimate_dragon/finish_death_at_entity [ as @n[type=item,nbt={...}] ]
#

# Remove motion, add no gravity and glowing
data modify entity @s Motion set value [0.0d,0.0d,0.0d]
data modify entity @s NoGravity set value true
data modify entity @s Glowing set value true

