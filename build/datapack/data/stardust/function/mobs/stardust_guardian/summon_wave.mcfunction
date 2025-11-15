
#> stardust:mobs/stardust_guardian/summon_wave
#
# @executed	as @a[distance=..25] & at @s & rotated ~ 0
#
# @within	stardust:mobs/stardust_guardian/half_health_reached [ as @a[distance=..25] & at @s & rotated ~ 0 ]
#

# Audio feedback meaning you're the target
playsound minecraft:entity.zombie.break_wooden_door hostile @a[distance=..25]
playsound minecraft:block.lava.extinguish ambient @a[distance=..25]

# Summon 25 mobs in a circle around the player
execute positioned ^0.00 ^ ^5.00 run function stardust:mobs/stardust_guardian/summon_mob
execute positioned ^1.24 ^ ^4.84 run function stardust:mobs/stardust_guardian/summon_mob
execute positioned ^2.41 ^ ^4.38 run function stardust:mobs/stardust_guardian/summon_mob
execute positioned ^3.42 ^ ^3.64 run function stardust:mobs/stardust_guardian/summon_mob
execute positioned ^4.22 ^ ^2.68 run function stardust:mobs/stardust_guardian/summon_mob
execute positioned ^4.76 ^ ^1.55 run function stardust:mobs/stardust_guardian/summon_mob
execute positioned ^4.99 ^ ^0.31 run function stardust:mobs/stardust_guardian/summon_mob
execute positioned ^4.91 ^ ^-0.94 run function stardust:mobs/stardust_guardian/summon_mob
execute positioned ^4.52 ^ ^-2.13 run function stardust:mobs/stardust_guardian/summon_mob
execute positioned ^3.85 ^ ^-3.19 run function stardust:mobs/stardust_guardian/summon_mob
execute positioned ^2.94 ^ ^-4.05 run function stardust:mobs/stardust_guardian/summon_mob
execute positioned ^1.84 ^ ^-4.65 run function stardust:mobs/stardust_guardian/summon_mob
execute positioned ^0.63 ^ ^-4.96 run function stardust:mobs/stardust_guardian/summon_mob
execute positioned ^-0.63 ^ ^-4.96 run function stardust:mobs/stardust_guardian/summon_mob
execute positioned ^-1.84 ^ ^-4.65 run function stardust:mobs/stardust_guardian/summon_mob
execute positioned ^-2.94 ^ ^-4.05 run function stardust:mobs/stardust_guardian/summon_mob
execute positioned ^-3.85 ^ ^-3.19 run function stardust:mobs/stardust_guardian/summon_mob
execute positioned ^-4.52 ^ ^-2.13 run function stardust:mobs/stardust_guardian/summon_mob
execute positioned ^-4.91 ^ ^-0.94 run function stardust:mobs/stardust_guardian/summon_mob
execute positioned ^-4.99 ^ ^0.31 run function stardust:mobs/stardust_guardian/summon_mob
execute positioned ^-4.76 ^ ^1.55 run function stardust:mobs/stardust_guardian/summon_mob
execute positioned ^-4.22 ^ ^2.68 run function stardust:mobs/stardust_guardian/summon_mob
execute positioned ^-3.42 ^ ^3.64 run function stardust:mobs/stardust_guardian/summon_mob
execute positioned ^-2.41 ^ ^4.38 run function stardust:mobs/stardust_guardian/summon_mob
execute positioned ^-1.24 ^ ^4.84 run function stardust:mobs/stardust_guardian/summon_mob

