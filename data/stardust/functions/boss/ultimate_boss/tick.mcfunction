
#> stardust:boss/ultimate_boss/tick
#
# @within			stardust:tick
# @executed			in stardust:ultimate
#
# @description		Function executed every tick in the ultimate boss fight.
#

# Particles management : witch particles for the arrows, dust particles for the dead dragons
execute at @e[type=arrow,tag=stardust.thrown] run particle witch ~ ~ ~ 0.25 0.25 0.25 0 1 force
execute at @e[tag=stardust.dragon_dead] run particle dust 0 0 0 2 ~ ~ ~ 10 10 10 0 50 force

# Prevents dead dragons from disappearing & applying phase 0 to the slave dragons
execute as @e[tag=stardust.dragon_dead] run data modify entity @s Health set value 512.0f
execute as @e[tag=stardust.dragon,tag=!stardust.ultimate_boss] run data modify entity @s DragonPhase set value 0

# Prevents dragons from flying too high (Y=150)
execute as @e[tag=stardust.dragon] at @s if entity @s[y=150,dy=800] run data modify entity @s Motion[1] set value -1.00d

# Dragon's fireball attack at players : 1 fireball every 30 score (see tick_second function)
execute at @e[tag=stardust.dragon,scores={stardust.data=30..}] as @a[gamemode=!creative,gamemode=!spectator,distance=..200] run function stardust:boss/ultimate_boss/fireball

# Check if orbs are destroyed
execute as @e[type=item_display,tag=stardust.ultimate_orb] run function stardust:boss/ultimate_boss/orb/check_destroy

