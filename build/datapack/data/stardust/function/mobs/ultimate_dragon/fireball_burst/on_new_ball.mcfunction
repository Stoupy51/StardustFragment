
#> stardust:mobs/ultimate_dragon/fireball_burst/on_new_ball
#
# @executed	facing entity @p[gamemode=!spectator,gamemode=!creative,distance=..200] eyes & positioned ^ ^ ^5
#
# @within	stardust:mobs/ultimate_dragon/fireball_burst/summon_command
#

# Add tags
tag @s add stardust.short_lived_entity
tag @s add stardust.fireball_burst

# If classic fireball, set explosion power
execute if entity @s[type=minecraft:fireball] run data modify entity @s ExplosionPower set value 4

# Set motion towards facing direction, and acceleration
function stardust:utils/compute_motion_towards {towards:1500,scale:0.001}

