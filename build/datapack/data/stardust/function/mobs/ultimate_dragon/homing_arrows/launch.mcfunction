
#> stardust:mobs/ultimate_dragon/homing_arrows/launch
#
# @executed	as @e[tag=stardust.dragon,scores={stardust.attack_cooldown=-200..}] & at @s
#
# @within	stardust:mobs/ultimate_dragon/homing_arrows/tick
#

# Stop if no valid players
execute unless entity @p[gamemode=!spectator,gamemode=!creative,distance=..200] run return fail

# Launch 5 arrows with different effects at different positions towards nearest player
execute facing entity @p[gamemode=!spectator,gamemode=!creative,distance=..200] eyes positioned ^ ^ ^5 run function stardust:mobs/ultimate_dragon/homing_arrows/summon_all

# Playsound for the targetted player
execute as @p[gamemode=!spectator,gamemode=!creative,distance=..200] at @s run playsound minecraft:entity.arrow.shoot hostile @s

