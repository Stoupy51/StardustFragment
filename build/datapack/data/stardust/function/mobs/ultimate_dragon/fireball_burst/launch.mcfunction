
#> stardust:mobs/ultimate_dragon/fireball_burst/launch
#
# @executed	as @e[tag=stardust.dragon,scores={stardust.attack_cooldown=-200..}] & at @s
#
# @within	stardust:mobs/ultimate_dragon/fireball_burst/tick
#

# Stop if no valid players
execute unless entity @p[gamemode=!spectator,gamemode=!creative,distance=..200] run return fail

# Fireball towards nearest player
execute facing entity @p[gamemode=!spectator,gamemode=!creative,distance=..200] eyes positioned ^ ^ ^5 run function stardust:mobs/ultimate_dragon/fireball_burst/summon_command

# Playsound for the targetted player
execute as @p[gamemode=!spectator,gamemode=!creative,distance=..200] at @s run playsound minecraft:entity.ender_dragon.shoot hostile @s

