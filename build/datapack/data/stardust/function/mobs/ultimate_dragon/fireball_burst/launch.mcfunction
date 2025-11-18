
#> stardust:mobs/ultimate_dragon/fireball_burst/launch
#
# @executed	as @e[tag=stardust.dragon,scores={stardust.attack_cooldown=-200..}] & at @s
#
# @within	stardust:mobs/ultimate_dragon/common/handle_attack_cooldown
#			stardust:mobs/ultimate_dragon/fireball_burst/choose
#

# Stop if no valid players
execute unless entity @p[gamemode=!spectator,gamemode=!creative,distance=..200] run return fail

# Fireball towards nearest player
# TODO: 1/5 chance that it's a dragon breath instead
# TODO: ExplosionPower higher
execute facing entity @p[gamemode=!spectator,gamemode=!creative,distance=..200] eyes positioned ^ ^ ^5 summon minecraft:fireball run function stardust:utils/compute_motion_towards {towards:1000,scale:0.001}

# Playsound for the targetted player
execute as @p[gamemode=!spectator,gamemode=!creative,distance=..200] at @s run playsound minecraft:entity.ender_dragon.shoot hostile @s

