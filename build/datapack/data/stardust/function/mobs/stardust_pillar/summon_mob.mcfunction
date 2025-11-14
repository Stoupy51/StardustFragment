
#> stardust:mobs/stardust_pillar/summon_mob
#
# @executed	positioned ^ ^ ^-2
#
# @within	stardust:mobs/stardust_pillar/summon_wave [ positioned ^ ^ ^-2 ]
#			stardust:mobs/stardust_pillar/summon_wave [ positioned ^1.5 ^ ^2 ]
#			stardust:mobs/stardust_pillar/summon_wave [ positioned ^-1.5 ^ ^2 ]
#			stardust:mobs/stardust_pillar/summon_wave [ positioned ^2 ^ ^-0.7 ]
#			stardust:mobs/stardust_pillar/summon_wave [ positioned ^-2 ^ ^-0.7 ]
#

# Particles
particle minecraft:soul_fire_flame ~ ~ ~ 0.5 0.5 0.5 0.05 25

# Summon a random stardust mob
execute store result score #random stardust.data run random value 1..15
execute if score #random stardust.data matches 1 positioned ~ ~-2 ~ summon bat run return run function stardust:mobs/delay/convert {"entity":"stardust_bat"}
execute if score #random stardust.data matches 2..5 positioned ~ ~-2 ~ summon evoker run return run function stardust:mobs/delay/convert {"entity":"stardust_evoker"}
execute if score #random stardust.data matches 6.. positioned ~ ~-2 ~ summon skeleton run return run function stardust:mobs/delay/convert {"entity":"stardust_soldier"}

