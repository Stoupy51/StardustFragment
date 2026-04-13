
#> stardust:mobs/stardust_guardian/second
#
# @executed	at @s
#
# @within	stardust:mobs/loop/mob_second
#

# Particles
particle dust{color:[1,0,0],scale:1} ~ ~-1 ~ 2 2 2 0 10

# If lost half health, summon a wave of mobs around all players
execute store result score #health stardust.data run data get entity @s Health
execute if score #health stardust.data matches 513.. run tag @s add stardust.not_half_health
execute if score #health stardust.data matches ..512 if entity @s[tag=stardust.not_half_health] run function stardust:mobs/stardust_guardian/half_health_reached

# Set bossbar for nearby players & update value
bossbar set stardust:stardust_guardian visible true
bossbar set stardust:stardust_guardian players @a[distance=..200]
execute store result bossbar stardust:stardust_guardian value run scoreboard players get #health stardust.data

# Glowing only if no players nearby
execute on passengers run data modify entity @s Glowing set value false
execute unless entity @a[gamemode=!spectator,distance=..15] on passengers run data modify entity @s Glowing set value true

