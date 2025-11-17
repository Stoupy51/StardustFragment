
#> stardust:mobs/ultimate_dragon/second
#
# @executed	at @s
#
# @within	stardust:mobs/loop/mob_second
#

# Particles
particle enchant ~ ~ ~ 2 2 2 0 10

# Set bossbar for nearby players & update value
bossbar set stardust:ultimate_dragon visible true
bossbar set stardust:ultimate_dragon players @a[distance=..200]
execute store result bossbar stardust:ultimate_dragon value run data get entity @s Health

# Glowing only if no players nearby
data modify entity @s Glowing set value false
execute unless entity @a[gamemode=!spectator,distance=..15] run data modify entity @s Glowing set value true

