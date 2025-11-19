
#> stardust:mobs/ultimate_dragon/tick
#
# @executed	as @n[tag=...] & at @s
#
# @within	stardust:mobs/ultimate_dragon/schedule_tick [ as @n[tag=...] & at @s ]
#

# Update bossbar value
execute store result bossbar stardust:ultimate_dragon value run data get entity @s Health

# Particles to dead slaves to indicate they are dead
execute at @e[tag=stardust.mob_entity,tag=stardust.dead_slave] run particle minecraft:soul ~ ~ ~ 5 5 5 0.05 25 force @a[distance=..200]

# Replace fire so it doesn't last long
execute at @a[distance=..200] run fill ~-16 ~-16 ~-16 ~16 ~16 ~16 minecraft:fire[age=15] replace minecraft:fire

# Handle attack cooldown
execute as @e[tag=stardust.dragon,scores={stardust.attack_cooldown=-200..}] at @s run function stardust:mobs/ultimate_dragon/common/handle_attack_cooldown

# Check if poops are destroyed
execute as @e[type=item_display,tag=stardust.ultimate_poop] at @s run function stardust:mobs/ultimate_dragon/ultimate_poop/check_destroy

# Homing arrows targetting nearest player
execute as @e[type=arrow,tag=stardust.homing_arrow] at @s run function stardust:mobs/ultimate_dragon/homing_arrow/tick

