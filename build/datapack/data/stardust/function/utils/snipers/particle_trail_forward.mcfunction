
#> stardust:utils/snipers/particle_trail_forward
#
# @executed	anchored eyes & positioned ^ ^ ^0.5
#
# @within	stardust:utils/snipers/raycast_in_your_ass [ anchored eyes & positioned ^ ^ ^0.5 ]
#			stardust:utils/snipers/particle_trail_forward [ positioned ^ ^ ^0.25 ]
#

scoreboard players remove #limit stardust.data 1
particle smoke ~ ~ ~ 0 0 0 0.01 1 force @a[distance=..128]
execute if score #limit stardust.data matches 1.. positioned ^ ^ ^0.25 run function stardust:utils/snipers/particle_trail_forward

