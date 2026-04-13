
#> stardust:mobs/stardust_bat/second
#
# @executed	at @s
#
# @within	stardust:mobs/loop/mob_second
#

# Every second, 10% chance to summon lightning at nearest player within 10 blocks
execute if predicate stardust:random/0.1 at @r[gamemode=!spectator,gamemode=!creative,distance=..10] run summon minecraft:lightning_bolt

