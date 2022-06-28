
execute if entity @s[tag=stardust.stardust_sniper] run particle dust 0 0 1 1 ~ ~ ~ .1 .1 .1 0 1
execute if entity @s[tag=stardust.awakened_stardust_sniper] run particle dust 1 0 0 1 ~ ~ ~ .1 .1 .1 0 1
execute if entity @s[tag=stardust.ultimate_sniper] run particle dust 255 255 255 1 ~ ~ ~ .1 .1 .1 0 1

tp @s ^ ^ ^0.5
execute as @e[dx=0,dy=3,dz=0,distance=..3,type=!player,tag=!stardust.shooted,tag=!global.ignore,tag=!global.ignore.kill,type=!item,type=!#energy:valid_block_entities,type=!enderman,nbt=!{Invulnerable:1b}] at @s run function stardust:right_click/snipers/damage
execute as @a[dx=0,dy=3,dz=0,distance=..3,tag=!stardust.shooter,tag=!stardust.shooted,gamemode=!spectator,gamemode=!creative] at @s run function stardust:right_click/snipers/damage

execute unless block ~ ~ ~ #stardust:non_solid run kill @s
execute if block ~ ~ ~ #stardust:non_solid at @s run function stardust:right_click/snipers/projectile_move
