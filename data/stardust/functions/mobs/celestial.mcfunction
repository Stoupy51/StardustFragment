
data modify entity @s DeathLootTable set value "stardust:entities/celestial_dimension"
attribute @s generic.attack_damage modifier add 1-1-1-1-1 "1" 1.25 multiply_base
attribute @s generic.max_health modifier add 1-1-1-1-2 "2" 2 multiply_base
data modify entity @s Health set value 2048
tag @s add stardust.celestial_dim
