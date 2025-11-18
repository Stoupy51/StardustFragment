
#> stardust:mobs/ultimate_dragon/tick
#
# @executed	as @n[tag=...] & at @s
#
# @within	stardust:mobs/ultimate_dragon/schedule_tick [ as @n[tag=...] & at @s ]
#

# Update bossbar value
execute store result bossbar stardust:ultimate_dragon value run data get entity @s Health

# Particles to dead slaves to indicate they are dead
execute at @e[tag=stardust.mob_entity,tag=stardust.dead_slave] run particle minecraft:soul ~ ~ ~ 5 5 5 0.05 100 force @a[distance=..200]

# Handle attack cooldown
execute as @e[tag=stardust.ultimate_boss,scores={stardust.attack_cooldown=-200..}] at @s run function stardust:mobs/ultimate_dragon/common/handle_attack_cooldown

# Check if poops are destroyed
execute as @e[type=item_display,tag=stardust.ultimate_poop] at @s run function stardust:mobs/ultimate_dragon/poop/check_destroy

