
#> stardust:utils/snipers/particle_trail
#
# @executed	at @s & as @p[tag=stardust.shooter] & facing entity @s eyes
#
# @within	stardust:utils/snipers/on_targeted_block [ at @s & as @p[tag=stardust.shooter] & facing entity @s eyes ]
#			stardust:utils/snipers/particle_trail [ positioned ^ ^ ^0.25 ]
#

# Particles and continue if player not reached
scoreboard players remove #limit stardust.data 1
particle smoke ~ ~ ~ 0 0 0 0.01 1 force @a[distance=..128]
execute if score #limit stardust.data matches 1.. unless entity @s[distance=..1.5] positioned ^ ^ ^0.25 run function stardust:utils/snipers/particle_trail

