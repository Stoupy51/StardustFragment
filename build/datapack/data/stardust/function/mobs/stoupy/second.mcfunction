
#> stardust:mobs/stoupy/second
#
# @executed	at @s
#
# @within	stardust:mobs/loop/mob_second
#

# If update health, set health to max
execute if entity @s[tag=stardust.update_health] run data modify entity @s Health set value 250
tag @s remove stardust.update_health

# High step height and jump boost to prevent getting stuck
attribute @s minecraft:step_height base set 16.0
effect give @s minecraft:jump_boost 10 4 true

# Always on world surface
execute positioned over world_surface run tp @s ~ ~ ~

# Particles
particle enchant ~ ~ ~ 2 2 2 0 10

# Set bossbar for nearby players & update value
bossbar set stardust:stoup_army visible true
bossbar set stardust:stoup_army players @a[distance=..200]
execute store result bossbar stardust:stoup_army value run data get entity @s Health

# Glowing only if no players nearby
data modify entity @s Glowing set value false
execute unless entity @a[gamemode=!spectator,distance=..15] run data modify entity @s Glowing set value true

