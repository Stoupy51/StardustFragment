
#> stardust:mobs/stardust_pillar/summon_wave
#
# @executed	at @r[gamemode=!spectator,distance=..96] & rotated ~ 0
#
# @within	stardust:mobs/stardust_pillar/second [ at @r[gamemode=!spectator,distance=..96] & rotated ~ 0 ]
#

# Audio feedback meaning you're the target
playsound minecraft:entity.zombie.break_wooden_door hostile @a[distance=..25]
playsound minecraft:block.lava.extinguish ambient @a[distance=..25]

# Summon 5 mobs in a pentagon around the player
execute positioned ^ ^ ^-2 run function stardust:mobs/stardust_pillar/summon_mob
execute positioned ^1.5 ^ ^2 run function stardust:mobs/stardust_pillar/summon_mob
execute positioned ^-1.5 ^ ^2 run function stardust:mobs/stardust_pillar/summon_mob
execute positioned ^2 ^ ^-0.7 run function stardust:mobs/stardust_pillar/summon_mob
execute positioned ^-2 ^ ^-0.7 run function stardust:mobs/stardust_pillar/summon_mob

# Decrease health by 5 if shield is still active
execute if score #health stardust.data matches 251.. run function stardust:mobs/stardust_pillar/deal_shield_damage

