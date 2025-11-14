
#> stardust:mobs/stardust_pillar/deal_shield_damage
#
# @executed	at @r[gamemode=!spectator,distance=..96] & rotated ~ 0
#
# @within	stardust:mobs/stardust_pillar/summon_wave
#

# Decrease health by 5 and update entity health
scoreboard players remove #health stardust.data 5
execute store result entity @s Health float 1.0 run scoreboard players get #health stardust.data

