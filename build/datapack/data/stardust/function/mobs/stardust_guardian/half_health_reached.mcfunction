
#> stardust:mobs/stardust_guardian/half_health_reached
#
# @executed	at @s
#
# @within	stardust:mobs/stardust_guardian/second
#

# Remove tag to avoid repeated triggers
tag @s remove stardust.not_half_health

# Summon wave immediately on all players
execute as @a[distance=..25] at @s rotated ~ 0 run function stardust:mobs/stardust_guardian/summon_wave

