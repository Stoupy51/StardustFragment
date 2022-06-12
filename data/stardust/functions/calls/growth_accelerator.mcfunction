
##Called by function tag #stardust:signals/growth_accelerator

scoreboard players set #boost stardust.data 1
execute as @e[type=glow_item_frame,tag=stardust.seed,tag=!stardust.seed_done] run function stardust:utils/seeds
scoreboard players reset #boost stardust.data

