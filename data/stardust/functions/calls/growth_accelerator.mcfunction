
##Called by function tag #stardust:signals/growth_accelerator

scoreboard players set #boost stardust.data 1
execute positioned ~-10 ~-10 ~-10 as @e[tag=stardust.seed,tag=!stardust.seed_done,dx=20,dy=20,dz=20] run function stardust:utils/seeds
scoreboard players reset #boost stardust.data

