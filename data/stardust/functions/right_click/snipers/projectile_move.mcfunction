
#> stardust:right_click/snipers/projectile_move
#
# @within			stardust:right_click/snipers/all
# @within			stardust:right_click/snipers/projectile_move (recursive)
# @executed			as & at bullet marker
#
# @description		Manage projectile movement : collisions and particles
#

# Force particles to all players in same dimension, particles color depending on the sniper type
execute if entity @s[tag=stardust.stardust_sniper] run particle dust 0 0 1 1 ~ ~ ~ .1 .1 .1 0 1 force @a[distance=0..]
execute if entity @s[tag=stardust.awakened_stardust_sniper] run particle dust 1 0 0 1 ~ ~ ~ .1 .1 .1 0 1 force @a[distance=0..]
execute if entity @s[tag=stardust.ultimate_sniper] run particle dust 255 255 255 1 ~ ~ ~ .1 .1 .1 0 1 force @a[distance=0..]

# Go forward and check for collisions with entities
tp @s ^ ^ ^0.5
execute as @e[dx=0,dy=3,dz=0,distance=..3,type=!player,tag=!stardust.shooted,tag=!global.ignore,tag=!global.ignore.kill,tag=!smithed.entity,tag=!smithed.strict,type=!item,type=!#energy:valid_block_entities,type=!enderman,nbt=!{Invulnerable:1b}] at @s run function stardust:right_click/snipers/damage
execute as @a[dx=0,dy=3,dz=0,distance=..3,tag=!stardust.shooter,tag=!stardust.shooted,tag=!global.ignore,tag=!global.ignore.kill,tag=!smithed.entity,tag=!smithed.strict,gamemode=!spectator,gamemode=!creative] at @s run function stardust:right_click/snipers/damage

# Stop case if hit a block, otherwise call again this function
execute unless block ~ ~ ~ #stardust:non_solid run kill @s
execute if block ~ ~ ~ #stardust:non_solid at @s run function stardust:right_click/snipers/projectile_move

