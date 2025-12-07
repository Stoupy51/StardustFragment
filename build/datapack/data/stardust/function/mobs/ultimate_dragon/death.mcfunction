
#> stardust:mobs/ultimate_dragon/death
#
# @executed	as @e[type=item_display,tag=...] & at @s
#
# @within	stardust:mobs/display/start_dying
#

# Kill the 3 slaves and all remaining entities
execute at @n[tag=stardust.mob_entity,tag=stardust.ultimate_slave,limit=3] run playsound minecraft:entity.dragon_fireball.explode hostile @a[distance=..200]
execute at @n[tag=stardust.mob_entity,tag=stardust.ultimate_slave,limit=3] run particle minecraft:explosion_emitter ~ ~ ~ 1 1 1 0.0 5 force @a[distance=..200]
kill @n[tag=stardust.mob_entity,tag=stardust.ultimate_slave,limit=3]
kill @e[tag=stardust.short_lived_entity,distance=..500]
kill @e[tag=stardust.ultimate_poop,distance=..500]
kill @e[type=dragon_fireball,distance=..500]
kill @e[type=end_crystal,distance=..500]
kill @e[type=fireball,distance=..500]

# Die after 10 seconds (for reward)
scoreboard players set @s stardust.data 200
schedule function stardust:mobs/ultimate_dragon/finish_death_schedule 199t append

