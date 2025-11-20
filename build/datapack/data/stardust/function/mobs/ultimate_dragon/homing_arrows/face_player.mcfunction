
#> stardust:mobs/ultimate_dragon/homing_arrows/face_player
#
# @executed	at @s
#
# @within	stardust:mobs/ultimate_dragon/tick [ at @s ]
#

# Compute motion towards nearest player
execute facing entity @p[gamemode=!spectator,gamemode=!creative,distance=..96] eyes run function stardust:utils/compute_motion_towards {towards:1000,scale:0.001}

