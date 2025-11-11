
#> stardust:custom_blocks/stardust_portal/teleport_player
#
# @within	???
#

# Particles before teleport (x100)
particle dust{color:[0,0,1],scale:1} ~ ~2 ~ 0.25 1 0.25 0.05 500

# Teleport the player
scoreboard players set @s stardust.teleported 1
# TODO
say teleporting @s via stardust_portal portal!

# Teleported sound and particles (x100)
execute at @s run playsound minecraft:block.portal.travel ambient @s ~ ~ ~ 0.3
#execute at @s run particle dust{color:[0,0,1],scale:1} ~ ~2 ~ 0.25 1 0.25 0.05 500

