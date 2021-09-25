#Mobs
	tp @e[type=ghast,distance=0..] 0 -10000 0
	execute as @e[type=#stardust:global,tag=!SF_DungeonDim,distance=0..] run function stardust:mobs/dungeon
#Dimensions
	gamemode adventure @a[gamemode=survival,tag=SF_IsInDungeon]
	execute as @a[tag=SF_IsInDungeon] unless entity @s[nbt={Dimension:"stardust:dungeon"}] run function stardust:dimensions/left_dungeon
#Locations
	execute as @a[x=-2.5,y=67,z=-2.5,dx=0,dz=0,distance=..0.5,nbt={SelectedItem:{tag:{SF_StardustDungeonKey:1s}}}] run function stardust:dimensions/enter_dungeon
	tp @a[x=105,y=92,z=-130,distance=..4,gamemode=adventure] 144 119.2 -79 -8 0
	tp @a[x=147,y=115,z=-48,distance=..4,gamemode=adventure] 142 129.2 -27 45 0
	tp @a[x=110,y=131,z=-13,distance=..4,gamemode=adventure] 87 144.2 28 115 -10
	execute as @a[x=64,y=148,z=23,distance=..4,gamemode=adventure] at @s run function stardust:boss/stardust_guardian/player
