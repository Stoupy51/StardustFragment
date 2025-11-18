
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

# Prevents dead dragons from disappearing & applying phase 0 to all slave dragons
execute as @e[tag=stardust.mob_entity,tag=stardust.dead_slave] run data modify entity @s Health set value 512
execute as @e[tag=stardust.mob_entity,tag=stardust.ultimate_slave] run data modify entity @s DragonPhase set value 0

# Prevents dragons from flying too high (Y=150)
execute as @e[tag=stardust.ultimate_boss] at @s if entity @s[y=150,dy=800] run data modify entity @s Motion[1] set value -2.00d

# Glowing only if no players nearby
data modify entity @s Glowing set value false
execute unless entity @a[gamemode=!spectator,distance=..15] run data modify entity @s Glowing set value true

# Every second, 20% chance to choose a random attack
execute as @e[tag=stardust.ultimate_boss,predicate=stardust:random/0.2] unless score @s stardust.attack_cooldown matches -200.. at @s run function stardust:mobs/ultimate_dragon/common/choose_attack

