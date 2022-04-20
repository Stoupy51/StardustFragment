
data modify entity @s DeathLootTable set value "stardust:entities/dungeon_dimension"
attribute @s generic.attack_damage modifier add 1-1-1-1-1 "1" 1.5 multiply_base
attribute @s generic.max_health modifier add 1-1-1-1-2 "2" 4 multiply_base
data modify entity @s Health set value 2048
team join stardust.team @s
tag @s add stardust.dungeon_dim
