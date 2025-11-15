
#> stardust:dimensions/dungeon/first_island
#
# @executed	as @a[x=-2.5,y=67,z=-2.5,dx=0,dz=0,distance=..0.5] & at @s
#
# @within	stardust:dimensions/dungeon/second [ as @a[x=-2.5,y=67,z=-2.5,dx=0,dz=0,distance=..0.5] & at @s ]
#

# Clear one key from player
clear @s *[custom_data~{stardust:{stardust_dungeon_key:true}}] 1

# Teleport in the air with slow falling
effect give @s slow_falling 5
tp @s 6 100 -11

# Playsound
playsound entity.player.levelup ambient @s 6 98 -11

# Grant advancement
advancement grant @s only stardust:visible/adventure/enter_stardust_dungeon

