
#> stardust:utils/compute_motion_towards
#
# @executed	facing entity @p[gamemode=!spectator,gamemode=!creative,distance=..96] eyes
#
# @within	stardust:mobs/stardust_pillar/launch_towards_player {towards:500,scale:0.001} [ facing entity @p[gamemode=!spectator,gamemode=!creative,distance=..96] eyes ]
#			stardust:mobs/ultimate_dragon/fireball_burst/on_new_ball {towards:1500,scale:0.001}
#			stardust:mobs/ultimate_dragon/homing_arrows/on_new_arrow {towards:1500,scale:0.001}
#			stardust:mobs/ultimate_dragon/homing_arrows/face_player {towards:1000,scale:0.001} [ facing entity @p[gamemode=!spectator,gamemode=!creative,distance=..96] eyes ]
#
# @args		towards (int)
#			scale (double)
#

# Compute motion towards
scoreboard players set @s bs.vel.x 0
scoreboard players set @s bs.vel.y 0
$scoreboard players set @s bs.vel.z $(towards)
function #bs.move:local_to_canonical

# Apply motion
$function #bs.move:set_motion {scale:$(scale)}

