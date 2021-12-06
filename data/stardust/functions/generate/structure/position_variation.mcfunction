#Init values
	execute store result score X SE_Data run data get entity @s UUID[1]
	execute store result score Z SE_Data run data get entity @s UUID[3]
	scoreboard players operation NewX SE_Data = X SE_Data
	scoreboard players operation NewZ SE_Data = Z SE_Data
	execute store result score PosX SE_Data run data get entity @s Pos[0]
	execute store result score PosZ SE_Data run data get entity @s Pos[2]

#Edit X Pos : X can take a value between -40 & +40   Examples : -37.4, 14.3, 1, ...
	scoreboard players operation NewX SE_Data %= 400 SE_Data
	execute if score X SE_Data matches ..-1 run scoreboard players operation NewX SE_Data *= -1 SE_Data
	scoreboard players operation PosX SE_Data += NewX SE_Data

#Edit Z Pos : Z can take a value between -40 & +40   Examples : -37.4, 14.3, 1, ...
	scoreboard players operation NewZ SE_Data %= 400 SE_Data
	execute if score Z SE_Data matches ..-1 run scoreboard players operation NewZ SE_Data *= -1 SE_Data
	scoreboard players operation PosZ SE_Data += NewZ SE_Data

#Update Position
	execute store result entity @s Pos[0] double 1 run scoreboard players get PosX SE_Data
	execute store result entity @s Pos[2] double 1 run scoreboard players get PosZ SE_Data
