
#> stardust:mobs/stardust_guardian/summon_mob
#
# @executed	positioned ^0.00 ^ ^5.00
#
# @within	stardust:mobs/stardust_guardian/summon_wave [ positioned ^0.00 ^ ^5.00 ]
#			stardust:mobs/stardust_guardian/summon_wave [ positioned ^1.24 ^ ^4.84 ]
#			stardust:mobs/stardust_guardian/summon_wave [ positioned ^2.41 ^ ^4.38 ]
#			stardust:mobs/stardust_guardian/summon_wave [ positioned ^3.42 ^ ^3.64 ]
#			stardust:mobs/stardust_guardian/summon_wave [ positioned ^4.22 ^ ^2.68 ]
#			stardust:mobs/stardust_guardian/summon_wave [ positioned ^4.76 ^ ^1.55 ]
#			stardust:mobs/stardust_guardian/summon_wave [ positioned ^4.99 ^ ^0.31 ]
#			stardust:mobs/stardust_guardian/summon_wave [ positioned ^4.91 ^ ^-0.94 ]
#			stardust:mobs/stardust_guardian/summon_wave [ positioned ^4.52 ^ ^-2.13 ]
#			stardust:mobs/stardust_guardian/summon_wave [ positioned ^3.85 ^ ^-3.19 ]
#			stardust:mobs/stardust_guardian/summon_wave [ positioned ^2.94 ^ ^-4.05 ]
#			stardust:mobs/stardust_guardian/summon_wave [ positioned ^1.84 ^ ^-4.65 ]
#			stardust:mobs/stardust_guardian/summon_wave [ positioned ^0.63 ^ ^-4.96 ]
#			stardust:mobs/stardust_guardian/summon_wave [ positioned ^-0.63 ^ ^-4.96 ]
#			stardust:mobs/stardust_guardian/summon_wave [ positioned ^-1.84 ^ ^-4.65 ]
#			stardust:mobs/stardust_guardian/summon_wave [ positioned ^-2.94 ^ ^-4.05 ]
#			stardust:mobs/stardust_guardian/summon_wave [ positioned ^-3.85 ^ ^-3.19 ]
#			stardust:mobs/stardust_guardian/summon_wave [ positioned ^-4.52 ^ ^-2.13 ]
#			stardust:mobs/stardust_guardian/summon_wave [ positioned ^-4.91 ^ ^-0.94 ]
#			stardust:mobs/stardust_guardian/summon_wave [ positioned ^-4.99 ^ ^0.31 ]
#			stardust:mobs/stardust_guardian/summon_wave [ positioned ^-4.76 ^ ^1.55 ]
#			stardust:mobs/stardust_guardian/summon_wave [ positioned ^-4.22 ^ ^2.68 ]
#			stardust:mobs/stardust_guardian/summon_wave [ positioned ^-3.42 ^ ^3.64 ]
#			stardust:mobs/stardust_guardian/summon_wave [ positioned ^-2.41 ^ ^4.38 ]
#			stardust:mobs/stardust_guardian/summon_wave [ positioned ^-1.24 ^ ^4.84 ]
#

# Particles
particle minecraft:flame ~ ~ ~ 0.5 0.5 0.5 0.05 25

# Summon a random mob
execute store result score #random stardust.data run random value 1..10
execute if score #random stardust.data matches 1 positioned ~ ~-2 ~ summon minecraft:skeleton run return run function stardust:mobs/delay/spawn
execute if score #random stardust.data matches 2..5 positioned ~ ~-2 ~ summon minecraft:magma_cube run return run function stardust:mobs/delay/spawn
execute if score #random stardust.data matches 6.. positioned ~ ~-2 ~ summon minecraft:piglin_brute run return run function stardust:mobs/delay/spawn

