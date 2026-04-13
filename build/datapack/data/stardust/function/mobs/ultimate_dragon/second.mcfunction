
#> stardust:mobs/ultimate_dragon/second
#
# @executed	at @s
#
# @within	stardust:mobs/loop/mob_second
#

# Launch tick function
scoreboard players set #ultimate_dragon_tick stardust.data 20
schedule function stardust:mobs/ultimate_dragon/schedule_tick 1t append

# Set bossbar for nearby players
bossbar set stardust:ultimate_dragon visible true
bossbar set stardust:ultimate_dragon players @a[distance=..200]

# Check if any dragon died
execute as @e[tag=stardust.mob_entity,tag=stardust.ultimate_slave,tag=!stardust.dead_slave] run function stardust:mobs/ultimate_slave/check_health

# Prevents dead dragons from disappearing & applying phase 0 to all slave dragons
execute as @e[tag=stardust.mob_entity,tag=stardust.dead_slave] run data modify entity @s Health set value 512
execute as @e[tag=stardust.mob_entity,tag=stardust.ultimate_slave] run data modify entity @s DragonPhase set value 0

# Prevents dragons from flying too high (Y=150)
execute as @e[tag=stardust.dragon] at @s if entity @s[y=150,dy=800] run data modify entity @s Motion[1] set value -2.00d

# Every second, 20% chance to choose a random attack
execute as @e[tag=stardust.dragon,predicate=stardust:random/0.2] unless score @s stardust.attack_cooldown matches -200.. at @s run function stardust:mobs/ultimate_dragon/common/choose_attack

# Kill entities alive for too long (5s)
scoreboard players add @e[tag=stardust.short_lived_entity] stardust.data 1
kill @e[tag=stardust.short_lived_entity,scores={stardust.data=5..}]

# Boss music for nearby players
execute store result score #health stardust.data run data get entity @s Health
execute as @a[distance=..200] unless score @s stardust.boss_music > #global_second stardust.data at @s run function stardust:mobs/ultimate_dragon/try_boss_music

# Prevent entities to go too far away
execute in stardust:ultimate positioned 0 100 0 as @e[distance=256..1000] on vehicle run tp @s 0 100 0
execute in stardust:ultimate positioned 0 100 0 run tp @e[distance=256..1000] 0 100 0

