
advancement revoke @s only stardust:place/end_crystal

execute at @e[type=end_crystal,tag=!stardust.end_crystal,predicate=stardust:in_dim/ultimate] run setblock ~ ~ ~ fire
tag @e[type=end_crystal,predicate=stardust:in_dim/ultimate] add stardust.end_crystal

scoreboard players set #success stardust.data 0
execute in stardust:ultimate positioned -3 62 0 if entity @e[type=end_crystal,distance=..1] positioned 0 62 -3 if entity @e[type=end_crystal,distance=..1] positioned 3 62 0 if entity @e[type=end_crystal,distance=..1] positioned 0 62 3 if entity @e[type=end_crystal,distance=..1] run scoreboard players set #success stardust.data 1
execute if score #success stardust.data matches 0 in stardust:ultimate positioned -1 61 1 if entity @e[type=end_crystal,distance=..1] positioned 1 61 -1 if entity @e[type=end_crystal,distance=..1] run scoreboard players set #success stardust.data 1
execute if score #success stardust.data matches 0 in stardust:ultimate positioned -1 61 -1 if entity @e[type=end_crystal,distance=..1] positioned 1 61 1 if entity @e[type=end_crystal,distance=..1] run scoreboard players set #success stardust.data 1

execute if score #success stardust.data matches 1 run scoreboard players set #ultimate_summoning stardust.data 0
execute if score #success stardust.data matches 1 run schedule function stardust:boss/ultimate_boss/summoning/main 1t

