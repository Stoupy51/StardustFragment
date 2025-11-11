
#> stardust:custom_blocks/cavern_portal/second
#
# @executed	as @e[tag=stardust.second] & at @s
#
# @within	stardust:custom_blocks/second
#

# Energy checks
execute if score @s[tag=!stardust.infinite_energy] energy.storage < @s stardust.energy_rate run return 0
scoreboard players operation @s[tag=!stardust.infinite_energy] energy.storage -= @s stardust.energy_rate

# Particles
particle soul ~ ~2 ~ 0.25 1 0.25 0.05 1

# If there is a player standing on the portal, handle it
execute positioned ~ ~1 ~ as @a[distance=..1] at @s run function stardust:dimensions/portals/handle_player {"portal":"cavern_portal"}

