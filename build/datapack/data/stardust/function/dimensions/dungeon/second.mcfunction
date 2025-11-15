
#> stardust:dimensions/dungeon/second
#
# @executed	in stardust:dungeon
#
# @within	stardust:v3.5.0/second [ in stardust:dungeon ]
#

# Kill unwanted entities in the dungeon
tp @e[type=minecraft:ghast,y=0,tag=!smithed.strict,tag=!global.ignore.kill] 0 -10000 0
tp @e[type=minecraft:enderman,y=0,tag=!smithed.strict,tag=!global.ignore.kill] 0 -10000 0

# Teleport players holding keys
execute as @a[x=-2.5,y=67,z=-2.5,dx=0,dz=0,distance=..0.5] if items entity @s weapon.* *[custom_data~{stardust:{stardust_dungeon_key:true}}] at @s run function stardust:dimensions/dungeon/first_island

# Teleport players to the right location when entering lava portals
tp @a[x=105,y=92,z=-130,distance=..4,gamemode=!spectator] 144 119.2 -79 -8 0
tp @a[x=147,y=115,z=-48,distance=..4,gamemode=!spectator] 142 129.2 -27 45 0
tp @a[x=110,y=131,z=-13,distance=..4,gamemode=!spectator] 87 144.2 28 115 -10

# Last lava portal: Summon the boss and teleport players to the right location
execute as @a[x=64,y=148,z=23,distance=..4,gamemode=!spectator] at @s run function stardust:dimensions/dungeon/final_island

