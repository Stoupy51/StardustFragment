
#> stardust:dimensions/dungeon/final_island
#
# @executed	as @a[x=64,y=148,z=23,distance=..4,gamemode=!spectator] & at @s
#
# @within	stardust:dimensions/dungeon/second [ as @a[x=64,y=148,z=23,distance=..4,gamemode=!spectator] & at @s ]
#

# Teleport to boss area
tp @s 81.0 169.2 -51.0

# If no Stardust Guardian, summon one
execute unless entity @e[tag=stardust.stardust_guardian,distance=..200] positioned 68.0 169.69 -31 run function stardust:mobs/stardust_guardian/summon

