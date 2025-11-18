
#> stardust:mobs/ultimate_slave/check_health
#
# @executed	as @e[tag=...]
#
# @within	stardust:mobs/ultimate_dragon/second [ as @e[tag=...] ]
#

# If health <= 5, mark as dead_slave
execute store result score #health stardust.data run data get entity @s Health
execute if score #health stardust.data matches ..5 run tag @s add stardust.dead_slave
execute if score #health stardust.data matches ..5 run effect give @s minecraft:resistance infinite 255 true
execute if score #health stardust.data matches ..5 as @e[tag=stardust.mob_entity,tag=stardust.ultimate_dragon] at @s run function stardust:mobs/ultimate_slave/damage_ultimate_dragon

