
#> stardust:custom_blocks/stardust_dungeon_portal/teleport_player
#
# @within	???
#

# Particles before teleport (x100)
particle dripping_dripstone_lava ~ ~2 ~ 0.25 1 0.25 0.05 1500

# Try to teleport player to the nearest teleporter.
# If unable, create a new one in the destination dimension (excluding overworld)
execute unless function stardust:custom_blocks/stardust_dungeon_portal/find_teleporter if dimension minecraft:overworld in stardust:dungeon run function stardust:custom_blocks/stardust_dungeon_portal/create_teleporter

# Unforceload (still old location context here)
execute if dimension minecraft:overworld in stardust:dungeon run forceload remove ~-50 ~-50 ~50 ~50
execute if dimension stardust:dungeon in minecraft:overworld run forceload remove ~-50 ~-50 ~50 ~50

# Teleported sound and particles (x100)
scoreboard players set @s stardust.teleported 1
execute at @s run playsound minecraft:block.portal.travel ambient @a[distance=..25] ~ ~ ~ 0.3
execute at @s run particle dripping_dripstone_lava ~ ~2 ~ 0.25 1 0.25 0.05 1500

