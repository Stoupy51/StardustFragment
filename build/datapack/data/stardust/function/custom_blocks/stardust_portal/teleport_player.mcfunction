
#> stardust:custom_blocks/stardust_portal/teleport_player
#
# @within	???
#

# Particles before teleport (x100)
scoreboard players set @s stardust.teleported 1
particle dust{color:[0,0,1],scale:1} ~ ~2 ~ 0.25 1 0.25 0.05 1500

# Try to teleport player to the nearest teleporter.
# If unable, create a new one in the destination dimension (excluding overworld)
execute unless function stardust:custom_blocks/stardust_portal/find_teleporter if dimension minecraft:overworld in stardust:stardust run function stardust:custom_blocks/stardust_portal/create_teleporter

# Stop function if not able to teleport (adding 1 to teleportation to try again a second later)
execute unless score @s stardust.teleported matches 1 run return run scoreboard players add @s stardust.teleportation 1

# Unforceload (still old location context here)
execute if dimension minecraft:overworld in stardust:stardust run forceload remove ~-50 ~-50 ~50 ~50
execute if dimension stardust:stardust in minecraft:overworld run forceload remove ~-50 ~-50 ~50 ~50

# Teleported sound and particles (x100)
execute at @s run playsound minecraft:block.portal.travel ambient @a[distance=..25] ~ ~ ~ 0.3
execute at @s run particle dust{color:[0,0,1],scale:1} ~ ~2 ~ 0.25 1 0.25 0.05 1500

