
#> stardust:custom_blocks/celestial_portal/teleport_player
#
# @within	???
#

# Particles before teleport (x100)
scoreboard players set @s stardust.teleported 1
particle firework ~ ~2 ~ 0.25 1 0.25 0.05 500

# Try to teleport player to the nearest teleporter.
# If unable, create a new one in the destination dimension (excluding overworld)
execute unless function stardust:custom_blocks/celestial_portal/find_teleporter if dimension minecraft:overworld in stardust:celestial run function stardust:custom_blocks/celestial_portal/create_teleporter

# Stop function if not able to teleport (adding 1 to teleportation to try again a second later)
execute unless score @s stardust.teleported matches 1 run return run scoreboard players add @s stardust.teleportation 1

# Unforceload (still old location context here)
execute if dimension minecraft:overworld in stardust:celestial run forceload remove ~-50 ~-50 ~50 ~50
execute if dimension stardust:celestial in minecraft:overworld run forceload remove ~-50 ~-50 ~50 ~50

# Teleported sound and particles (x100)
execute at @s run playsound minecraft:block.portal.travel ambient @a[distance=..25] ~ ~ ~ 0.3
execute at @s run particle firework ~ ~2 ~ 0.25 1 0.25 0.05 500

